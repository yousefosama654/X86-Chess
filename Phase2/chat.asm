MoveCursor MACRO row,col
    ; U must send the paramters by hexa
               mov ah,2
               mov bh,0
               mov dl,col
               mov dh,row
               int 10h
ENDM
PrintMsg MACRO str
             mov ah, 9
             mov dx, offset str
             int 21h
ENDM


PrintChr MACRO char
             mov ah,2
             mov dl,char
             int 21h
ENDM
clearbottom MACRO
                mov ax,0601h
                mov bh,07
                mov ch,14
                mov cl,0
                mov dh,24
                mov dl,79
                int 10h
ENDM
after_clear_top macro
                    dec row1
                    mov bh,0
                    mov ah,2
                    mov dl,13
                    int 21h
                       
endm
cleartop MACRO
             mov ax,0601h
             mov bh,07
             mov ch,1
             mov cl,0
             mov dh,11
             mov dl,79
             int 10h
            
ENDM

after_clear_bottom macro
                       dec row2
                       mov ah,2
                       mov bh,0
                       mov dl,13
                       int 21h
                       
endm


.MODEL SMALL
.STACK 64
.DATA
    value_send     db 0
    value_recieved db 0
    
    pos1           db 00
    pos2           db 00
    row1           db 1
    row2           db 14
    me             db "Me:",'$'
    You            db "You:",'$'
    dottedLine     db 80 dup('-'),'$'
    starLine       db 80 dup('*'),'$'
    ; newline db  "13",'10','$'
.code


init_comm PROC far
    ;Set Divisor Latch Access Bit
                      mov                dx,3fbh                 ; Line Control Register
                      mov                al,10000000b            ;Set Divisor Latch Access Bit
                      out                dx,al                   ;Out it
    ;Set LSB byte of the Baud Rate Divisor Latch register.
                      mov                dx,3f8h
                      mov                al,0ch
                      out                dx,al
    ;Set MSB byte of the Baud Rate Divisor Latch register.
                      mov                dx,3f9h
                      mov                al,00h
                      out                dx,al
    ;Set port configuration
                      mov                dx,3fbh
                      mov                al,00011011b            ;0:Access to Receiver buffer, Transmitter buffer
    ;0:Set Break disabled
    ;011:Even Parity
    ;0:One Stop Bit
    ;11:8bits
                      out                dx,al
                      ret
init_comm ENDP


send PROC far                                                    ; this proc will send the arr byte by byte
    ; the offset of the message
                      mov                di,offset value_send
    ; L1:
    skip_sending:     
                      MoveCursor         row1,pos1
                      mov                dx , 3FDH               ; Line Status Register
                      In                 al , dx                 ;Read Line Status
                      and                al , 00100000b
                      jz                 gotolabel1
                      jnz                notgotolabel1
    gotolabel1:       
                      Jmp                FAR ptr      L1         ;Not empty
    notgotolabel1:    
    ;  JZ   FAR ptr      L1                      ;Not empty
    ;If empty put the VALUE in Transmit data register
                      mov                ah,1
                      int                16h                     ;to check the keyboard buffer
                      jz                 gotolabel2
                      jnz                notgotolabel2
    gotolabel2:       
                      Jmp                FAR ptr      L1         ;Not empty
    notgotolabel2:    
    ;nothing is clicked
                      mov                value_send,al
                      cmp                al,09h                  ; if it was tab
                      jz                 tab1
    nottab1:          MoveCursor         row1,pos1
                      PrintChr           value_send
                      inc                pos1
                      cmp                pos1,80
                      je                 tab1
                      jmp                else1
    tab1:             
                      mov                pos1,0
                      inc                row1
                      cmp                row1,12
                      je                 lllllllllllllllll
                      jmp                jmpcleartop
                  
    lllllllllllllllll:
                      cleartop
                      mov                pos1,0
                      after_clear_top
                      jmp                else1
    jmpcleartop:      
                      mov                pos1,0
                      MoveCursor         row1,pos1
                      jmp                else1
    else1:            
                      mov                ah, 0
                      int                16h
                      mov                dx , 3F8H               ; Transmit data register
                      mov                al,[di]
                      out                dx , al                 ;;send it
                                        
    L1:               
    ;check if the Line Status Register is ready for new data
                      MoveCursor         row2,pos2
                      mov                dx , 3FDH               ; Line Status Register
                      in                 al , dx
                      and                al , 1
                      JZ                 exit                    ;Not empty
                      mov                dx , 03F8H              ;there ia data and i ama recieveing
                      in                 al , dx
                      cmp                al,09h                  ; if it was tab
                      jz                 tab2

    nottab2:          MoveCursor         row2,pos2
                      PrintChr           al
                      inc                pos2
                      cmp                pos2,80
                      je                 tab2
                      jmp                exit
    tab2:             
                      mov                pos2,0
                      inc                row2
                      cmp                row2,25
                      jne                jmpclearbottom
                  
                      clearbottom
                      mov                pos2,0
                      after_clear_bottom
                      jmp                exit
    jmpclearbottom:   
                      mov                pos2,0
                      MoveCursor         row2,pos2
                      jmp                exit
    exit:             
                      jmp                skip_sending
                      ret
send ENDP

MAIN PROC far
                      MOV                AX,@DATA
                      MOV                DS,AX
                      call               far ptr init_comm
                      mov                ax, 0003h
                      int                10h
                      MoveCursor         12,0
                      PrintMsg           dottedLine
                      MoveCursor         13,0
                      PrintMsg           You
                      MoveCursor         0,0
                      PrintMsg           me
                      call               far ptr send
                      hlt
MAIN ENDP
END MAIN