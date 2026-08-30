class Router {

    //constructor

    constructor(name,status,tdi) {
        this.name = name
        this.status = status
        this.tdi = tdi
        this.interfaces = []
    }


    // methods

    /**
    * Restituisce una stringa con tutte le informazioni del router.
    * @returns {string} Nome, stato, interfacce e TDI formattati
    */
    toString() {
        let string = `Router: ${this.name}\n`;
        string += `Status: ${this.status}\n`;
        string += `Interfaces:\n`;
        string += this.interfaces.map(i => i.toString()).join("\n");
        string += `\ntdi:\n`;
        string += this.tdi.toString();
        return string;
    }

    /**
    * Aggiunge un'interfaccia al router.
    * @param {Interface} int - Oggetto Interface da aggiungere
    */
    addInterface(int) {
        this.interfaces.push(int);
    }

    /**
    * Rimuove un'interfaccia dal router tramite indice.
    * @param {number} index - Indice dell'interfaccia da rimuovere
    */
    removeInterface(index) {
        this.interfaces.splice(index, 1);
    }
}  