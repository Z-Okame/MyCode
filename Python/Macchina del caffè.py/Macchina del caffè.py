#Programma che simula una macchina del caffè
import main
var = True

Quarter = 0.25
Dime = 0.10
Nickel = 0.05
Penny = 0.01


def pagamento(tipo_caffe):
    print(f"Quanti quarter vuoi inserire?")
    quarter = int(input())
    print(f"Quanti dime vuoi inserire?")
    dime = int(input())
    print(f"Quanti nichel vuoi inserire?")
    nickel = int(input())
    print(f"Quanti penny vuoi inserire?")
    penny = int(input())
    totale = (quarter * Quarter) + (dime * Dime) + (nickel * Nickel) + (penny * Penny)
    if tipo_caffe == "espresso":
        if totale >= main.MENU["espresso"]["cost"]:
            resto = totale - main.MENU["espresso"]["cost"]
            print(f"il resto e': {resto}€")
            return 1
        elif totale < main.MENU["espresso"]["cost"]:
            print("Non hai abbastanza soldi.")
            return 0
    elif tipo_caffe == "latte":
        if totale >= main.MENU["latte"]["cost"]:
            resto = totale - main.MENU["latte"]["cost"]
            print(f"il resto e': {resto}€")
            return 1
        elif totale < main.MENU["latte"]["cost"]:
            print("Non hai abbastanza soldi.")
            return 0
    elif tipo_caffe == "cappuccino":
        if totale >= main.MENU["cappuccino"]["cost"]:
            resto = totale - main.MENU["cappuccino"]["cost"]
            print(f"il resto e': {resto}€")
            return 1
        else:
            print("Non hai abbastanza soldi.")
            return 0


def prepara_caffe(tipo_caffe):
    if tipo_caffe == "espresso":
        if main.resources["water"] >= main.MENU["espresso"]["ingredients"]["water"] and main.resources["coffee"] >= main.MENU["espresso"]["ingredients"]["coffee"]:
            main.resources["water"] -= main.MENU["espresso"]["ingredients"]["water"]
            main.resources["coffee"] -= main.MENU["espresso"]["ingredients"]["coffee"]
        else:
            print("Risorse insufficienti per preparare un espresso.")
    elif tipo_caffe == "latte":
        if main.resources["water"] >= main.MENU["latte"]["ingredients"]["water"] and main.resources["milk"] >= main.MENU["latte"]["ingredients"]["milk"] and main.resources["coffee"] >= main.MENU["latte"]["ingredients"]["coffee"]:
            main.resources["water"] -= main.MENU["latte"]["ingredients"]["water"]
            main.resources["milk"] -= main.MENU["latte"]["ingredients"]["milk"]
            main.resources["coffee"] -= main.MENU["latte"]["ingredients"]["coffee"]
        else:
            print("Risorse insufficienti per preparare un latte.")
    elif tipo_caffe == "cappuccino":
        if main.resources["water"] >= main.MENU["cappuccino"]["ingredients"]["water"] and main.resources["milk"] >= main.MENU["cappuccino"]["ingredients"]["milk"] and main.resources["coffee"] >= main.MENU["cappuccino"]["ingredients"]["coffee"]:
            main.resources["water"] -= main.MENU["cappuccino"]["ingredients"]["water"]
            main.resources["milk"] -= main.MENU["cappuccino"]["ingredients"]["milk"]
            main.resources["coffee"] -= main.MENU["cappuccino"]["ingredients"]["coffee"]
        else:
            print("Risorse insufficienti per preparare un cappuccino.")

while var:
    print("Benvenuto nella macchina del caffè!")
    print("Cosa desideri? (espresso/latte/cappuccino):")

    richiesta = input().lower()

    if richiesta == "report":
        print("Risorse disponibili:")
        print(f"Acqua: {main.resources['water']}ml")
        print(f"Latte: {main.resources['milk']}ml")
        print(f"Caffè: {main.resources['coffee']}g")
    elif richiesta == "off":
        print("Macchina spenta.")
        var = False
    elif richiesta in main.MENU:
        print(f"un {richiesta} costa {round(main.MENU[richiesta]['cost'], 2)}€")
        if pagamento(richiesta) == 1:
            prepara_caffe(richiesta)
            print(f"Ecco il tuo {richiesta}. Buona degustazione!")
        else:
            print(f"Non è stato possibile preparare il tuo {richiesta}.")
    else:
        print("Scelta non valida. Riprova.")


