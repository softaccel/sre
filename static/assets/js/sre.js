function exportInstanceDataAsFile(src, type) {
    let url = {};
    console.log(src,$(src).data());
    let instance = $(src).data().instance;
    Object.assign(url,instance.url);
    url.parameters["page["+instance.type+"][limit]"] = 10000;
    url.parameters["outputFormat"] = type;
    url.parameters["includetablehead"] = true;

    $("<a>").attr("href",url.toString()).appendTo("body")[0].click().remove();
}


function logout() {
    userData = null;
    localData.jwt  = null;
    localStorage.setItem("spaleck",JSON.stringify(localData));
    location = location.pathname;
}


function reloadApiator(src) {
    $($(src).data("target")).data("instance").loadFromRemote().then(function () {
        let onload = $(src).data("onload");
        if(onload && typeof onload===Function) {
            onload(src);
        }
    });
}


function checkAuth() {
    let localData = {

    };
    let userData;
    Object.assign(localData,JSON.parse(localStorage.getItem(localStorageLabel)));

    if(localData.jwt) {
        try {
            userData = jwt_decode(localData.jwt);
            let d = new Date();
            if(d.getTime()/1000>userData.exp) {
                logout();
            }
        }
        catch($e) {
            // console.log($e);
        }
    }
    return [localData,userData];
}

function toggleAll(src) {
    let checked = $(src).prop("checked");
    $($(src).data("connected")).children().each(function (i) {
        toggleSelect(this,checked);
    });
}

function toggleSelect(src,state) {
    state = state!==undefined?state:!$(src).hasClass('selected');
    $(src).find("input[type=checkbox]").prop("checked",state);
    if(state) {
        $(src).addClass('selected').find("input[type=checkbox]").prop("checked",true);
    }
    else {
        $(src).removeClass('selected');
    }
    let tmp = $("#orderPartsList").children();
    $($(src).data("connected")).prop("checked",(tmp.length===tmp.filter(".selected").length));
}

/**
 * setarea environment-ului se face in Consola cu
 * localStorage.setItem("spaleck.env","denumire_environment")
 *
 * Evident "denumire_environment" trebuie sa se regaseasca in env_config de mai jos
 */


let environment;


// let localData,userData;
let [localData,userData] = checkAuth();

autoload = false;
let backendUrl, apiRoot, authUrl, fileApiUrl, deseneBaseUrl;


let p1 = new Promise((resolve,reject)=>
    $.get(envsFile)
        .done(function (data) {
            resolve(data);
        })
        .fail(function (data) {
            reject(data);
        })
);
let p2 = new Promise((resolve,reject)=>
    $.get(activeEnvFile)
        .done(function (data) {
            resolve(data);
        })
        .fail(function (data) {
            reject(data);
        })
);


Promise.all([p1,p2])
    .then((values)=>{
        let environments,active;
        [environments,active] = values;
        active = active.active;
        environment = environments[active];
        backendUrl = environments[active].backendUrl;
        apiRoot = environments[active].feDBapiUrl;
        authUrl = environments[active].authUrl;
        fileApiUrl = environments[active].fileApiUrl;
        deseneBaseUrl = environments[active].deseneBaseUrl;


        if(typeof appUrl==="undefined") {
            appUrl = defaultAppUrl;
        }

        if(!userData && (typeof guestOk==="undefined" || !guestOk)) {
            appUrl = loginAppUrl;
        }
        // return;

        if(appUrl!=="")
            $("#page").komponent({url:appUrl,replace:false}).finally(function () {
                $(".pageOverlay").remove();
            });
        else
            $(".pageOverlay").remove();

    })
    .catch((a)=>{
        console.log(a);
        alert("Failed to load configuration");
    });
