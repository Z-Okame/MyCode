const ipRegex = /^((25[0-5]|2[0-4]\d|1\d{2}|[1-9]\d|\d)\.){3}(25[0-5]|2[0-4]\d|1\d{2}|[1-9]\d|\d)$/

class Controller {
    constructor() {
        this.router = null
        this.hud = new HUD()
        this.logic = new RoutingLogic()
        this.jsonManager = new JSONManager()
    }

    setup() {
        document.getElementById("btn-create-router").addEventListener("click", () => this.routerCreation())
        document.getElementById("btn-add-int").addEventListener("click", () => this.interfaceCreation())
        document.getElementById("btn-add-route").addEventListener("click", () => this.TDICreation())
        document.getElementById("btn-export").addEventListener("click", () => this.exportConfig())
        document.getElementById("btn-import").addEventListener("click", () => this.importConfig())
    }

    exportConfig() {
        if (!this.router) {
            alert("Crea prima un Router!")
            return
        }
        this.jsonManager.ExportJSON(this.router)
    }

    importConfig() {
        const input = document.createElement("input")
        input.type = "file"
        input.accept = ".json"
        input.addEventListener("change", (e) => {
            const file = e.target.files[0]
            const reader = new FileReader()
            reader.onload = (e) => {
                this.router = this.jsonManager.ImportJSON(e.target.result)
                this.hud.renderRouter(this.router)
                for (let i = 0; i < this.router.interfaces.length; i++) {
                    this.hud.renderInterface(this.router, this.router.interfaces[i])
                }
                this.hud.renderTDI(this.router)
                document.getElementById("router-creation").style.display = "none"
            }
            reader.readAsText(file)
        })
        input.click()
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

        const nuovaSubnet = this.logic.andMask(route.destination, route.mask)
        for (let i = 0; i < this.router.tdi.routes.length; i++) {
            const subnetEsistente = this.logic.andMask(this.router.tdi.routes[i].destination, this.router.tdi.routes[i].mask)
            if (nuovaSubnet === subnetEsistente) {
                alert("Subnet già esistente!")
                return
            }
        }

        this.router.tdi.addRoute(route)
        this.hud.renderTDI(this.router)
    }
}