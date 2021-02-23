/**
 *
 */
(function () {
    window.komponentor = {
        components: {},
        path: null
    };

    komponentor.routing = (function(){
        let tmp = window.location.hash;
        let res = {
            path: null,
            paras: {}
        };

        if(!tmp)
            return res;
        tmp = tmp.substr(1);
        let paras = tmp.split("|");
        res.path = paras.shift();
        res.paras = paras;
        return res;
    })();


    window.onhashchange = function (el) {
        console.log(el,this);
        window.location.reload();
    };

    /**
     *
     * @param $el
     * @param parent
     * @returns {null|{parent: *, $el: *}}
     * @constructor
     */
    function Komponent($el,parent) {
        // console.log("init komponent",$el,parent,Komponent.caller);
        if($el.hasOwnProperty("$el"))
            return  $el;

        if($el.hasOwnProperty("length") && $el.data("komponent"))
            return $el.data("komponent");

        let data = {
            $el: $el,
            parent: parent,
            komponents: {}
        };

        if(parent) {
            if(parent.hasOwnProperty("length")) {
                // is jquery el
                if(parent.data("komponent"))
                    parent = parent.data("komponent");
                else
                    parent = Komponent(parent);
            }

            if(!parent.hasOwnProperty("$el")) {
                return null;
            }

            data.parent = parent;
        }

        let dataAttrs = $el.data();
        delete dataAttrs["komponent"];
        Object.assign(data,);

        if(!$el.attr("id") && $el.data("url")) {
            $el.attr("id","k"+$el.data("url").hashCode());
        }

        if(data.parent)
            data.parent.komponents[$el.attr("id")] = data;

        $el.data("komponent",data);

        return $el.data("komponent");
    }

    String.prototype.hashCode = function()
    {
        var hash = 0, i, chr;
        if (this.length === 0) return hash;
        for (i = 0; i < this.length; i++) {
            chr   = this.charCodeAt(i);
            hash  = ((hash << 5) - hash) + chr;
            hash |= 0; // Convert to 32bit integer
        }
        return Math.abs(hash);
    };

    /**
     *
     * @param cId
     * @param data
     * @param el
     * @returns {*}
     */
    function loadKomponent(options, data)
    {
        return new Promise( (resolve,reject)=>{
            let cId = "k"+options.url.hashCode();

            // no default container, create one on document root
            if(!options.$el) {
                if(!options.hasOwnProperty("parent"))
                    reject({reason: "Could not load component: invalid parent",options:options});

                options.$el = $("<div>").appendTo(options.parent.$el).css("display", "none");
            }

            if(!options.$el.attr('id'))
                options.$el.attr("id", cId);


            if(options.$el.data("replace")) {
                options.$el.replaceWith($(data));
            }
            else {
                options.$el.html(data);
            }

            let k = Komponent(options.$el,options.parent);

            let initFunc = typeof init==="function" ? init : new Function();

            if(k.hasOwnProperty("loadrecursive") && k.loadrecursive === "inhibit") {
                initFunc(k,data);
                return resolve(k);
            }

            loadKomponents(k.$el)
                .then(()=>{
                    initFunc(k,data);
                    resolve(k);
                })
                .catch((a)=>{
                    reject(a)
                });
        })
    }

    /**
     *

     * @param el
     * @returns {Promise<unknown>}
     */
    komponentor.getKomponent = function(opts)
    {
        return new Promise((resolve,reject)=>{
            let options = {
                $el:null,
                url:null,
                parent: $("body")
            };

            Object.assign(options,opts);
            // console.log("get component",opts);

            if(options.$el && options.$el.data("komponent")) {
                resolve(options.$el.data("komponent"));
                return;
            }

            if(!options.url)
                options.url = options.$el?options.$el.data("url"):null;

            if (!options.url && !options.$el) {
                reject({reason: "reject because no $el and no URL",options: options});
                return;
            }

            if(options.$el && !options.url) {
                resolve(Komponent(options.$el,options.parent));
                return
            }

            options.parent = Komponent(options.parent);

            let cid = "k"+options.url.hashCode();
            if(options.parent && options.parent.komponents.hasOwnProperty(cid)) {
                resolve(options.parent.komponents[cid]);
                return;
            }

            // prepend kPath
            let url = (typeof _kPath !=="undefined"?_kPath:"") + options.url;
            let fileName = options.url.split("/").pop();
            if(fileName.length && fileName.indexOf(".")===-1 && typeof _kExt !== "undefined") {
                url += _kExt;
            }
            console.log(url);

            if(options.url.indexOf("?")===-1)
                url += "?v=1";

            // load component
            $.get(url)
                .done(function (data) {
                    loadKomponent(options,data)
                        .then((comp)=>resolve(comp))
                        .catch((cause)=>{
                            reject(cause)
                        });
                })
                .fail(function (xhr) {
                    reject({reason: "fail to initiate component because failed ajax request",xhr: xhr,request: options});
                });
        });
    };

    /**
     *
     * @param parent
     * @returns {Promise<unknown>}
     */
    function loadKomponents(parent)
    {
        let parentKomponent = $(parent).data("komponent");

        if(!parentKomponent)
            parentKomponent = Komponent($(parent));

        return new Promise(
            function(resolve,reject)
            {
                let deep=0,counter=0;
                $(parent).find("[is=komponent]").each(function () {
                    counter++;
                    komponentor.getKomponent({$el:$(this),parent:$(parent)})
                        .then((komponent) => {
                            parentKomponent.komponents[komponent.$el.attr("id")] = komponent;
                        })
                        .catch((cause)=>{
                            reject(cause)
                        })
                        .finally((a) => {
                            counter--
                        });
                });

                function wait(to) {
                    deep++;
                    if(deep>10) {
                        resolve();
                        return;
                    }
                    setTimeout(()=> {
                        if(counter>0)
                            wait(to);
                        else
                            resolve();
                    },to);
                }

                wait(200);
            });
    }


    $(document).ready(function () {
        loadKomponents("body");
    });


    komponentor.intent = function (url) {
        let int = {
            _url: url,
            _data: {},
            url: function(url) {
                int._url = url;
                return this;
            },
            data: function (attr,val) {
                if(typeof attr==="object") {
                    int._data = attr;
                    return int;
                }
                int.data[attr] = val;
                return this;
            },
            send: function () {
                komponentor.sendIntent({url:int._url,data:int._data});
                return this;
            }
        };

        return  int;
    };


    komponentor.sendIntent = function(options)
    {
        let $overlay = $("<div class='pageOverlay'><div class='spinner'></div></div>").appendTo("body");

        setTimeout(()=>{
            komponentor.getKomponent(options)
                .then(  function (c) {
                    if(!c)
                        return;
                    if(c.hasOwnProperty("exec"))
                        c.exec(options.data);
                })
                .catch(function (v) {
                    console.log("could not load",v,options);
                })
                .finally(()=>{
                    $overlay.remove();
                });
        },200)

    }
})();
