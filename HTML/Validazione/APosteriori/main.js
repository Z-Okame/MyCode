let lettereMinuscole="abcdefghijklmnopqrstuvwxyz";
let lettereMaiuscole="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
let numeri="0123456789";
let speciali="!@#$%^&*-_";

function controlloNominativo() {
    let username = document.getElementById("username").value;
    for (let i = 0; i < username.length; i++) {
        if ((!lettereMinuscole.includes(username[i]) && !lettereMaiuscole.includes(username[i])) || username[i] !== " ") {
            document.getElementById("errorUsername").innerText = "Il nominativo può solo contenere lettere e spazi";
            return;
        }
    }
    document.getElementById("errorUsername").innerText = "";
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
        errorPassword += "La password deve essere lunga almeno " + minLength + " caratteri.\n";
    }

    for (let i = 0; i < password.length; i++) {
        if (lettereMinuscole.includes(password[i])) hasLetter = true;
        else if (lettereMaiuscole.includes(password[i])) hasCaps = true;
        else if (numeri.includes(password[i])) hasNumber = true;
        else if (speciali.includes(password[i])) hasSpecial = true;
    }

    if (!hasLetter) {
        document.getElementById("errorPassword").innerText += "La password deve contenere almeno una lettera minuscola.\n";
    }
    if (!hasCaps) {
        document.getElementById("errorPassword").innerText += "La password deve contenere almeno una lettera maiuscola.\n";
    }
    if (!hasNumber) {
        document.getElementById("errorPassword").innerText += "La password deve contenere almeno un numero.\n";
    }
    if (!hasSpecial) {
        document.getElementById("errorPassword").innerText += "La password deve contenere almeno un carattere speciale.\n";
    }
    
    document.getElementById("errorPassword").innerText = "";

}

function controlloAnni() {
    let anni = document.getElementById("age").value;
    let errorAge = "";
    if (anni < 0) {
        errorAge += "L'età non può essere negativa.\n";
    }
    else if (anni > 100) {
        errorAge += "L'età non può essere superiore a 100.\n";
    }

    if (!(anni >= 18 && anni <= 100)) {
        errorAge += "L'età deve essere compresa tra 18 e 100 anni.\n";
    }

    document.getElementById("errorAge").innerText = errorAge;
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

document.getElementById("submit").addEventListener("click", controlloPassword);
document.getElementById("submit").addEventListener("click", controlloNominativo);
document.getElementById("submit").addEventListener("click", controlloAnni);
document.getElementById("showPassword").addEventListener("click", ShowPassword);
