ChgVideoMode MACRO
                  mov ah,0
                  mov al,13h
                  int 10h
ENDM
MYWhiteRec MACRO startrow,startcol
                local square
                local right
                mov   cx,startcol     ;Column //x
                mov   dx,startrow     ;Row //y
                mov   al,0fh          ;Pixel color
                mov   ah,0ch          ;Draw Pixel Command
                mov   si,startrow
     square:    
     right:     int   10h
                inc   cx
                mov   bx,0
                add   bx,30
                add   bx,startcol
                cmp   cx,bx
                jnz   right           ; this will draw a line of 25 length
                inc   si
                mov   cx,startcol     ;Column //x
                inc   dx              ;Row //y
                mov   bx,0
                add   bx,23
                add   bx,startrow
                cmp   si,bx
                jnz   square
ENDM
MYBrownRec MACRO startrow,startcol
                local square
                local right
                mov   cx,startcol     ;Column //x
                mov   dx,startrow     ;Row //y
                mov   al,06h          ;Pixel color
                mov   ah,0ch          ;Draw Pixel Command
                mov   si,startrow
     square:    
     right:     int   10h
                inc   cx
                mov   bx,0
                add   bx,30
                add   bx,startcol
                cmp   cx,bx
                jnz   right           ; this will draw a line of 25 length
                inc   si
                mov   cx,startcol     ;Column //x
                inc   dx              ;Row //y
                mov   bx,0
                add   bx,23
                add   bx,startrow
                cmp   si,bx
                jnz   square
ENDM
DrawGrid MACRO
              local      row
              local      col
              local      row1
              local      col1
              mov        di,0
              mov        RowVar,0
     col:     
     row:     
              MYWhiteRec RowVar, di
              add        di,30
              MYBrownRec RowVar,di
              add        di,30
              cmp        di,240
              jnz        row
              mov        di,0
              add        RowVar,46
              cmp        RowVar,184
              jnz        col
              mov        di,0
              mov        rowvar,23
     col1:    
     row1:    
              MYBrownRec RowVar, di
              add        di,30
              MYWhiteRec RowVar,di
              add        di,30
              cmp        di,240
              jnz        row1
              mov        di,0
              add        RowVar,46
              cmp        RowVar,161
              jnz        col1
ENDM
.model small
.stack 64
.data
     RowVar dw 0
.code
main proc far
          mov          ax,@data
          mov          ds,ax
          ChgVideoMode
          DrawGrid
     both:
          hlt
main endp
end main