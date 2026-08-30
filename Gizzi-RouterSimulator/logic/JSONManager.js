class JSONManager {
    
    // methods

    /**
    * Esporta la configurazione del router in un file JSON scaricabile.
    * @param {Router} router - Il router da esportare
    */
    ExportJSON(router) {
        const json = JSON.stringify(router, null, 2)
        const blob = new Blob([json], { type: "application/json" })
        const a = document.createElement("a")
        a.href = URL.createObjectURL(blob)
        a.download = `${router.name}-config.json`
        a.click()
    }

    /**
    * Importa la configurazione di un router da una stringa JSON
    * e ricostruisce tutti gli oggetti (Router, TDI, Route, Interface).
    * @param {string} jsonString - Stringa JSON da parsare
    * @returns {Router} Il router ricostruito con TDI e interfacce
    */
    ImportJSON(jsonString) {
        const data = JSON.parse(jsonString)
        
        const tdi = new TDI()
        for (let i = 0; i < data.tdi.routes.length; i++) {
            const r = data.tdi.routes[i]
            tdi.addRoute(new Route(r.destination, r.mask, r.nextHop))
        }
        
        const router = new Router(data.name, data.status, tdi)
        for (let i = 0; i < data.interfaces.length; i++) {
            const iface = data.interfaces[i]
            router.addInterface(new Interface(iface.name, iface.ip, iface.mask))
        }
        
        return router
    }
}