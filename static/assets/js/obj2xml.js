/**
  * @param obj
 * @returns {string}
 */
function obj2xml(obj) {
    let xml = "<"+obj.name;
    if(obj.attributes) {
        for(let attr in obj.attributes) {
            xml += " "+attr+"='"+obj.attributes[attr]+"'";
        }
    }
    if((!obj.val || obj.val==="") && (!obj.children || !obj.children.length)) {
        xml += "/>";
        return xml;
    }
    xml += ">";

    if(obj.val) {
        xml += obj.val;
    }

    if(obj.children && obj.children.constructor===Array) {
        obj.children.forEach(function (item) {
            xml += obj2xml(item);
        });
    }
    xml += "</"+obj.name + ">";
    return xml;

}