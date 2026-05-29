import kaplay from "https://unpkg.com/kaplay@3001.0.19/dist/kaplay.mjs";
kaplay();

var game_on = true
var obstacles = []


//Crea un oggetto k
    const k = kaplay({
    width: 1200,
    height: 600,
    background: "#16fff3",
    scale: 2,
    canvas: document.getElementById("canvas"),
});

    //carico lo sprite
    k.loadSprite("Sprite", "sprite/sprite.gif")
    k.setGravity(2000);

    const ground = k.add([
        k.rect(1200,300),
        k.pos(0,500),
        k.area(),
        k.body({ isStatic: true })
    ])

    ground.use(k.color("#21ea13"));

    const player = k.add([
        k.sprite("Sprite"),
        k.pos(100,100),
        k.scale(0.300),
        k.area(), //collision
        k.body(), //permette di collidere e applica la gravità
        k.offscreen(),
    ])

    //salto
    onKeyPress("space", () => {
    if (!player.isGrounded()) { 
        player.jump(600);     
    }
    });
1