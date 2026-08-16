class HUD {

    renderRouter(router) {
        let routerDiv = document.createElement("article") //Card di PicoCSS
        routerDiv.id = router.name
        document.getElementById("routers-container").appendChild(routerDiv)

        const name = document.createElement("label")
        let status = document.createElement("label")
        name.textContent = `Router Name: ${router.name}`
        status.textContent = `Status: ${router.status ? "UP" : "DOWN"}`

        const grid = document.createElement("div");
        grid.setAttribute("class", "grid");

        const infoDiv = document.createElement("div");
        infoDiv.appendChild(name)
        infoDiv.appendChild(status)

        const imgDiv = document.createElement("div");
        const img = document.createElement("img");
        img.src = "assets/Router.png"
        imgDiv.appendChild(img)
        grid.appendChild(imgDiv)
        grid.appendChild(infoDiv)
        routerDiv.appendChild(grid)
        
    }

    renderInterface(router, int) {
        const infoDiv = document.getElementById(router.name)
        let elencoInterfacce = document.getElementById(`${router.name}-interfaces`);

        if (elencoInterfacce == null) {
            elencoInterfacce = document.createElement("ul");
            elencoInterfacce.id = `${router.name}-interfaces`
            infoDiv.appendChild(elencoInterfacce)
        }

        //Controllo interfaccia esistente
        for (let i = 0; i < elencoInterfacce.children.length; i++) {
            if (elencoInterfacce.children[i].id == int.name) {
                elencoInterfacce.children[i].textContent = int.toString()
                return
            }
        }

        const btnToggle = document.createElement("button")
        btnToggle.textContent = int.status ? "UP" : "DOWN"
        btnToggle.addEventListener("click", () => {
            int.switchStatus()
            btnToggle.textContent = int.status ? "UP" : "DOWN"
        })

        const nuovaInt = document.createElement("li");
        nuovaInt.id = `${int.name}`
        nuovaInt.textContent = int.toString()
        elencoInterfacce.appendChild(nuovaInt)
        nuovaInt.appendChild(btnToggle)
    }


    renderTDI(router) {
        let tdiDiv = document.getElementById("tdi-container")
        tdiDiv.innerHTML = ""
    
        const table = document.createElement("table")
        
        const thead = document.createElement("thead")
        const headerRow = document.createElement("tr")
        const Destinazione = document.createElement("th")
        const Maschera = document.createElement("th")
        const NextHop = document.createElement("th")
        const Rimuovi = document.createElement("th")

        
        Destinazione.textContent = "Destinazione"
        Maschera.textContent = "Maschera"
        NextHop.textContent = "NextHop"
        Rimuovi.textContent = "Rimuovi"

        headerRow.appendChild(Destinazione)
        headerRow.appendChild(Maschera)
        headerRow.appendChild(NextHop)
        headerRow.appendChild(Rimuovi)

        thead.appendChild(headerRow)
        table.appendChild(thead)

        const tbody = document.createElement("tbody")

        for(let i = 0; i < router.tdi.routes.length; i++) {
            const row = document.createElement("tr")
            const tdDest = document.createElement("td")
            const tdMask = document.createElement("td")
            const tdNexth = document.createElement("td")
            const tdBtn = document.createElement("td")

            const btn = document.createElement("button")
            btn.textContent = "Elimina"
            btn.id = `btn-delete-${i}`
            btn.addEventListener("click", () => {
            router.tdi.removeRoute(i)
            this.renderTDI(router)
            })

            tdDest.textContent = `${router.tdi.routes[i].destination}`
            tdMask.textContent = `${router.tdi.routes[i].mask}`
            tdNexth.textContent = `${router.tdi.routes[i].nextHop}`

            tdBtn.appendChild(btn)
            row.appendChild(tdDest)
            row.appendChild(tdMask)
            row.appendChild(tdNexth)
            row.appendChild(tdBtn)
            tbody.appendChild(row)
        }

        table.appendChild(tbody)
        tdiDiv.appendChild(table)
    }

}