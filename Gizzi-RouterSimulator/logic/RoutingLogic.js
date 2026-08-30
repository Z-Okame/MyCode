class RoutingLogic {

    // methods

    /**
    * Esegue l'AND bit a bit tra un IP e una maschera di sottorete.
    * Restituisce l'indirizzo di rete risultante.
    * @param {string} ip - Indirizzo IP in formato decimale puntato
    * @param {string} mask - Maschera di sottorete in formato decimale puntato
    * @returns {string} Indirizzo di rete in formato decimale puntato
    */
    andMask(ip,mask) {
        let ipNum = 0
        let maskNum = 0
        let positions = 24
        const ipString = ip.split(".")
        const maskString = mask.split(".")


        for (let i = 0; i < 4; i++) {
            ipNum |= parseInt(ipString[i]) << positions
            positions -= 8
        }
        
        positions = 24

        for (let i = 0; i < 4; i++) {
            maskNum |= parseInt(maskString[i]) << positions
            positions -= 8
        }

        const result = ipNum & maskNum
        //Estrae dal primo al quarto ottetto per poi unirli in una stringa
        return [
             (result >>> 24) & 255,
            (result >>> 16) & 255,
            (result >>> 8) & 255,
            result & 255
        ].join(".")
    }

    /**
    * Converte una maschera di sottorete in formato decimale puntato in un numero a 32 bit.
    * Usata per confrontare le maschere nel Longest Prefix Match.
    * @param {string} mask - Maschera in formato decimale puntato
    * @returns {number} Valore numerico a 32 bit della maschera (unsigned)
    */
    maskToNum(mask) {
        let maskNum = 0
        const maskString = mask.split(".")
        let positions = 24
        for (let i = 0; i < 4; i++) {
            maskNum |= parseInt(maskString[i]) << positions
            positions -= 8
        }
        return maskNum >>> 0 // >>> 0 forza l'interpretazione come unsigned a 32 bit
    }


    /**
    * Cerca tutte le route della TDI compatibili con l'IP di destinazione.
    * Una route è compatibile se l'AND tra l'IP e la maschera della route
    * corrisponde alla destinazione della route stessa.
    * @param {Router} router - Il router su cui effettuare la ricerca
    * @param {string} ip - Indirizzo IP di destinazione da cercare
    * @returns {Route[]} Array delle route compatibili trovate
    */
    findCompRoutes(router,ip) {
        const compRoutes = []
        for (let i = 0; i < router.tdi.routes.length; i++) {
           if (this.andMask(ip, router.tdi.routes[i].mask) === router.tdi.routes[i].destination) {
            compRoutes.push(router.tdi.routes[i])
            } 
        }
        return compRoutes
    }

    /**
    * Seleziona la route migliore tra quelle compatibili applicando
    * il criterio Longest Prefix Match (LPM): vince la route con la maschera più lunga.
    * @param {Route[]} compRoutes - Array di route compatibili
    * @returns {Route} La route con il prefisso più specifico
    */
    choseRoute(compRoutes) {
        let chosenRoute = compRoutes[0]
        for (let i = 1; i < compRoutes.length; i++) {
            if (this.maskToNum(compRoutes[i].mask) > this.maskToNum(chosenRoute.mask)) {
                chosenRoute = compRoutes[i]
            }
        }
        return chosenRoute
    }


}