"""
cropper.py
==========
Ritaglia tutti gli screenshot in `screenshots/` (pagina_001.png, ecc.)
e salva i ritagli in `cropped/` con le stesse dimensioni fisse: 1656x1073 px.

Le coordinate di crop sono calibrate per schermi 3440x1440
con il reader FlipHTML5 a schermo intero.

Utilizzo:
    python cropper.py

Struttura del progetto:
    progetto/
    ├── screenshots/       <- input
    ├── cropped/           <- output (creata automaticamente)
    ├── cropper.py
    └── screenshotter.py

Dipendenze:
    pip install Pillow
"""

import os
import glob
from PIL import Image


# ---------------------------------------------------------------------------
# Coordinate di crop fisse (calibrate su 3440x1440 -> 1656x1073)
# ---------------------------------------------------------------------------
CROP_LEFT   = 894
CROP_TOP    = 57
CROP_RIGHT  = 2550
CROP_BOTTOM = 1330

EXPECTED_W = CROP_RIGHT  - CROP_LEFT   # 1656
EXPECTED_H = CROP_BOTTOM - CROP_TOP    # 1073

# ---------------------------------------------------------------------------
# Cartelle
# ---------------------------------------------------------------------------
BASE_DIR        = os.path.dirname(os.path.abspath(__file__))
SCREENSHOTS_DIR = os.path.join(BASE_DIR, "screenshots")
CROPPED_DIR     = os.path.join(BASE_DIR, "cropped")


def crop_screenshot(input_path, output_path):
    img = Image.open(input_path).convert("RGB")

    # Controllo dimensioni originali
    if img.width != 3440 or img.height != 1440:
        print(f"  [WARN] Dimensioni inattese: {img.width}x{img.height} (atteso 3440x1440)")

    cropped = img.crop((CROP_LEFT, CROP_TOP, CROP_RIGHT, CROP_BOTTOM))
    cropped.save(output_path)
    return cropped.size


def main():
    if not os.path.isdir(SCREENSHOTS_DIR):
        print(f"[ERR] Cartella non trovata: {SCREENSHOTS_DIR}")
        return

    os.makedirs(CROPPED_DIR, exist_ok=True)

    files = sorted(glob.glob(os.path.join(SCREENSHOTS_DIR, "pagina_*.png")))

    if not files:
        print(f"[!] Nessun file 'pagina_*.png' in: {SCREENSHOTS_DIR}")
        return

    print(f"[•] {len(files)} screenshot trovati  |  crop fisso: {EXPECTED_W}x{EXPECTED_H} px")
    print(f"[•] Output -> '{CROPPED_DIR}'\n")

    ok, errors = 0, 0

    for input_path in files:
        filename    = os.path.basename(input_path)
        output_path = os.path.join(CROPPED_DIR, filename)
        try:
            w, h = crop_screenshot(input_path, output_path)
            print(f"  [OK] {filename}  ->  {w}x{h} px")
            ok += 1
        except Exception as e:
            print(f"  [ERR] {filename}: {e}")
            errors += 1

    print(f"\nCompletato: {ok} ritagliati, {errors} errori.")


if __name__ == "__main__":
    main()