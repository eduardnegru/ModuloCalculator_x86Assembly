%include "io.inc"

section .data
    %include "input.inc"     
section .text
global CMAIN

; eax deimpartit ebx baza
     
CMAIN:

    xor eax,eax
    xor ebx,ebx
    xor edx,edx
    mov ebp, esp
    mov eax,[numar]
    mov ebx,[baza]
    cmp ebx,1
    jle baseNotValid
    cmp ebx,17
    jge baseNotValid   
     
divideAgain:            ;continua sa imparti la baza
    div ebx
    cmp edx,10
    jl notLiteral
    je isA
    cmp edx,11
    je isB
    cmp edx,12
    je isC
    cmp edx,13
    je isD
    cmp edx,14
    je isE
    cmp edx,15
    je isF
    
isA:
    mov edx,"a"
    jmp alreadyLiteral

isB:
    mov edx,"b"
    jmp alreadyLiteral

isC:
    mov edx,"c"
    jmp alreadyLiteral
           
isD:
    mov edx,"d"
    jmp alreadyLiteral 
    
isE:
    mov edx,"e"
    jmp alreadyLiteral
    
isF:
    mov edx,"f"  
    jmp alreadyLiteral
    
notLiteral:             ;daca nu apartine (A,F) 
    add edx,"0"         ;il fac caracter
    
alreadyLiteral:         ; este deja in (A,F)
    push edx            ; il pun pe stiva
    xor edx,edx         ; fac edx = 0
    cmp eax,0
    jg divideAgain
  
stackNotEmpty:          ;repeta cat timp stiva nu este goala
    pop eax
    PRINT_CHAR eax
    cmp ebp,esp
    jne stackNotEmpty
    ret
    
baseNotValid:           ;baza nu este intre 2 si 16
     PRINT_STRING "Baza incorecta"
    ret