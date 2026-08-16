class RoutingLogic {

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
        return [
             (result >>> 24) & 255,
            (result >>> 16) & 255,
            (result >>> 8) & 255,
            result & 255
        ].join(".")
    }

    maskToNum(mask) {
        let maskNum = 0
        const maskString = mask.split(".")
        let positions = 24
        for (let i = 0; i < 4; i++) {
            maskNum |= parseInt(maskString[i]) << positions
            positions -= 8
        }
        return maskNum >>> 0
    }

    findCompRoutes(router,ip) {
        const compRoutes = []
        for (let i = 0; i < router.tdi.routes.length; i++) {
           if (this.andMask(ip, router.tdi.routes[i].mask) === router.tdi.routes[i].destination) {
            compRoutes.push(router.tdi.routes[i])
            } 
        }
        return compRoutes
    }

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