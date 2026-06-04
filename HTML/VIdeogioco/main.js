import kaplay from "https://unpkg.com/kaplay@3001.0.19/dist/kaplay.mjs";
kaplay();

var game_on = true
var obstacles = []
var gameOverShown = false;

const OBSTACLE_SPEED = 260;
const OBSTACLE_WIDTH = 80;
const GAP_SIZE = 170;
const SPAWN_TIME = 1.4;
const PLAY_AREA_HEIGHT = 500;


//Oggetto K per il gioco
    const k = kaplay({
    width: 1200,
    height: 600,
    background: "#16fff3",
    scale: 2,
    canvas: document.getElementById("canvas"),
});

    //carico lo sprite e il background
    k.loadSprite("Sprite", "sprite/sprite.gif")
    k.loadSprite("Background", "sprite/Background.jpg")
    //Imposto il valore della gravità
    k.setGravity(2000);

    //Sfondo dietro a tutti gli elementi del gioco
    k.add([
        k.sprite("Background"),
        k.pos(0, 0),
        k.z(-100),
        k.fixed(),
    ]);


    //Terreno di gioco
    const ground = k.add([
        k.rect(1200,300),
        k.pos(0,500),
        k.area(),
        k.body({ isStatic: true }),
        "ground", //tag per identificare il terreno nelle collisioni
    ])


    ground.use(k.color("#21ea13"));

    //Player
    const player = k.add([
        k.sprite("Sprite"),
        k.pos(100,100),
        k.scale(0.150),
        k.area(), //collision
        k.body(), //permette di collidere e applica la gravità
        k.offscreen(),
    ])

    /*
        * Funzione per GAME OVER
    */
    function endGame() {
        if (gameOverShown) return;

        game_on = false;
        gameOverShown = true;
        // Ferma il movimento del player e degli ostacoli
        player.paused = true;
        obstacles.forEach((obs) => {
            if (obs.exists()) {
                obs.paused = true;
            }
        });
        //Messaggio di GAME OVER al centro dello schermo
        k.add([
            k.text("GAME OVER", { size: 72 }),
            k.pos(k.center()),
            k.anchor("center"),
            k.color("#ff2f2f"),
            k.fixed(),
        ]);
    }

    //salto
    k.onKeyPress("space", () => {
    if (game_on) {
        player.jump(300);
    }
    });

    //Gestione degli ostacoli
    /*
    * Funzione per generare una coppia di ostacoli (tubo superiore e tubo inferiore)
    */
    function spawnObstaclePair() {
        const centerY = k.rand(140, 360); //posizione verticale centrale del gap tra i tubi
        const topHeight = centerY - GAP_SIZE / 2; //altezza del tubo superiore
        const bottomY = centerY + GAP_SIZE / 2; //posizione verticale del tubo inferiore
        const bottomHeight = PLAY_AREA_HEIGHT - bottomY; //altezza del tubo inferiore

        //creazione del tubo superiore
        const topPipe = k.add([
            k.rect(OBSTACLE_WIDTH, topHeight),
            k.pos(k.width(), 0),
            k.area(),
            k.color("#2d8b26"),
            k.move(k.LEFT, OBSTACLE_SPEED),
            "obstacle",
        ]);

        //creazione del tubo inferiore
        const bottomPipe = k.add([
            k.rect(OBSTACLE_WIDTH, bottomHeight),
            k.pos(k.width(), bottomY),
            k.area(),
            k.color("#2d8b26"),
            k.move(k.LEFT, OBSTACLE_SPEED),
            "obstacle",
        ]);

        //lista degli ostacoli per la gestione e la rimozione
        obstacles.push(topPipe, bottomPipe);
    }

    //Generazione continua degli ostacoli ogni 1.4 secondi
    k.loop(SPAWN_TIME, () => {
        if (!game_on) return;
        spawnObstaclePair();
    });

    //Distruzione degli ostacoli che escono dallo schermo e gestione del punteggio
    k.onUpdate(() => {
        if (!game_on) return;

        obstacles = obstacles.filter((obs) => {
            const visible = obs.exists() && obs.pos.x + OBSTACLE_WIDTH > 0;
            if (!visible && obs.exists()) {
                k.destroy(obs);
            }
            return visible;
        });
    });

    //Gestione delle collisioni del player con gli ostacoli e il terreno
    player.onCollide("obstacle", () => {
        endGame();
    });
    player.onCollide("ground", () => {
        endGame();
    });