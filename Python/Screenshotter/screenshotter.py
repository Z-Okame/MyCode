# pip install selenium pyautogui pillow

from selenium import webdriver
import pyautogui
import time
import os

url = "https://fliphtml5.com/azsumgeicheee/lfsw/The_Husky_and_His_White_Cat_Shizun__Erha_He_Ta_De_Bai_Mao_Shizun_Vol._10/"

options = webdriver.ChromeOptions()
options.add_argument("--start-maximized")
driver = webdriver.Chrome(options=options)
driver.get(url)

print("Attendo caricamento pagina...")
time.sleep(10)

folder = "screenshots"
os.makedirs(folder, exist_ok=True)

total_pages = 200

def grab_focus():
    """Clicca al centro del browser per dare il focus al flipbook."""
    try:
        vw = driver.execute_script("return window.innerWidth")
        vh = driver.execute_script("return window.innerHeight")

        # Posizione assoluta della finestra Chrome sul desktop
        win_x = driver.execute_script("return window.screenX")
        win_y = driver.execute_script("return window.screenY")

        # Offset barra titolo + barra indirizzi Chrome (circa 90px)
        chrome_toolbar_height = 90

        abs_x = win_x + vw // 2
        abs_y = win_y + chrome_toolbar_height + vh // 2

        pyautogui.click(abs_x, abs_y)
        print(f"Focus acquisito cliccando a ({abs_x}, {abs_y})")
        time.sleep(0.5)
        return True
    except Exception as e:
        print(f"Grab focus fallito: {e}")
        return False

def press_arrow_right():
    """Premi la freccia destra tramite pyautogui (input OS-level)."""
    try:
        pyautogui.press("right")
        print("Freccia destra premuta")
        return True
    except Exception as e:
        print(f"pyautogui fallito: {e}")
        return False

# Focus iniziale
print("Acquisisco focus sul flipbook...")
grab_focus()
time.sleep(1)

print("Inizio acquisizione screenshot...\n")

page = 1
consecutive_failures = 0

while page <= total_pages:
    filename = os.path.join(folder, f"pagina_{page:03d}.png")
    driver.save_screenshot(filename)
    print(f"Salvata: {filename}")

    if page >= total_pages:
        break

    if press_arrow_right():
        consecutive_failures = 0
    else:
        consecutive_failures += 1
        print(f"Fallimento #{consecutive_failures}, recupero focus...")
        grab_focus()
        time.sleep(0.5)
        if not press_arrow_right():
            print("Fallito definitivamente, uscita.")
            break

    # Aspetta animazione pagina
    time.sleep(2.5)
    page += 1

driver.quit()
print(f"\nFatto! Screenshot salvati in: {os.path.abspath(folder)}")