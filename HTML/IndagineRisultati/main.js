const regex_utente = /^[A-Za-z ]+$/;
const regex_classe = /^[0-9][A-Z]$/;
let punteggio = 0;
const punteggioCorretto = 1.5;

function validaNome() {
    let nome = document.getElementById("nomeCognome").value;
    if (!regex_utente.test(nome)) {
        document.getElementById("errorNomeCognome").textContent = "Nome non valido";
        return false;
    }

    document.getElementById("errorNomeCognome").textContent = "";
    return true;
}

function validaClasse() {
    let classe = document.getElementById("classe").value;
    if (!regex_classe.test(classe)) {
        document.getElementById("errorClasse").textContent = "Classe non valida";
        return false;
    }

    document.getElementById("errorClasse").textContent = "";
    return true;
}

function checkDomanda1() {
    const rispostaA = document.getElementById("d1a");
    const rispostaB = document.getElementById("d1b");
    const rispostaC = document.getElementById("d1c");
    const rispostaD = document.getElementById("d1d");

    if (!rispostaA.checked && !rispostaB.checked && !rispostaC.checked && !rispostaD.checked) {
        document.getElementById("errorDomanda1").textContent = "Seleziona una risposta";
        return false;
    }
    document.getElementById("errorDomanda1").textContent = "";
    return true;
}

function checkDomanda2() {
    const rispostaA = document.getElementById("d2a");
    const rispostaB = document.getElementById("d2b");
    const rispostaC = document.getElementById("d2c");
    const rispostaD = document.getElementById("d2d");

    if (!rispostaA.checked && !rispostaB.checked && !rispostaC.checked && !rispostaD.checked) {
        document.getElementById("errorDomanda2").textContent = "Seleziona una risposta";
        return false;
    }
    document.getElementById("errorDomanda2").textContent = "";
    return true;
}

function checkDomanda3() {
    const rispostaA = document.getElementById("d3a");
    const rispostaB = document.getElementById("d3b");
    const rispostaC = document.getElementById("d3c");
    const rispostaD = document.getElementById("d3d");

    if (!rispostaA.checked && !rispostaB.checked && !rispostaC.checked && !rispostaD.checked) {
        document.getElementById("errorDomanda3").textContent = "Seleziona una risposta";
        return false;
    }
    document.getElementById("errorDomanda3").textContent = "";
    return true;
}

function costruisciRiepilogo() {
    let riepilogo = document.getElementById("risultatiContent");

    let nomeOk = validaNome();
    let classeOk = validaClasse();
    let d1Ok = checkDomanda1();
    let d2Ok = checkDomanda2();
    let d3Ok = checkDomanda3();

    if (!nomeOk || !classeOk || !d1Ok || !d2Ok || !d3Ok) {
        riepilogo.innerHTML = "Compila tutti i campi correttamente.";
        return;
    }

    // Ricalcolo punteggio da zero ad ogni invio
    punteggio = 0;
    if (document.getElementById("d1c").checked) punteggio += punteggioCorretto;
    if (document.getElementById("d2a").checked) punteggio += punteggioCorretto;
    if (document.getElementById("d3b").checked) punteggio += punteggioCorretto;

    let stringaRiepilogo = "";
    stringaRiepilogo += "<p>Nome: " + document.getElementById("nomeCognome").value + "</p>";
    stringaRiepilogo += "<p>Classe: " + document.getElementById("classe").value + "</p>";
    stringaRiepilogo += "<p>Punteggio: " + punteggio + "</p>";
    stringaRiepilogo += "<p>Domanda 1: " + (d1Ok ? "Corretta" : "Sbagliata") + "</p>";
    stringaRiepilogo += "<p>Domanda 2: " + (d2Ok ? "Corretta" : "Sbagliata") + "</p>";
    stringaRiepilogo += "<p>Domanda 3: " + (d3Ok ? "Corretta" : "Sbagliata") + "</p>";
    if (punteggio >= 0 && punteggio <= 1.5) {
        stringaRiepilogo += "<p><strong>Risultato scarso</strong></p>";
    }
    else if (punteggio > 1.5 && punteggio <= 3) {
        stringaRiepilogo += "<p><strong>Buon risultato</strong></p>";
    }
    else {
        stringaRiepilogo += "<p><strong>Ottimo risultato</strong></p>";
    }
    riepilogo.innerHTML = stringaRiepilogo;
}

//Event Listener

//Nome e classe
document.getElementById("nomeCognome").addEventListener("input", validaNome);
document.getElementById("classe").addEventListener("input", validaClasse);

//Domanda 1
document.getElementById("d1a").addEventListener("change", checkDomanda1);
document.getElementById("d1b").addEventListener("change", checkDomanda1);
document.getElementById("d1c").addEventListener("change", checkDomanda1);
document.getElementById("d1d").addEventListener("change", checkDomanda1);
//Domanda 2 
document.getElementById("d2a").addEventListener("change", checkDomanda2);
document.getElementById("d2b").addEventListener("change", checkDomanda2);
document.getElementById("d2c").addEventListener("change", checkDomanda2);
document.getElementById("d2d").addEventListener("change", checkDomanda2);
//Domanda 3
document.getElementById("d3a").addEventListener("change", checkDomanda3);
document.getElementById("d3b").addEventListener("change", checkDomanda3);
document.getElementById("d3c").addEventListener("change", checkDomanda3);
document.getElementById("d3d").addEventListener("change", checkDomanda3);

//Riepilogo
document.getElementById("submitBtn").addEventListener("click", costruisciRiepilogo);
