let template_label = `^XA
^FX Second section with recipient address and permit information.
^CFA,25
^FO75,25,0^FD%line1%^FS
^FO75,50,0^FD%line2%^FS
^FO75,75,0^FD%line3%^FS
^FO75,100,0^FD%line4%^FS

^CFA,30

^FO75,150,0^FDBN: %bn%^FS
^FO75,175,0^FDNC: %nc%^FS
^FO75,200,0^FDZN: %zn%^FS
^FO75,225,0^FDTN: %tn%^FS


^BY2,3.0,150
^FO750,150,1^BCN,100,Y,N,N^FD%barcode_string%^FS
^XZ`

function gen_random_barcode (){
    let x = Math.floor((Math.random() * (10**12)) + 10**11);
    while(x > 10**12){
        x /= 10;
        x = Math.floor(x);
    }
    return x.toString();
}

function gen_barcode_from_data (bn, tn){
    return tn + bn;
}

function create_label(title, bn, nc, zn, tn, seq_no) {
    /*
    * Trebuie aleasa una dintre variante sau o a treia.
    */

    let barcode = gen_random_barcode() + "-" + seq_no; // gen_barcode_from_data (bn, tn);


    let cpy_template;
    cpy_template = template_label.replace("%line1%", title.substr(0, 38))
        .replace("%line2%", title.substr(38, 76))
        .replace("%line3%", title.substr(76, 114))
        .replace("%line4%", title.substr(114, 152))
        .replace("%bn%", bn)
        .replace("%nc%", nc)
        .replace("%zn%", zn)
        .replace("%tn%", tn)
        .replace("%barcode_string%", barcode);

    return {label: cpy_template, barcode: barcode};

}

function send_to_printer (label){
    urlLabel = "http://127.0.0.1:5000/print_label/"

    $.ajax({
        url: urlLabel+label,
        type: "PUT",
        crossDomain: true,
        headers: {  'Access-Control-Allow-Origin': "http://127." },
        success: function(data){
            console.log("mere");
        },
        error: function() {
            console.log("nu gata")}
    });
}