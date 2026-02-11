let lettereMinuscole="abcdefghijklmnopqrstuvwxyz";
let lettereMaiuscole="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
let numeri="0123456789";
let speciali="!@#$%^&*-_";

function controlloNominativo() {
    let username = document.getElementById("username").value;
    
    if (username == "") {
        document.getElementById("errorUsername").innerText = "\nIl nominativo è obbligatorio";
        return false;
    }
    
    for (let i = 0; i < username.length; i++) {
        if (!lettereMinuscole.includes(username[i]) && !lettereMaiuscole.includes(username[i]) && username[i] !== " ") {
            document.getElementById("errorUsername").innerText = "\nIl nominativo può solo contenere lettere e spazi";
            return false;
        }
    }
    
    document.getElementById("errorUsername").innerText = "";
    return true;
}

function controlloPassword() {
    let password = document.getElementById("password").value;
    let errorPassword = "";
    let hasLetter = false;
    let hasCaps = false;
    let hasNumber = false;
    let hasSpecial = false;
    let minLength = 8;

    if (password.length < minLength) {
        errorPassword += "\nLa password deve essere lunga almeno " + minLength + " caratteri.\n";
    }

    for (let i = 0; i < password.length; i++) {
        if (lettereMinuscole.includes(password[i])) hasLetter = true;
        else if (lettereMaiuscole.includes(password[i])) hasCaps = true;
        else if (numeri.includes(password[i])) hasNumber = true;
        else if (speciali.includes(password[i])) hasSpecial = true;
    }

    if (!hasLetter) {
        errorPassword += "\nLa password deve contenere almeno una lettera minuscola.\n";
    }
    if (!hasCaps) {
        errorPassword += "\nLa password deve contenere almeno una lettera maiuscola.\n";
    }
    if (!hasNumber) {
        errorPassword += "\nLa password deve contenere almeno un numero.\n";
    }
    if (!hasSpecial) {
        errorPassword += "\nLa password deve contenere almeno un carattere speciale.\n";
    }
    
    document.getElementById("errorPassword").innerText = errorPassword;
    
    if (errorPassword == "") {
        return true;
    } else {
        return false;
    }
}

function controlloAnni() {
    let anni = document.getElementById("age").value;
    
    if (anni == "") {
        document.getElementById("errorAge").innerText = "\nL'età è obbligatoria";
        return false;
    } else if (anni < 18) {
        document.getElementById("errorAge").innerText = "\nDevi avere almeno 18 anni";
        return false;
    } else if (anni > 100) {
        document.getElementById("errorAge").innerText = "\nL'età non può essere superiore a 100 anni";
        return false;
    }

    document.getElementById("errorAge").innerText = "";
    return true;
}

function controlloConsenso() {
    let consent = document.getElementById("consent").checked;
    let errorConsent = "";
    
    if (!consent) {
        errorConsent = "\nDevi acconsentire all'utilizzo dei dati personali";
    }
    
    document.getElementById("errorConsent").innerText = errorConsent;
    return consent;
}

function validaForm(e) {
    e.preventDefault();
    
    let isNominativoValid = controlloNominativo();
    let isPasswordValid = controlloPassword();
    let isAnniValid = controlloAnni();
    let isConsensoValid = controlloConsenso();
    
    if (isNominativoValid && isPasswordValid && isAnniValid && isConsensoValid) {
        window.location.href = "success.html";
    }
}

function ShowPassword() {
    let passwordInput = document.getElementById("password");
    let eyeOpen = document.getElementById("eyeOpen");
    let eyeClosed = document.getElementById("eyeClosed");

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        eyeOpen.style.display = "block";
        eyeClosed.style.display = "none";
    } else {
        passwordInput.type = "password";
        eyeOpen.style.display = "none";
        eyeClosed.style.display = "block";
    }
}

document.getElementById("password").addEventListener("input", controlloPassword);
document.getElementById("username").addEventListener("input", controlloNominativo);
document.getElementById("age").addEventListener("input", controlloAnni);
document.getElementById("consent").addEventListener("change", controlloConsenso);
document.getElementById("registrationForm").addEventListener("submit", validaForm);