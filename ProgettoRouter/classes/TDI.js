class TDI {
    constructor() {
        this.routes = []
    }

    addRoute(r) {
        this.routes.push(r)
    }

    removeRoute(index) {
        this.routes.splice(index,1)
    }

    toString() {
        string = ""
        for (let i = 0; i < this.routes.length; i++) {
            string += this.routes[i].toString() + "\n"
        }
        return string
    }
}