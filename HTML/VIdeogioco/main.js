import kaplay from "https://unpkg.com/kaplay@3001.0.19/dist/kaplay.mjs";
kaplay();

//Crea un oggetto k
    const k = kaplay({
    width: 1200,
    height: 600,
    background: "#d46eb3",
    scale: 2,
    canvas: document.getElementById("canvas"),
});

    //carico lo sprite
    k.loadSprite("Fluttershy", "sprite/Fluttershy.jpeg")
    k.setGravity(2000);



    const player = k.add([
        k.sprite("Fluttershy"),
        k.pos(100,100),
        k.area(), //collision
        // k.body(), //permette di collidere e applica la gravità
        k.offscreen(),
    ])