"""
merger.py
=========
Unisce tutte le immagini ritagliate in `cropped/` in un unico PDF.
Le pagine vengono ordinate per numero (pagina_001, pagina_002, ...).
Il PDF viene salvato nella cartella del progetto come `output.pdf`.

Utilizzo:
    python merger.py

Struttura del progetto:
    progetto/
    ├── screenshots/
    ├── cropped/           <- input
    ├── output.pdf         <- output
    ├── merger.py
    └── cropper.py

Dipendenze:
    pip install Pillow
"""

import os
import glob
from PIL import Image


BASE_DIR    = os.path.dirname(os.path.abspath(__file__))
CROPPED_DIR = os.path.join(BASE_DIR, "cropped")
OUTPUT_PDF  = os.path.join(BASE_DIR, "output.pdf")


def main():
    if not os.path.isdir(CROPPED_DIR):
        print(f"[ERR] Cartella non trovata: {CROPPED_DIR}")
        print("      Esegui prima cropper.py")
        return

    files = sorted(glob.glob(os.path.join(CROPPED_DIR, "pagina_*.png")))

    if not files:
        print(f"[!] Nessun file 'pagina_*.png' in: {CROPPED_DIR}")
        return

    print(f"[•] {len(files)} immagini trovate in '{CROPPED_DIR}'")
    print(f"[•] Caricamento in corso...")

    images = []
    for path in files:
        img = Image.open(path).convert("RGB")
        images.append(img)
        print(f"  [OK] {os.path.basename(path)}  {img.width}x{img.height}")

    print(f"\n[•] Generazione PDF -> {OUTPUT_PDF}")
    first, rest = images[0], images[1:]
    first.save(OUTPUT_PDF, save_all=True, append_images=rest)

    size_mb = os.path.getsize(OUTPUT_PDF) / (1024 * 1024)
    print(f"[OK] PDF salvato: {size_mb:.1f} MB  |  {len(images)} pagine")


if __name__ == "__main__":
    main()