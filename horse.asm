; include CommonMacros.inc
; include D:\Download\githubtrial\X86-Chess\CommonMacros.inc
Draw MACRO startRow,startCol,piece,width,height
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
    drawPiece:
              call  far ptr  drawRow
              add   di,320
              dec   cx
              jnz   drawPiece
ENDM
.model huge
.stack 64
.data
    pawn        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    knight      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 01h, 01h, 00h, 00h, 01h, 01h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h
                db 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h
    PieceHeight dw 0
.code
drawRow PROC far
               push di
               push cx

               mov  cx,PieceHeight
    draw1:     
               mov  al,[si]
               cmp  al,00H
               je   background
               mov  es:[di],0fH
    background:
               inc  di
               inc  si
               dec  cx
               jnz  draw1
               pop  cx
               pop  di
               ret
               ENDP
main proc far
               mov  ax,@data
               mov  ds,ax
               mov  ah,0
               mov  al,13h
               int  10h
               Draw 150 ,150,pawn,16,16
            ;    Draw 0 ,0,pawn,16,16
            ;    Draw 100 ,100,knight,20,20
               Draw 150 ,100,knight,20,20
               hlt
main endp
end main