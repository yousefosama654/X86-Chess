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
                add   bx,40
                add   bx,startcol
                cmp   cx,bx
                jnz   right           ; this will draw a line of 25 length
                inc   si
                mov   cx,startcol     ;Column //x
                inc   dx              ;Row //y
                mov   bx,0
                add   bx,25
                add   bx,startrow
                cmp   si,bx
                jnz   square
ENDM
MYBlackRec MACRO startrow,startcol
                local square
                local right
                mov   cx,startcol     ;Column //x
                mov   dx,startrow     ;Row //y
                mov   al,00h          ;Pixel color
                mov   ah,0ch          ;Draw Pixel Command
                mov   si,startrow
     square:    
     right:     int   10h
                inc   cx
                mov   bx,0
                add   bx,25
                add   bx,startcol
                cmp   cx,bx
                jnz   right           ; this will draw a line of 25 length
                inc   si
                mov   cx,startrow     ;Column //x
                inc   dx              ;Row //y
                mov   bx,0
                add   bx,25
                add   bx,startrow
                cmp   si,bx
                jnz   square
ENDM
DrawGrid MACRO
              local      Row0
              local      Row1
              local      Row2
              local      Row3
              local      Row4
              local      Row5
              local      Row6
              local      Row7
              mov        di,0
     Row0:    
              MYWhiteRec 0, di
              add        di,80
              cmp        di,320
              jnz        Row0
              mov        di,40
     Row1:    
              MYWhiteRec 25, di
              add        di,80
              cmp        di,360
              jnz        Row1
              mov        di,0
     Row2:    
              MYWhiteRec 50, di
              add        di,80
              cmp        di,320
              jnz        Row2
              mov        di,40
     Row3:    
              MYWhiteRec 75, di
              add        di,80
              cmp        di,360
              jnz        Row3
              mov        di,0
     Row4:    
              MYWhiteRec 100, di
              add        di,80
              cmp        di,320
              jnz        Row4
              mov        di,40
     Row5:    
              MYWhiteRec 125, di
              add        di,80
              cmp        di,360
              jnz        Row5
              mov        di,0
     Row6:    
              MYWhiteRec 150, di
              add        di,80
              cmp        di,320
              jnz        Row6
              mov        di,40
     Row7:    
              MYWhiteRec 175, di
              add        di,80
              cmp        di,360
              jnz        Row7
ENDM
.model small
.stack 64
.data
     Length db 0
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