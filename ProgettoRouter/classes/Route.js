class Route {
    constructor(destination, mask, nextHop) {
        this.destination = destination
        this.mask = mask
        this.nextHop = nextHop
    }

    toString() {
        return `${this.destination}/${this.mask} -> ${this.nextHop}`;
    }
}