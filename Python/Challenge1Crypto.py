# auto_solver.py
# Richiede: pip install pexpect
import pexpect
import re
import sys

# Esempio: connessione via comando (sostituisci con il comando reale)
# child = pexpect.spawn('ssh user@host') 
child = pexpect.spawn('nc 2048.challs.olicyber.it 10007')  # per test locale; sostituisci con il tuo client

# Se la console usa login, autenticazione, fai gli expect necessari qui.

# RegEx da adattare al prompt: cattura operazione e due numeri
pattern = re.compile(r'(DIFFERENZA|PRODOTTO)\s+(-?\d+)\s+(-?\d+)', re.IGNORECASE)

def solve_line(line):
    m = pattern.search(line)
    if not m:
        return None
    op = m.group(1).upper()
    a = int(m.group(2))
    b = int(m.group(3))
    if op == 'DIFFERENZA':
        return str(a - b)
    elif op == 'PRODOTTO':
        return str(a * b)
    return None

# loop: attendi il prompt e rispondi
while True:
    try:
        child.expect([r'.*\n'], timeout=60)  # leggi una riga
        line = child.after.decode('utf-8', errors='ignore')
        sys.stdout.write(line)  # log locale per debug
        ans = solve_line(line)
        if ans is not None:
            child.sendline(ans)
            print(f"INVIATO: {ans}")
    except pexpect.EOF:
        print("Connessione chiusa.")
        break
    except pexpect.TIMEOUT:
        print("Timeout: nessun output recente.")
        break
