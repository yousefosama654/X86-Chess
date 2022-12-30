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
               mov bh,0
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


;responsible for drawing a white rec in a grid
MYWhiteRec MACRO startrow,startcol
                                     local                square
                                     local                right
                                     mov                  cx,startcol                                                 ;Column //x
                                     mov                  dx,startrow                                                 ;Row //
                                     mov                  al,0fh                                                      ;Pixel color
                                     mov                  ah,0ch                                                      ;Draw Pixel Command
                                     mov                  si,startrow
   square:                           
   right:                            int                  10h
                                     inc                  cx
                                     mov                  bx,0
                                     add                  bx,30
                                     add                  bx,startcol
                                     cmp                  cx,bx
                                     jnz                  right                                                       ; this will draw a line of 25 length
                                     inc                  si
                                     mov                  cx,startcol                                                 ;Column //x
                                     inc                  dx                                                          ;Row //y
                                     mov                  bx,0
                                     add                  bx,23
                                     add                  bx,startrow
                                     cmp                  si,bx
                                     jnz                  square
ENDM
;responsible for drawing a brown rec in a grid
MYBrownRec MACRO startrow,startcol
                                     local                square
                                     local                right
                                     mov                  cx,startcol                                                 ;Column //x
                                     mov                  dx,startrow                                                 ;Row //y
                                     mov                  al,06h                                                      ;Pixel color
                                     mov                  ah,0ch                                                      ;Draw Pixel Command
                                     mov                  si,startrow
   square:                           
   right:                            int                  10h
                                     inc                  cx
                                     mov                  bx,0
                                     add                  bx,30
                                     add                  bx,startcol
                                     cmp                  cx,bx
                                     jnz                  right                                                       ; this will draw a line of 25 length
                                     inc                  si
                                     mov                  cx,startcol                                                 ;Column //x
                                     inc                  dx                                                          ;Row //y
                                     mov                  bx,0
                                     add                  bx,23
                                     add                  bx,startrow
                                     cmp                  si,bx
                                     jnz                  square
ENDM
MY_HIGHLIGHT_Rec MACRO startrow,startcol
                                     local                square
                                     local                right
                                     mov                  cx,startcol                                                 ;Column //x
                                     mov                  dx,startrow                                                 ;Row //
                                     mov                  al,08h                                                      ;Pixel color
                                     mov                  ah,0ch                                                      ;Draw Pixel Command
                                     mov                  si,startrow
   square:                           
   right:                            int                  10h
                                     inc                  cx
                                     mov                  bx,0
                                     add                  bx,30
                                     add                  bx,startcol
                                     cmp                  cx,bx
                                     jnz                  right                                                       ; this will draw a line of 25 length
                                     inc                  si
                                     mov                  cx,startcol                                                 ;Column //x
                                     inc                  dx                                                          ;Row //y
                                     mov                  bx,0
                                     add                  bx,23
                                     add                  bx,startrow
                                     cmp                  si,bx
                                     jnz                  square
ENDM
MY_HIGHLIGHT_Rec_level2 MACRO startrow,startcol
                                     local                square
                                     local                right
                                     mov                  cx,startcol                                                 ;Column //x
                                     mov                  dx,startrow                                                 ;Row //
                                     mov                  al,07h                                                      ;Pixel color
                                     mov                  ah,0ch                                                      ;Draw Pixel Command
                                     mov                  si,startrow
   square:                           
   right:                            int                  10h
                                     inc                  cx
                                     mov                  bx,0
                                     add                  bx,30
                                     add                  bx,startcol
                                     cmp                  cx,bx
                                     jnz                  right                                                       ; this will draw a line of 25 length
                                     inc                  si
                                     mov                  cx,startcol                                                 ;Column //x
                                     inc                  dx                                                          ;Row //y
                                     mov                  bx,0
                                     add                  bx,23
                                     add                  bx,startrow
                                     cmp                  si,bx
                                     jnz                  square
ENDM
; responsible for highlight a cell in red for team1
MY_red_HIGHLIGHT_Rec MACRO startrow,startcol
                                    local                square
                                     local                right
                                     mov                  cx,startcol                                                 ;Column //x
                                     mov                  dx,startrow                                                 ;Row //
                                     mov                  al,0ch      ;;;e    ;;;;;c                                            ;Pixel color
                                     mov                  ah,0ch                                                      ;Draw Pixel Command
                                     mov                  si,startrow
   square:                           
   right:                            int                  10h
                                     inc                  cx
                                     mov                  bx,0
                                     add                  bx,30
                                     add                  bx,startcol
                                     cmp                  cx,bx
                                     jnz                  right                                                       ; this will draw a line of 25 length
                                     inc                  si
                                     mov                  cx,startcol                                                 ;Column //x
                                     inc                  dx                                                          ;Row //y
                                     mov                  bx,0
                                     add                  bx,23
                                     add                  bx,startrow
                                     cmp                  si,bx
                                     jnz                  square

                                    
endm
; responsible for highlight a cell in purple for team2
MY_purple_HIGHLIGHT_Rec MACRO startrow,startcol
                                     local                square
                                     local                right
                                     mov                  cx,startcol                                                 ;Column //x
                                     mov                  dx,startrow                                                 ;Row //
                                     mov                  al,09h      ;;;e    ;;;;;c                                            ;Pixel color
                                     mov                  ah,0ch                                                      ;Draw Pixel Command
                                     mov                  si,startrow
   square:                           
   right:                            int                  10h
                                     inc                  cx
                                     mov                  bx,0
                                     add                  bx,30
                                     add                  bx,startcol
                                     cmp                  cx,bx
                                     jnz                  right                                                       ; this will draw a line of 25 length
                                     inc                  si
                                     mov                  cx,startcol                                                 ;Column //x
                                     inc                  dx                                                          ;Row //y
                                     mov                  bx,0
                                     add                  bx,23
                                     add                  bx,startrow
                                     cmp                  si,bx
                                     jnz                  square
endm

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



clearbottomGraphic MACRO
                mov ax,0601h
                mov bh,07
                mov ch,12
                mov cl,70
                mov dh,20
                mov dl,80
                int 10h
ENDM
after_clear_top_Graphic macro
                    dec row1graphic
                    mov bh,0
                    mov ah,2
                    mov dl,13
                    int 21h
                       
endm
cleartopGraphic MACRO
             mov ax,0601h
             mov bh,07
             mov ch,1
             mov cl,70
             mov dh,9
             mov dl,80
             int 10h
            
ENDM

after_clear_bottom_Graphic macro
                       dec row2graphic
                       mov ah,2
                       mov bh,0
                       mov dl,13
                       int 21h
                       
endm


