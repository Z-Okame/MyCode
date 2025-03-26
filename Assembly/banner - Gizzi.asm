;Programma che richiede una parola in input
; e un intero N tra 0 e 100
; Il programma cancella lo schermo e scrive N volte la
; parola in posizioni casuali



;*************************************************************
;*        DATA SECTION
;*************************************************************

data segment
    ; add your data here!
    str db 10, ?, 10 dup(?)   
    msg1 db "Inserire una parola:$"
    msg2 db "Inserire il numero intero$" 
    N db 10  
    seed dw ?  
    righe dw 25
    colonne dw 80 
    x dw 0
    y dw 0
    
ends                                    

;*************************************************************
;*        STACK SECTION
;*************************************************************
stack segment
    dw  128  dup(0)
ends

;*************************************************************
;*        DATA SECTION
;*************************************************************
code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

;Input della stringa 
    lea dx, str
    mov ah, 0Ah
    int 21h
   
    
;input di N 
    lea dx, msg2
    mov ah, 09h
    int 21h

    lea dx, N
    mov ah, 0Ah
    int 21h
    mov ah, 01h
     
    call cls
    call srand  
       
; DL = casuale.tra(0,80)    
    xor ax,ax 
     
    push ax   
    push colonne    
    call casuale_tra 
    pop x

; DH = casuale.tra(0,25)   
    xor  ax,ax
    push ax   
    push righe    
    call casuale_tra 
    pop y
    
    mov DX, x
    mov AX, y
    mov DH, AL    
            
            
    lea si, str
    inc si         
    mov CL, [si] 
     
; ciclare N volte la stampa
    
    ;Stampo parola  a x,y

    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends


;*************************************************************
;*       PROCEDURES SECTION
;*************************************************************


;*************************************************************
;* Procedura:   srand 
;* description: initialize 'seed' variable (must be declare as dw)
;* input:       none
;* return:      none
;*************************************************************
srand PROC
    MOV AH, 00h   ; Funzione per leggere il timer 
    INT 1Ah       
    MOV seed, DX  ; Salva il valore del timer in seed
    RET
srand ENDP  

;*************************************************************
;* Procedura:   rand 
;* description: generate a new pseudocasual integer between 0 e 2^16-1 
;* input:       none
;* return:      pseudocasual integer between  0 e 2^16-1 passed by stack
;*************************************************************

rand PROC
    ; Incrementa il seed 
    POP BP
    
    MOV AX, seed
    ADD AX, 1
    MOV seed, AX
    
    ;LCG psudocasual
    MOV BX, 1035h
    MUL BX   ; DX AX
    ADD AX, 12345       ; N % 65536
    MOV seed, AX
    
    ; Ritorna il numero casuale nello stack
    PUSH AX
    PUSH BP
    RET
rand ENDP


;*************************************************************
;* Procedura:   casuale_tra 
;* description: generate a pseudocasual integer between min e max passed by stack
;* input:       min ean maxnone
;* return:      pseudocasual integer througth stack
;*************************************************************

casuale_tra PROC
    ; Riceve min e max dallo stack 
    pop BP 
    
;LCG algorithm    
    MOV AX, seed
    ADD AX, 1
    MOV seed, AX
    MOV BX, 1035h
    MUL BX
    ADD AX, 12345
    MOV seed, AX
    
    
    
    POP BX       ; max
    POP CX       ; min
    
    ; Genera un numero casuale
    ; CALL rand   ; NON POSSO fare CALL ricorsive!!!!!!!!!!!!!!!!
    ; POP AX       ; Ottiene il numero casuale
    

    ; Calcola il numero casuale tra min e max
    SUB BX, CX   ; max - min 
    XOR DX, DX
    DIV BX       ; (numero casuale % (max - min))
    ADD DX, CX   ; + min
    
    ; Ritorna il numero casuale nello stack
    PUSH DX 
    PUSH BP
    RET
casuale_tra ENDP

cls PROC
    MOV AH, 06h  ; Funzione di scroll
    MOV AL, 0    ; Scrolla l'intero schermo  (00h = clear entire window)
    MOV BH, 07h  ; Attributo (sfondo nero, testo bianco)
    MOV CX, 0    ; Coordinata superiore sinistra (riga 0, colonna 0)
    MOV DX, 184Fh ; Coordinata inferiore destra (riga 24, colonna 79) per schermi 80x25
    INT 10h      ; Chiamata all'interrupt video      
    RET
cls ENDP    
end start ; set entry point and stop the assembler. 


