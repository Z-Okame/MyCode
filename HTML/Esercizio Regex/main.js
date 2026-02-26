const regexNomeCompleto = /^[a-zA-Z ]{3,}$/;
const regexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
const regexTelefono = /^\d{10}$/;
const regexBudget = /^[1-9]\d*$/; 

function controlloNomeCompleto() {
    let nomeCompleto = document.getElementById("nomeCompleto").value;
    
    if (!regexNomeCompleto.test(nomeCompleto)) {
        alert("Il nome completo deve avere almeno 3 caratteri e deve contenere solo lettere e spazi");
        return false;
    }
    
    return true;
}

function controlloEmail() {
    let email = document.getElementById("email").value;
    
    if (!regexEmail.test(email)) {
        alert("L'email non è in formato valido");
        return false;
    }
    
    return true;
}

function controlloTelefono() {
    let telefono = document.getElementById("telefono").value;
    
    if (!regexTelefono.test(telefono)) {
        alert("Il telefono deve essere di 10 cifre");
        return false;
    }
    
    return true;
}

function controlloBudget() {
    let budget = document.getElementById("budget").value;
    
    if (!regexBudget.test(budget)) {
        alert("Il budget deve essere un numero positivo");
        return false;
    }
    
    return true;
}

function controlloServizi() {
    let html = document.getElementById("html").checked;
    let php = document.getElementById("php").checked;
    let asp = document.getElementById("asp").checked;
    let java = document.getElementById("java").checked;
    let cpp = document.getElementById("cpp").checked;
    
    if (!html && !php && !asp && !java && !cpp) {
        alert("Devi selezionare almeno un servizio");
        return false;
    }
    
    return true;
}

function validaForm(e) {

    let isNomeCompletoValid = controlloNomeCompleto();
    let isEmailValid = controlloEmail();
    let isTelefonoValid = controlloTelefono();
    let isBudgetValid = controlloBudget();
    let isServiziValid = controlloServizi();
    
    if (isNomeCompletoValid && isEmailValid && isTelefonoValid && isBudgetValid && isServiziValid) {
        mostraRiepilogo();
    }
}

function mostraRiepilogo() {
    let nomeCompleto = document.getElementById("nomeCompleto").value;
    let email = document.getElementById("email").value;
    let telefono = document.getElementById("telefono").value;
    let budget = document.getElementById("budget").value;
    const servizi = [];
    let costo = 0;

    
    if (document.getElementById("html").checked) {
        servizi.push("HTML (€20/ora)");
        costo += 20 * 10;
    }
    if (document.getElementById("php").checked) {
        servizi.push("PHP (€25/ora)");
        costo += 25 * 10;
    }
    if (document.getElementById("asp").checked) {
        servizi.push("ASP (€30/ora)");
        costo += 30 * 10;
    }
    if (document.getElementById("java").checked) {
        servizi.push("Java (€35/ora)");
        costo += 35 * 10;
    }
    if (document.getElementById("cpp").checked) {
        servizi.push("C++ (€40/ora)");
        costo += 40 * 10;
    }


    let riepilogo = `
        <p>Nome completo: ${nomeCompleto}</p>
        <p>Email: ${email}</p>
        <p>Telefono: ${telefono}</p>
        <p>Budget: €${budget}</p>
        <p>Servizi selezionati: ${servizi.join(", ")}</p>
    `;

    riepilogo += `<p>Costo Stimato (10 ore): €${costo}</p>`;
    
    if (costo > budget) {
        riepilogo += `<p>Attenzione: il costo stimato supera il budget.</p>`;
    } else {
        riepilogo += `<p>Il costo stimato rientra nel budget.</p>`;
    }
    
    document.getElementById("riepilogoDati").innerHTML = riepilogo;
}

document.getElementById("submit").addEventListener("click", validaForm); 