# 💾 merge_usb_safe.sh

Script Bash per **unire tutte le partizioni di una chiavetta USB** in un'unica partizione formattata, in modo sicuro, evitando di cancellare per errore dischi interni o il disco di sistema.

---

## ⚠️ ATTENZIONE
- Tutti i dati sulla chiavetta USB verranno **definitivamente cancellati**.
- Lo script **blocca automaticamente** l'operazione se viene selezionato un disco interno o il disco di avvio.

---

## 📦 Requisiti
- macOS (lo script usa `diskutil`)
- Permessi da utente con accesso al Terminale

---

## 🔧 Installazione
1. Salva il file `merge_usb_safe.sh` in una cartella a piacere.
2. Rendi eseguibile lo script:
   ```bash
   chmod +x merge_usb_safe.sh
## ▶️ Utilizzo
1. Collega la chiavetta USB al Mac.
2. Avvia lo script: ./merge_usb_safe.sh.
3. Lo script mostrerà la lista dei dischi disponibili.
4. Inserisci il nome del volume da assegnare alla chiavetta.
5. conferma digitando `yes` per procedere.
