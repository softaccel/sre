(function ($) {
    /**
     *
     * @param options {placeholder:null,url:null,labelfld;null}
     */
    $.fn.select2wrapper = function(options) {
        if(this.hasClass("select2")) {
            this.select2('destroy');
        }
        console.log("#####################",options)

        this.select2({
            placeholder: options.placeholder?options.placeholder:"",
            allowClear: options.allowClear?options.allowClear:true,
            ajax:{
                url: options.url,
                minimumInputLength: 2,
                dataType: 'json',
                data: (params)=>{
                    let limit = 5;
                    let p = {
                        "page[partners][offset]":params.page?(params.page-1)*limit:0,
                        "page[partners][limit]":limit
                    };
                    if(params.term) {
                        p.filter = options.labelfld+"~=~" + params.term;
                    }
                    return p;
                },
                processResults: function (data) {
                    let result = {results:[]};
                    data.data.forEach(function (item) {
                        result.results.push({
                            id: typeof options.idfld==="undefined" ? item.id :
                                (typeof options.idfld==="function" ? options.idfld(item) : item.attributes[options.idfld]),
                            text: typeof options.labelfld==="function" ? options.labelfld(item) : item.attributes[options.labelfld],
                        })
                    });
                    return result;
                }
            }
        });
    }
})($);

