class Router {
    constructor(name,status,tdi) {
        this.name = name
        this.status = status
        this.tdi = tdi
        this.interfaces = []
    }

    toString() {
        let string = `Router: ${this.name}\n`;
        string += `Status: ${this.status}\n`;
        string += `Interfaces:\n`;
        string += this.interfaces.map(i => i.toString()).join("\n");
        string += `\ntdi:\n`;
        string += this.tdi.toString();
        return string;
    }

    addInterface(int) {
        this.interfaces.push(int);
    }

    removeInterface(index) {
        this.interfaces.splice(index, 1);
    }
}  