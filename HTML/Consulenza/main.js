const REGEX_UTENTE = /^[A-Za-z ]{3,}$/;
const REGEX_PASSWORD = /^[A-Za-z0-9]{8,}$/; 
const REGEX_TELEFONO = /^\d{10}$/;
const REGEX_URL = /^www\.[A-Za-z0-9-]+\.[A-Za-z]{2,}$/;
const REGEX_DATA = /^\d{4}-\d{2}-\d{2}$/;

function validaUtente() {
    let utente = document.getElementById("nomeUtente").value.trim();

    if (!REGEX_UTENTE.test(utente)) {
        document.getElementById("errorNomeUtente").innerText = "Inserisci almeno 3 lettere";
        return false;
    }

    document.getElementById("errorNomeUtente").innerText = "";
    return true;
}

function validaPassword() {
    let password = document.getElementById("password").value.trim();

    if (!REGEX_PASSWORD.test(password)) {
        document.getElementById("errorPassword").innerText = "Minimo 8 caratteri, solo lettere e numeri";
        return false;
    }

    document.getElementById("errorPassword").innerText = "";
    return true;
}

function validaTelefono() {
    let telefono = document.getElementById("telefono").value.trim();

    if (!REGEX_TELEFONO.test(telefono)) {
        document.getElementById("errorTelefono").innerText = "Il telefono deve avere 10 cifre";
        return false;
    }

    document.getElementById("errorTelefono").innerText = "";
    return true;
}

function validaUrl() {
    let url = document.getElementById("sitoWeb").value.trim();

    if (!REGEX_URL.test(url)) {
        document.getElementById("errorSitoWeb").innerText = "Formato richiesto: www.domain.com";
        return false;
    }

    document.getElementById("errorSitoWeb").innerText = "";
    return true;
}

function validaConsulenze() {
    let almenoUna =
        document.getElementById("linux").checked ||
        document.getElementById("windows").checked ||
        document.getElementById("android").checked ||
        document.getElementById("database").checked;

    if (!almenoUna) {
        document.getElementById("errorConsulenze").innerText = "Seleziona almeno una consulenza";
        return false;
    }

    document.getElementById("errorConsulenze").innerText = "";
    return true;
}

function validaData() {
    let data = document.getElementById("dataRichiesta").value.trim();

    if (!REGEX_DATA.test(data)) {
        document.getElementById("errorData").innerText = "Inserisci una data valida";
        return false;
    }

    if (data <= "2026-01-31") {
        document.getElementById("errorData").innerText = "La data deve essere dopo gennaio 2026";
        return false;
    }

    document.getElementById("errorData").innerText = "";
    return true;
}

function controllaSeWeekend() {
    let dataInput = document.getElementById("dataRichiesta");
    let data = new Date(dataInput.value.trim());
    let giornoSettimana = data.getDay();

    if (giornoSettimana === 6) {
        data.setDate(data.getDate() + 2);
        dataInput.value = data.getFullYear() + "-" + String(data.getMonth() + 1).padStart(2, "0") + "-" + String(data.getDate()).padStart(2, "0");
        document.getElementById("risultatiContent").innerHTML += "<p>La data era di sabato, spostata a lunedi.</p>";
    } else if (giornoSettimana === 0) {
        data.setDate(data.getDate() + 1);
        dataInput.value = data.getFullYear() + "-" + String(data.getMonth() + 1).padStart(2, "0") + "-" + String(data.getDate()).padStart(2, "0");
        document.getElementById("risultatiContent").innerHTML += "<p>La data era di domenica, spostata a lunedi.</p>";
    }
}

function costruisciRiepilogo() {
    let risultatiContent = document.getElementById("risultatiContent");
    let utenteOk = validaUtente();
    let passwordOk = validaPassword();
    let telefonoOk = validaTelefono();
    let urlOk = validaUrl();
    let consulenzeOk = validaConsulenze();
    let dataOk = validaData();

    if (!utenteOk || !passwordOk || !telefonoOk || !urlOk || !consulenzeOk || !dataOk) {
        risultatiContent.innerHTML = "<p class='errorRiepilogo'>Correggi i campi evidenziati.</p>";
        return;
    }

    risultatiContent.innerHTML = "";
    controllaSeWeekend();

    const consulenzeScelte = [];
    if (document.getElementById("linux").checked) {
        consulenzeScelte.push(document.getElementById("linux").value);
    }
    if (document.getElementById("windows").checked) {
        consulenzeScelte.push(document.getElementById("windows").value);
    }
    if (document.getElementById("android").checked) {
        consulenzeScelte.push(document.getElementById("android").value);
    }
    if (document.getElementById("database").checked) {
        consulenzeScelte.push(document.getElementById("database").value);
    }

    let riepilogo = "";
    riepilogo += "<p><strong>Nome Utente:</strong> " + document.getElementById("nomeUtente").value.trim() + "</p>";
    riepilogo += "<p><strong>Password:</strong> valida</p>";
    riepilogo += "<p><strong>Telefono:</strong> " + document.getElementById("telefono").value.trim() + "</p>";
    riepilogo += "<p><strong>URL:</strong> " + document.getElementById("sitoWeb").value.trim() + "</p>";
    riepilogo += "<p><strong>Organizzazione:</strong> " + document.getElementById("nomeOrganizzazione").value.trim() + "</p>";
    riepilogo += "<p><strong>Consulenze:</strong> " + consulenzeScelte.join(", ") + "</p>";
    riepilogo += "<p><strong>Data:</strong> " + document.getElementById("dataRichiesta").value.trim() + "</p>";

    risultatiContent.innerHTML += riepilogo;
}

document.getElementById("nomeUtente").addEventListener("input", validaUtente);
document.getElementById("password").addEventListener("input", validaPassword);
document.getElementById("telefono").addEventListener("input", validaTelefono);
document.getElementById("sitoWeb").addEventListener("input", validaUrl);
document.getElementById("dataRichiesta").addEventListener("change", validaData);

document.getElementById("linux").addEventListener("change", validaConsulenze);
document.getElementById("windows").addEventListener("change", validaConsulenze);
document.getElementById("android").addEventListener("change", validaConsulenze);
document.getElementById("database").addEventListener("change", validaConsulenze);

document.getElementById("submitBtn").addEventListener("click", costruisciRiepilogo);
