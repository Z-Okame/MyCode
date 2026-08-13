class Interface {
    constructor(name, ip, status) {
        this.name = name
        this.ip = ip
        this.status = status
    }

    toString() {
        return `${this.name}: ${this.ip}, STATUS: ${this.status ? "UP" : "DOWN"}`;
    }
}