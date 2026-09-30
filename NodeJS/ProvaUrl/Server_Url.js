//script server_http_hello.js 

const http= require("http")
let counter = 0;
//ip del server, fai richiesta a questo
const hostname = '127.0.0.1';
const port = 3000;

function requestHandler(req,res) {
	if (req.url === "/") {
		counter++;
		res.end("Benvenuto nella Home Page visitatore: " + counter + "\n Prova: \n -/Html\n -/JSON\n o provane un'altro per un errore...");
	}
	else if (req.url === "/JSON") {
		res.setHeader("Content-Type","application/JSON");
		res.end(JSON.stringify({"messaggio":"Ciao, benvenuto nel JSON"}));;
	}
	else if (req.url == "/Html") {
		 res.end("<h1>Benvenuto nella pagina Html<h1>");
	}
	else {
		res.end("errore: url non trovato");
	}
}
const server = http.createServer(requestHandler);
server.listen(port,hostname,function() {
	console.log('Server running at https.//${hostname}:${port}/');
});