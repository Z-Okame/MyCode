from menu import Menu
from coffee_maker import CoffeeMaker
from money_machine import MoneyMachine

MoneyMachine = MoneyMachine()
Menu = Menu()
CoffeeMaker = CoffeeMaker()

macchinetta = True


while macchinetta:
    
    print("=======================================================")
    print("Welcome! Order what you want in the coffee machine!")
    print("avaible: " + Menu.get_items())
    request = input("Choose whatever you want:\n>")
    
    if request != "report" and request != "off":
        order = Menu.find_drink(request)
    
    
    if request == "report":
        CoffeeMaker.report()
        MoneyMachine.report()
    elif request == "off":
        macchinetta = False
    elif (order):
        print(f"{request} costs {order.cost}€")
        if (CoffeeMaker.is_resource_sufficient(order)):
            if (MoneyMachine.make_payment(order.cost)):
                CoffeeMaker.make_coffee(order) 
    else:
        print(f"{request} not found, try again.\n")            
        
        
        
    
    
