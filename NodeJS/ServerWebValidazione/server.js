const fs = require("fs");
const http = require("http");
const url = require("url");
const querystring = require("querystring");

const hostname = '127.0.0.1';
const port = 3000;

const regioni = [
    "Abruzzo", "Basilicata", "Calabria", "Campania", "Emilia-Romagna",
    "Friuli-Venezia Giulia", "Lazio", "Liguria", "Lombardia", "Marche",
    "Molise", "Piemonte", "Puglia", "Sardegna", "Sicilia", "Toscana",
    "Trentino-Alto Adige", "Umbria", "Valle d'Aosta", "Veneto"
];

function valida(query) {
    const regexNome = /^[a-zA-Z\s]+$/;
    const regexMatricola = /^\d{5}$/;
    const regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const regexTelefono = /^\+?\d{6,15}$/;

    const cognome = query.cognome || "";
    const nome = query.nome || "";
    const matricola = query.matricola || "";
    const regione = query.regione || "";
    const email = query.email || "";
    const telefono = query.telefono || "";
    const richieste = query.richieste || "";

    const isCognomeValido = cognome !== "" && regexNome.test(cognome);
    const isNomeValido = nome !== "" && regexNome.test(nome);
    const isMatricolaValida = regexMatricola.test(matricola);
    const isRegioneValida = regione !== "";
    const isContattoPresente = email !== "" || telefono !== "";
    const isEmailValida = email === "" || regexEmail.test(email);
    const isTelefonoValido = telefono === "" || regexTelefono.test(telefono.replace(/\s/g, ""));

    return {
        invia: !isCognomeValido || !isNomeValido || !isMatricolaValida ||
               !isRegioneValida || !isContattoPresente ||
               !isEmailValida || !isTelefonoValido,
        isCognomeValido,
        isNomeValido,
        isMatricolaValida,
        isRegioneValida,
        isContattoPresente,
        isEmailValida,
        isTelefonoValido,
        cognome,
        nome,
        matricola,
        regione,
        email,
        telefono,
        richieste
    };
}

function generaHtml(esito) {
    let messaggio = `
	<html>
	<head>
		<title>Contatti</title>
	</head>
	<body>
		<form action="recuperadati" method="POST">
		`;
    if (!esito.isCognomeValido) {
			messaggio += `
			<label for="cognome" style="color:red;">Cognome:</label><br>
			<input type="text" id="cognome" name="cognome" value="" size="40" maxlength="40" style="border: 1px solid red;">&nbsp;Inserisci un cognome valido<br><br>`;
    } else {
			messaggio += `
			<label for="cognome">Cognome:</label><br>
			<input type="text" id="cognome" name="cognome" value="${esito.cognome}" size="40" maxlength="40"><br><br>`;
    }
    if (!esito.isNomeValido) {
			messaggio += `
			<label for="nome" style="color:red;">Nome:</label><br>
			<input type="text" id="nome" name="nome" value="" size="30" maxlength="30" style="border: 1px solid red;">&nbsp;Inserisci un nome valido<br><br>`;
    } else {
			messaggio += `
			<label for="nome">Nome:</label><br>
			<input type="text" id="nome" name="nome" value="${esito.nome}" size="30" maxlength="30"><br><br>`;
    }
    if (!esito.isMatricolaValida) {
			messaggio += `
			<label for="matricola" style="color:red;">Matricola:</label><br>
			<input type="text" id="matricola" name="matricola" value="" size="12" maxlength="12" style="border: 1px solid red;">&nbsp;La matricola deve avere 5 cifre<br><br>`;
    } else {
			messaggio += `
			<label for="matricola">Matricola:</label><br>
			<input type="text" id="matricola" name="matricola" value="${esito.matricola}" size="12" maxlength="12"><br><br>`;
    }
    if (!esito.isRegioneValida) {
			messaggio += `
			<label for="regione" style="color:red;">Regione di residenza:</label><br>`;
    } else {
			messaggio += `
			<label for="regione">Regione di residenza:</label><br>`;
    }
    messaggio += `
			<select id="regione" name="regione">
				<option value="">-- Seleziona --</option>`;
    for (let i = 0; i < regioni.length; i++) {
        if (esito.regione === regioni[i]) {
            messaggio += `
				<option value="${regioni[i]}" selected>${regioni[i]}</option>`;
        } else {
            messaggio += `
				<option value="${regioni[i]}">${regioni[i]}</option>`;
        }
    }
    messaggio += `
			</select>`;
    if (!esito.isRegioneValida) {
        messaggio += `&nbsp;<span style="color:red;">Seleziona una regione</span>`;
    }
    messaggio += `<br><br>`;
    if (!esito.isEmailValida) {
			messaggio += `
			<label for="email" style="color:red;">Email:</label><br>
			<input type="text" id="email" name="email" value="" size="30" maxlength="30" style="border: 1px solid red;">&nbsp;Inserisci un'email valida<br><br>`;
    } else if (!esito.isContattoPresente) {
			messaggio += `
			<label for="email" style="color:red;">Email:</label><br>
			<input type="text" id="email" name="email" value="" size="30" maxlength="30" style="border: 1px solid red;">&nbsp;Inserisci almeno email o telefono<br><br>`;
    } else {
			messaggio += `
			<label for="email">Email:</label><br>
			<input type="text" id="email" name="email" value="${esito.email}" size="30" maxlength="30"><br><br>`;
    }
    if (!esito.isTelefonoValido) {
			messaggio += `
			<label for="telefono" style="color:red;">Telefono:</label><br>
			<input type="text" id="telefono" name="telefono" value="" size="15" maxlength="15" style="border: 1px solid red;">&nbsp;Inserisci un numero di telefono valido<br><br>`;
    } else if (!esito.isContattoPresente) {
			messaggio += `
			<label for="telefono" style="color:red;">Telefono:</label><br>
			<input type="text" id="telefono" name="telefono" value="" size="15" maxlength="15" style="border: 1px solid red;">&nbsp;Inserisci almeno email o telefono<br><br>`;
    } else {
			messaggio += `
			<label for="telefono">Telefono:</label><br>
			<input type="text" id="telefono" name="telefono" value="${esito.telefono}" size="15" maxlength="15"><br><br>`;
    }
		messaggio += `
		<label for="richieste">Richieste particolari:</label><br>
		<textarea id="richieste" name="richieste" rows="12" cols="60">${esito.richieste}</textarea><br><br>
		<input type="submit" value="Invia">
		<input type="reset" value="Reset"></form>
		</body>
		</html>`;
    return messaggio;
}

function requestHandler(request, response) {
    let oggettourl = url.parse(request.url, true);
    console.log(oggettourl.href);
    const path = oggettourl.pathname;
    console.log(path);

    switch (path) {
        case '/':
        case '/contatti.html':
            fs.readFile('contatti.html', function(error, data) {
                if (error) {
                    response.writeHead(404);
                } else {
                    response.writeHead(200, { "Content-Type": "text/html" });
                    response.write(data, "utf8");
                }
                response.end();
            });
            break;

        case '/recuperadati':
            let corpo = "";
            request.on('data', function(chunk) {
                corpo += chunk;
            });
            request.on('end', function() {
                const esitoValidazione = valida(querystring.parse(corpo));

                if (esitoValidazione.invia) {
                    const paginaHtml = generaHtml(esitoValidazione);
                    response.writeHead(200, { 'Content-Type': 'text/html' });
                    response.write(paginaHtml);
                    response.end();
                } else {
                    response.writeHead(200, { 'Content-Type': 'text/plain' });
                    response.write('Form compilato in modo corretto');
                    response.end();
                }
            });
            break;

        default:
            response.writeHead(404);
            response.end();
    }
}

const server = http.createServer(requestHandler);
server.listen(port, hostname, function () {
    console.log(`Server running at http://${hostname}:${port}/`);
});