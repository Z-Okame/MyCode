class Route {

    // constructor
    constructor(destination, mask, nextHop) {
        this.destination = destination
        this.mask = mask
        this.nextHop = nextHop
    }


    //method
    
    /**
    * Restituisce una stringa rappresentativa della route.
    * @returns {string} Formattata come "destination/mask -> nextHop"
    */
    toString() {
        return `${this.destination}/${this.mask} -> ${this.nextHop}`;
    }
}