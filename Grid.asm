ChgVideoMode MACRO
                  mov ah,0
                  mov al,13h
                  int 10h
ENDM
MYWhiteRec MACRO startrow,startcol
                local square
                local right
                mov   cx,startcol     ;Column //x
                mov   dx,startrow     ;Row //
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
              cmp        RowVar,207
              jnz        col1

               
ENDM
Draw MACRO startRow,startCol,piece,width,height,c
              local drawPiece
              
              mov   ax,0A000H
              mov   es,ax
              mov   si,offset piece
              mov   ax,startRow
              mov   bx,320
              mul   bx
              add   ax,startCol
              mov   di,ax
              mov   cx,width
              mov   PieceHeight,height    
              mov color,c
           
    drawPiece:
              
                  drawRow
                
                
              add   di,320
              dec   cx
              jnz   drawPiece
ENDM
drawRow macro
local draw1
local background
               push di
               push cx

               mov  cx,PieceHeight
    draw1:     
               mov  al,[si]
               cmp  al,00H
               je   background
               cmp  al,02H
               je   background
               mov dx,color
               mov  es:[di],dx
    background:
               inc  di
               inc  si
               dec  cx
               jnz  draw1
               pop  cx
               pop  di
               endm

  startpieces MACRO
     local l
       Draw 0,96,king,16,16,3
      Draw 161,96,king,16,16,0 
     
      Draw 0,126,queen,13,16,3
      Draw 161,126,queen,13,16,0  
     
   mov cx,6
     l:
    
     push cx
  Draw  23,cx,pawn,16,16,3 
  pop cx
  push cx
  Draw 138,cx,pawn,16,16,0 
  pop cx    
  add cx,30
  cmp cx,240+6
  jne l

 Draw 0,66,Bishop,17,16,3 
  Draw 0,156,Bishop,17,16,3 
   Draw 161,66,Bishop,17,16,0
  Draw 161,156,Bishop,17,16,0

  Draw 0,36,knight,20,20,3 
  Draw 0,186,knight,20,20,3 
    Draw 161,36,knight,20,20,0
   Draw 161,186,knight,20,20,0

   Draw 0,6,rook,16,16,3 
   Draw 0,216,rook,16,16,3 
      Draw 161,6,rook,16,16,0
     Draw 161,216,rook,16,16,0

    
 
  ENDM
.model small
.stack 64
.data
     RowVar dw 0  
     PieceHeight dw 0
     color dw 0
   pawn db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h      

 Bishop db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
 db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 03h, 03h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
 db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 03h, 03h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
 db 00h, 00h, 00h, 00h, 00h, 03h, 03h, 03h, 03h, 03h, 03h, 00h, 00h, 00h, 00h, 00h 
 db 00h, 00h, 00h, 00h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 00h, 00h, 00h, 00h 
 db 00h, 00h, 00h, 00h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 00h, 00h, 00h, 00h 
 db 00h, 00h, 00h, 00h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 00h, 00h, 00h, 00h 
 db 00h, 00h, 00h, 00h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 00h, 00h, 00h, 00h 
 db 00h, 00h, 00h, 00h, 00h, 03h, 03h, 03h, 03h, 03h, 03h, 00h, 00h, 00h, 00h, 00h 
 db 00h, 00h, 00h, 00h, 00h, 03h, 03h, 03h, 03h, 03h, 03h, 00h, 00h, 00h, 00h, 00h 
 db 00h, 00h, 00h, 00h, 00h, 03h, 03h, 03h, 03h, 03h, 03h, 00h, 00h, 00h, 00h, 00h 
 db 00h, 00h, 00h, 00h, 00h, 00h, 03h, 03h, 03h, 03h, 00h, 00h, 00h, 00h, 00h, 00h 
 db 00h, 00h, 00h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 00h, 00h, 00h 
 db 00h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 00h 
 db 00h, 03h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 03h, 00h 
 db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
 knight  db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 01h, 01h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h
         queen db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 08h, 00h, 08h, 08h, 00h, 08h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 08h, 00h, 00h, 08h, 00h, 00h, 00h, 00h, 08h, 00h, 00h, 08h, 00h, 00h 
db  00h, 00h, 08h, 00h, 00h, 08h, 00h, 08h, 08h, 00h, 08h, 00h, 00h, 08h, 00h, 00h 
db  00h, 00h, 00h, 08h, 00h, 08h, 00h, 08h, 08h, 00h, 08h, 00h, 08h, 00h, 00h, 00h 
db  00h, 00h, 00h, 08h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 08h, 00h, 00h, 00h 
db  00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h 
db  00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
rook db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 01h, 01h, 00h, 00h, 01h, 01h, 00h, 00h, 01h, 01h, 00h, 00h, 00h 
db  00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
db  00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
db  00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
 king db 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 02h, 02h, 02h, 01h, 01h, 02h, 02h, 02h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 02h, 02h, 01h, 01h, 01h, 01h, 02h, 02h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 01h, 01h, 01h, 02h, 02h, 01h, 01h, 01h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 01h, 01h, 01h, 02h, 02h, 01h, 01h, 01h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 02h, 01h, 01h, 01h, 01h, 01h, 01h, 02h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 02h, 01h, 01h, 01h, 01h, 01h, 01h, 02h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h 
db  02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h 

.code


main proc far
          mov          ax,@data
          mov          ds,ax
          ChgVideoMode
          mov  ax,0A000H
         mov  es,ax  
      DrawGrid
       startpieces
      
       
            
     both:
          hlt
main endp
end main