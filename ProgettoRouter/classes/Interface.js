class Interface {
    constructor(name, ip, mask) {
        this.name = name
        this.ip = ip
        this.mask = mask
    }

    toString() {
        return `${this.name}: ${this.ip}/${this.mask}`
    }
}