class TDI {

    // constructor
    constructor() {
        this.routes = []
    }

    // methods

    /**
    * Aggiunge una route alla tabella.
    * @param {Route} r - Oggetto Route da aggiungere
    */
    addRoute(r) {
        this.routes.push(r)
    }

    /**
    * Rimuove una route dalla tabella tramite indice.
    * @param {number} index - Indice della route da rimuovere
    */
    removeRoute(index) {
        this.routes.splice(index,1)
    }

    /**
    * Restituisce una stringa con tutte le route della tabella.
    * @returns {string} Elenco delle route, una per riga
    */
    toString() {
        string = ""
        for (let i = 0; i < this.routes.length; i++) {
            string += this.routes[i].toString() + "\n"
        }
        return string
    }
}