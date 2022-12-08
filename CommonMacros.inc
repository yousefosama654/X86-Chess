PrintMsg MACRO str
             mov ah, 9
             mov dx, offset str
             int 21h
ENDM
ShowMouse MACRO
              mov ax,1
              int 33h
ENDM
ChgVideoMode MACRO
                 mov ah,0
                 mov al,13h
                 int 10h
ENDM
MoveCursor MACRO row,col
    ; U must send the paramters by hexa
               mov ah,2
               mov dl,col
               mov dh,row
               int 10h
ENDM
NewLine MACRO
            PrintChr 10
            PrintChr 13
ENDM
Tab MACRO
         PrintChr 9
ENDM
PrintMsgThreeTimes MACRO str
                       local again             ;every macro has its own label again
                       mov   ah, 9
                       mov   cx,3
                       mov   dx, offset str
    again:             
                       int   21h
                       loop  again
ENDM
PrintChr MACRO char
             mov ah,2
             mov dl,char
             int 21h
ENDM
ReadMsg MACRO Buffer
            mov ah,0AH
            mov dx,offset Buffer
            int 21h
ENDM
ReadChrEcho MACRO
                mov ah,01    ;will have the value in al
                int 21h
ENDM
ReadChrNoEcho MACRO
                  mov ah,07    ;will have the value in al
                  int 21h
ENDM
CloseProgram MACRO
                 mov ah,4ch
                 int 21h
ENDM
ClearScreen MACRO
                mov ax,0003h
                int 10h
ENDM
GetKeyPressedWait MACRO params
                      mov ah,0
                      int 16h
ENDM