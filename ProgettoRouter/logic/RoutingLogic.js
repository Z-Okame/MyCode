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
             (result >> 24) & 255,
            (result >> 16) & 255,
            (result >> 8) & 255,
            result & 255
        ].join(".")
    }
}