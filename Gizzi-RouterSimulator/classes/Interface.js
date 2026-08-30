class Interface {

    // constructor
    constructor(name, ip, mask) {
        this.name = name
        this.ip = ip
        this.mask = mask
    }

    // method

    /**
    * Restituisce una stringa rappresentativa dell'interfaccia.
    * @returns {string} Formattata come "name: ip/mask"
    */
    toString() {
        return `${this.name}: ${this.ip}/${this.mask}`
    }
}