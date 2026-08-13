const ipRegex = /^((25[0-5]|2[0-4]\d|1\d{2}|[1-9]\d|\d)\.){3}(25[0-5]|2[0-4]\d|1\d{2}|[1-9]\d|\d)$/

class Controller {
    constructor() {
        this.router = null
        this.hud = new HUD()
    }

    setup() {
        document.getElementById("btn-create-router").addEventListener("click", () => this.routerCreation())
        document.getElementById("btn-add-int").addEventListener("click", () => this.interfaceCreation())
        document.getElementById("btn-add-route").addEventListener("click", () => this.TDICreation())
        document.getElementById("btn-show-tdi").addEventListener("click", () => {
            if (!this.router) {
                alert("Crea prima un Router!")
                return
            }
            this.hud.renderTDI(this.router)
        })
    }

    routerCreation() {
        const name = document.getElementById("router-name-input").value
        if (name == "") {
            alert("Inserisci un nome per il router!")
            return
        }
        const tdi = new TDI()
        this.router = new Router(name, true, tdi)
        this.hud.renderRouter(this.router)
        document.getElementById("router-creation").style.display = "none"
    }

    interfaceCreation() {
        if (!this.router) {
            alert("Crea prima un Router!")
            return
        }
        const name = document.getElementById("int-name-input").value
        const ip = document.getElementById("int-ip-input").value
        if (name == "" || ip == "") {
            alert("Compila tutti i campi!")
            return
        }
        if (!ipRegex.test(ip)) {
            alert("IP non valido!")
            return
        }
        const iface = new Interface(name, ip, true)
        this.router.addInterface(iface)
        this.hud.renderInterface(this.router, iface)
    }

    routeCreation() {
        const dest = document.getElementById("route-dest-input").value
        const mask = document.getElementById("route-mask-input").value
        const nextHop = document.getElementById("route-nexthop-input").value
        if (dest == "" || mask == "" || nextHop == "") {
            alert("Compila tutti i campi!")
            return null
        }
        if (!ipRegex.test(dest) || !ipRegex.test(mask) || !ipRegex.test(nextHop)) {
            alert("IP non valido!")
            return null
        }
        return new Route(dest, mask, nextHop)
    }

    TDICreation() {
        if (!this.router) {
            alert("Crea prima un Router!")
            return
        }
        const route = this.routeCreation()
        if (route == null) return
        for (let i = 0; i < this.router.tdi.routes.length; i++) {
            if (this.router.tdi.routes[i].destination === route.destination &&
                this.router.tdi.routes[i].mask === route.mask) {
                alert("Route già esistente!")
                return
            }
        }
        this.router.tdi.addRoute(route)
        this.hud.renderTDI(this.router)
    }
}