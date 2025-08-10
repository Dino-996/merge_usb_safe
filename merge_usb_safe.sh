#!/bin/bash

# Script sicuro per unire tutte le partizioni di una chiavetta USB in una sola
# ATTENZIONE: tutti i dati sulla chiavetta verranno cancellati!

echo "=== Unione partizioni chiavetta USB ==="
echo "Dischi attualmente collegati:"
diskutil list

read -p "Inserisci l'identificativo del disco (es. disk4): " DISK_ID
read -p "Nome per la nuova partizione: " VOLUME_NAME

# Controlla se il disco esiste
if ! diskutil info "$DISK_ID" &>/dev/null; then
    echo "ERRORE: Disco $DISK_ID non trovato."
    exit 1
fi

# Controlla se il disco è il disco di avvio
if [[ "$(diskutil info "$DISK_ID" | grep 'Device Location' | awk '{print $3}')" == "Internal" ]]; then
    echo "ERRORE: $DISK_ID è un disco interno. Operazione annullata."
    exit 1
fi

# Controlla se è il disco di sistema
if [[ "$(diskutil info "$DISK_ID" | grep 'Boot Volume' | wc -l)" -gt 0 ]]; then
    echo "ERRORE: $DISK_ID sembra essere il disco di avvio. Operazione annullata."
    exit 1
fi

echo ""
echo "ATTENZIONE: tutti i dati su $DISK_ID verranno eliminati!"
read -p "Sei sicuro di voler continuare? (yes/no): " CONFIRM

if [[ "$CONFIRM" != "yes" ]]; then
    echo "Operazione annullata."
    exit 1
fi

# Esegue la formattazione sicura
diskutil eraseDisk ExFAT "$VOLUME_NAME" GPT "$DISK_ID"

echo ""
echo "Operazione completata!"
diskutil list "$DISK_ID"