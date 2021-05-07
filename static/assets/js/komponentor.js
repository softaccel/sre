/**
 *
 */
(function ($) {
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
        window.location.reload();
    };


    /**
     *
     * @param opts
     * @returns {Promise<unknown>}
     */
    $.fn.komponent = function (opts) {
        if(typeof opts==="undefined") {
            opts = {};
        }

        let options = this.data();
        if(typeof options==="undefined") {
            options = {};
        }
        console.log(this,options,opts);
        Object.assign(options,opts);
        options.$el = this;

        return new Promise(function (resolve, reject) {
            Komponent(options)
                .then(function (k) {
                    if(!k) {
                        return;
                    }
                    k.$el.data("komponent",k);
                    resolve(k);
                })
                .catch(function (msg) {
                    options.$el.html("Failed to load Komponent");
                    reject(msg);
                })
                .finally(function () {
                    options.$el.removeData("locked");
                });
        });

    };

    /**
     * creates a Komponent
     * @param $el
     * @param parent
     * @returns {null|{parent: *, $el: *}}
     * @constructor
     */
    function Komponent(options) {
        let kmp = {
            $el: null,
        };

        delete options["komponent"];

        Object.assign(kmp,options);

        return new Promise(function (resolve,reject) {
            if(kmp.$el && (kmp.$el.data("komponent") || kmp.$el.data("locked"))) {
                resolve(options.$el.data("komponent"));
                return;
            }

            if(kmp.$el) {
                kmp.$el.data("locked",true);
            }

            komponentor
                .fetchKomponent(kmp)
                .then(function (data) {
                    let init_result = renderKomponent(kmp,data);
                    resolve(kmp,init_result);
                })
                .catch(function (msgObj) {
                    reject(msgObj)
                });
        });
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
     * @param data
     * @param options
     * @returns {Promise<unknown>}
     */
    function renderKomponent(k,data)
    {
        let dummy = $("<div>").appendTo("body");
        let $renderedKomponent = $(data).appendTo(dummy);
        $renderedKomponent = $renderedKomponent.remove();
        dummy.remove();

        let initFunc = typeof init_komponent==="function" ? init_komponent : new Function();
        delete init_komponent;

        if(k.$el && $renderedKomponent.length) {
            if(k.replace) {
                let id = k.$el.attr("id");
                k.$el.replaceWith($renderedKomponent);
                k.$el = $renderedKomponent;
                k.$el.attr("id",id);
            }
            else {
                k.$el.append($renderedKomponent);
            }
        }

        if(!k.$el) {
            k.$el = $renderedKomponent;
        }

        k.$el.data("komponent",k).attr("is","komponent");

        return initFunc(k);
    }

    /**
     *
     * @returns {Promise<unknown>}
     * @param opts
     */
    komponentor.fetchKomponent = function(options)
    {
        return new Promise((resolve,reject)=>{

            if(!options.url) {
                reject({reason: "No Komponent URL provided",options:options,this:this});
            }

            // prepend kPath & append extension
            let url = (typeof _kPath !=="undefined"?_kPath:"") + options.url;
            let fileName = options.url.split("/").pop();
            if(fileName.length && fileName.indexOf(".")===-1 && typeof _kExt !== "undefined") {
                url += _kExt;
            }


            if(options.url.indexOf("?")===-1) {
                url += "?v=1";
            }

            // load component
            $.get(url)
                .done(function (responseData) {
                    resolve(responseData);
                })
                .fail(function (xhr) {
                    reject({reason: "fail to initiate component because failed ajax request",xhr: xhr, request: options});
                });
        });
    };

    /**
     *
     * @param container
     * @returns {Promise<unknown[]>}
     */
    function loadKomponents(container)
    {
        let ps = [];
        $(container).find("[is=komponent]").each(function () {
            ps.push($(this).komponent());
        });

        return Promise.all(ps);
    }


    /**
     * default behaviour is to autoload komponents
     */
    $(document).ready(function () {
        if(typeof autoload!== "undefined" && !autoload) {
            return;
        }

        loadKomponents("body");
    });


    /**
     *
     * @param url
     * @param options
     * @returns {{data: data, options: (function(*): obj), send: (function(): Promise<unknown>), url: (function(*): obj)}}
     */
    komponentor.intent = function (url)
    {

        let init_data = {data:{}};
        let _data = {};

        let obj = {
            url: function(url) {
                init_data.url = url;
                return this;
            },
            data: function (attr,val) {
                if(typeof attr==="object") {
                    Object.assign(init_data.data,attr);
                    return this;
                }
                init_data.data[attr] = val;
                return this;
            },
            send: function (data) {
                if(data) {
                    obj.data(data);
                }
                // add overlay
                return   Komponent(init_data);
            }
        };

        if(url) {
            obj.url(url);
        }

        return  obj;
    };


    komponentor.sendIntent = function(options)
    {
        komponentor.fetchKomponent(options)
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
    };

    komponentor.loadKomponents = function(container)
    {
        return loadKomponents(container);
    }

})($);
