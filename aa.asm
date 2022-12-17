
highlight_goto macro
    ;    local            exit11
    ;    local            exit22
    ;    local            exit33
                   local            back
                   mov              highlight_flag,'t'
                   mov              al,highlight_col_grid
                   mov              bl,3
                   mul              bl
                   mov              ah,0
                   mov              cx,ax
                   mov              al,highlight_row_grid
                   dec              al
                   mov              ah,0
                   mov              bl,24
                   mul              bl
                   add              ax,offset grid_row1
                   mov              di,ax
                   add              di,cx
                   mov              al,[di]
                   highlight_option
    ;                cmp              al,'0'
    ;                je               exit22
    ;                cmp              team,al
    ;                jz               exit11
    ;                cmp              team,al
    ;                jnz              exit33
    ;                jmp              back

    ; exit22:
    ;                highlight_option
    ;                jmp              back

    ; exit33:
    ;                highlight_option
    ;                mov              highlight_flag,'f'
    ;                jmp              back

    ; exit11:
    ;                mov              highlight_flag,'f'
    back:          
endm

highlight_option macro
                       
                     local team1
                     local team2
                     local to_piece
                     local horse_draw
                     local pwan_draw
                     local king_draw
                     local queen_draw
                     local Bishop_draw
                     local rook_draw
                     local exit
                     local square
                     local right
                     mov   cx,highlight_col              ;Column //x
                     mov   dx,highlight_row              ;Row //
                     mov   al,0ch                        ;Pixel color
                     mov   ah,0ch                        ;Draw Pixel Command
                     mov   si,highlight_row
    square:          
    right:           int   10h
                     inc   cx
                     mov   bx,0
                     add   bx,30
                     add   bx,highlight_col
                     cmp   cx,bx
                     jnz   right                         ; this will draw a line of 25 length
                     inc   si
                     mov   cx,highlight_col              ;Column //x
                     inc   dx                            ;Row //y
                     mov   bx,0
                     add   bx,23
                     add   bx,highlight_row
                     cmp   si,bx
                     jnz   square


                     mov   al,highlight_col_grid
                     dec   al
                     mov   bl,3
                     mul   bl
                     mov   cx,ax


                     mov   al,highlight_row_grid
                     dec   al
                     mov   ah,0
                     mov   bl,24
                     mul   bl
                     add   ax,offset grid_row1
                     mov   di,ax
                     add   di,cx
                     mov   al,[di]+1
                     cmp   al ,'1'
                     je    team1
                     cmp   al,'2'
                     je    team2
                     jmp   exit

    team1:           mov   check_color,3h
                     jmp   to_piece
    team2:           mov   check_color,0h
                     jmp   to_piece

    to_piece:        
                     

                     mov   al,highlight_col_grid
                     dec   al
                     mov   bl,3
                     mul   bl
                     mov   cx,ax


                     mov   al,highlight_row_grid
                     dec   al
                     mov   ah,0
                     mov   bl,24
                     mul   bl
                     add   ax,offset grid_row1
                     mov   di,ax
                     add   di,cx
                     mov   al,[di]
                     cmp   al,'h'
                     je    horse_draw
                     cmp   al,'q'
                     je    queen_draw
                     cmp   al,'p'
                     je    pwan_draw
                     cmp   al,'k'
                     je    king_draw
                     cmp   al,'b'
                     je    Bishop_draw
                     cmp   al,'r'
                     je    rook_draw
                     jmp   exit

    horse_draw:      
                     mov   cx,highlight_col
                     mov   column,cx
                     mov   cx,highlight_row
                     mov   row,cx
                     add   column,6
                     mov   dl,check_color
                     Draw  row,column,knight,20,20,dl
                     sub   column,6
                     jmp   exit

    queen_draw:      
                     mov   cx,highlight_col
                     mov   column,cx
                     mov   cx,highlight_row
                     mov   row,cx
                     add   column,6
                     mov   dl,check_color
                     Draw  row,column,queen,13,16,dl
                     sub   column,6
                     jmp   exit


    pwan_draw:       
                     mov   cx,highlight_col
                     mov   column,cx
                     mov   cx,highlight_row
                     mov   row,cx
                     add   column,6
                     mov   dl,check_color
                     Draw  row,column,pawn,16,16,dl
                     sub   column,6
                     jmp   exit

    king_draw:       
                     mov   cx,highlight_col
                     mov   column,cx
                     mov   cx,highlight_row
                     mov   row,cx
                     add   column,6
                     mov   dl,check_color
                     Draw  row,column,king,16,16,dl
                     sub   column,6
                     jmp   exit


    Bishop_draw:     
                     mov   cx,highlight_col
                     mov   column,cx
                     mov   cx,highlight_row
                     mov   row,cx
                     add   column,6
                     mov   dl,check_color
                     Draw  row,column,Bishop,17,16,dl
                     sub   column,6
                     jmp   exit


    rook_draw:       
                     mov   cx,highlight_col
                     mov   column,cx
                     mov   cx,highlight_row
                     mov   row,cx
                     add   column,6
                     mov   dl,check_color
                     Draw  row,column,rook,16,16,dl
                     sub   column,6
                     jmp   exit
    exit:            

endm

move_goto_cell_or_select macro clicked
                             local              up
                             local              down
                             local              right
                             local              left
                             local              enter
                             local              exit
                             pusha

                             cmp                clicked,75             ;;;left
                             je                 left
                             cmp                clicked,72             ;;;up
                             je                 up
                             cmp                clicked,80             ;;;down
                             je                 down
                             cmp                clicked,77             ;;;right
                             je                 right
                             cmp                clicked,28             ;;;enter
                             je                 enter

                             jmp                exit

    left:                    
                             cmp                current_col,00
                             je                 exit

                             sub                current_col,30
                             push               dx
                             mov                dx,current_row
                             mov                row,dx

                             mov                dx,current_col
                             mov                column,dx
                             add                column,30
                             HIGHLIGHT_selected 0
                             dec                current_col_grid
  
                             mov                dx,current_row
                             mov                row,dx
                             mov                dx,current_col
                             mov                column,dx
                             pop                dx
                             HIGHLIGHT_selected 1
                             jmp                exit



    down:                    
                             cmp                current_row,161
                             je                 exit

                             add                current_row,23
                             push               dx
                             mov                dx,current_row
                             mov                row,dx

                             mov                dx,current_col
                             mov                column,dx
                             sub                row,23
                             HIGHLIGHT_selected 0
                             inc                current_row_grid
                             mov                dx,current_row
                             mov                row,dx

                             mov                dx,current_col
                             mov                column,dx
                             pop                dx
                             HIGHLIGHT_selected 1
                             jmp                exit

    up:                      
                             cmp                current_row,0
                             je                 exit

                             sub                current_row,23
                             push               dx
                             mov                dx,current_row
                             mov                row,dx

                             mov                dx,current_col
                             mov                column,dx
                             add                row,23
                             HIGHLIGHT_selected 0
                             dec                current_row_grid
                             mov                dx,current_row
                             mov                row,dx

                             mov                dx,current_col
                             mov                column,dx
                             pop                dx
                             HIGHLIGHT_selected 1
                             jmp                exit

    right:                   
                             cmp                current_col,210
                             je                 exit

                             add                current_col,30
                             push               dx
                             mov                dx,current_row
                             mov                row,dx

                             mov                dx,current_col
                             mov                column,dx
                             sub                column,30
                             HIGHLIGHT_selected 0
                             inc                current_col_grid
                             mov                dx,current_row
                             mov                row,dx
                             mov                dx,current_col
                             mov                column,dx
                             pop                dx
                             HIGHLIGHT_selected 1
                             jmp                exit

    enter:                   
                             mov                ax,current_col
                             mov                goto_col,ax

                             mov                ax,current_row
                             mov                goto_row,ax

                             mov                al,current_col_grid
                             mov                goto_col_grid,al

                             mov                al,current_row_grid
                             mov                goto_row_grid,al

                             call               move_piece

                             jmp                exit
    exit:                    
                             popa
endm

move_current_cell_or_select macro clicked
                                local              up
                                local              down
                                local              right
                                local              left
                                local              enter
                                local              exit
                                local              exit1
                                local              r
                                local              kh
                                local              q
                                local              kg
                                local              b
                                local              p
                              
                                pusha

                                cmp                clicked,75              ;;;left
                                je                 left
                                cmp                clicked,72              ;;;up
                                je                 up
                                cmp                clicked,80              ;;;down
                                je                 down
                                cmp                clicked,77              ;;;right
                                je                 right
                                cmp                clicked,28              ;;;enter
                                je                 enter

                                jmp                exit

    left:                       
                                cmp                current_col,00
                                je                 exit

                                sub                current_col,30
                                push               dx
                                mov                dx,current_row
                                mov                row,dx

                                mov                dx,current_col
                                mov                column,dx
                                add                column,30
                                HIGHLIGHT_selected 0
                                dec                current_col_grid
  
                                mov                dx,current_row
                                mov                row,dx
                                mov                dx,current_col
                                mov                column,dx
                                pop                dx
                                HIGHLIGHT_selected 1
                                jmp                exit



    down:                       
                                cmp                current_row,161
                                je                 exit

                                add                current_row,23
                                push               dx
                                mov                dx,current_row
                                mov                row,dx

                                mov                dx,current_col
                                mov                column,dx
                                sub                row,23
                                HIGHLIGHT_selected 0
                                inc                current_row_grid
                                mov                dx,current_row
                                mov                row,dx

                                mov                dx,current_col
                                mov                column,dx
                                pop                dx
                                HIGHLIGHT_selected 1
                                jmp                exit

    up:                         
                                cmp                current_row,0
                                je                 exit

                                sub                current_row,23
                                push               dx
                                mov                dx,current_row
                                mov                row,dx

                                mov                dx,current_col
                                mov                column,dx
                                add                row,23
                                HIGHLIGHT_selected 0
                                dec                current_row_grid
                                mov                dx,current_row
                                mov                row,dx

                                mov                dx,current_col
                                mov                column,dx
                                pop                dx
                                HIGHLIGHT_selected 1
                                jmp                exit

    right:                      
                                cmp                current_col,210
                                je                 exit

                                add                current_col,30
                                push               dx
                                mov                dx,current_row
                                mov                row,dx

                                mov                dx,current_col
                                mov                column,dx
                                sub                column,30
                                HIGHLIGHT_selected 0
                                inc                current_col_grid
                                mov                dx,current_row
                                mov                row,dx
                                mov                dx,current_col
                                mov                column,dx
                                pop                dx
                                HIGHLIGHT_selected 1
                                jmp                exit

    enter:                      
   
                                mov                al,current_col_grid
                                dec                al
                                mov                bl,3
                                mul                bl
                                mov                cx,ax
                                mov                al,current_row_grid
                                dec                al
                                mov                ah,0
                                mov                bl,24
                                mul                bl
                                add                ax,offset grid_row1
                                mov                di,ax
                                add                di,cx
                                mov                al,[di]
                                cmp                al ,'0'
                                je                 exit

                                mov                ax,current_col
                                mov                selected_col,ax

                                mov                ax,current_row
                                mov                selected_row,ax

                                mov                al,current_col_grid
                                mov                selected_col_grid,al

                                mov                al,current_row_grid
                                mov                selected_row_grid,al

                                mov                al,selected_col_grid
                                dec                al
                                mov                bl,3
                                mul                bl
                                mov                cx,ax
                                mov                al,selected_row_grid
                                dec                al
                                mov                ah,0
                                mov                bl,24
                                mul                bl
                                add                ax,offset grid_row1
                                mov                di,ax
                                add                di,cx
                                mov                al,[di]
                                cmp                al,'h'
                                je                 kh
                                cmp                al,'p'
                                je                 p
                                cmp                al,'b'
                                je                 b
                                cmp                al,'r'
                                je                 r
                                cmp                al,'q'
                                je                 q
                                cmp                al,'k'
                                je                 kg
                                jmp                exit
    kh:                         
                                call               move_knight
                                jmp                exit1
   
    p:                          
                                call               move_pawn
                                jmp                exit1
    r:                          
                                call               move_rook
                                jmp                exit1
    b:                          
                                call               move_bishop
                                jmp                exit1
    kg:                         
                                 call               move_king
                                jmp                exit1
    q:                          
                                call               move_bishop
                                call               move_rook
                                jmp                exit1

    exit1:                      
                                call               loop_until_goto
                                jmp                exit
    exit:                       
endm

mov_until_select macro
                     local                       exit
                     local                       check
                     pusha
    check:           
                     mov                         ah,01H
                     int                         16h
                     jz                          check
                     mov                         ah,00
                     int                         16h
                     move_current_cell_or_select ah
                     jmp                         check
    exit:            
                     popa
endm


ChgVideoMode MACRO
                 mov ah,0
                 mov al,13h
                 int 10h
ENDM

MYWhiteRec MACRO startrow,startcol
               local square
               local right
               mov   cx,startcol    ;Column //x
               mov   dx,startrow    ;Row //
               mov   al,0fh         ;Pixel color
               mov   ah,0ch         ;Draw Pixel Command
               mov   si,startrow
    square:    
    right:     int   10h
               inc   cx
               mov   bx,0
               add   bx,30
               add   bx,startcol
               cmp   cx,bx
               jnz   right          ; this will draw a line of 25 length
               inc   si
               mov   cx,startcol    ;Column //x
               inc   dx             ;Row //y
               mov   bx,0
               add   bx,23
               add   bx,startrow
               cmp   si,bx
               jnz   square
ENDM
MYBrownRec MACRO startrow,startcol
               local square
               local right
               mov   cx,startcol    ;Column //x
               mov   dx,startrow    ;Row //y
               mov   al,06h         ;Pixel color
               mov   ah,0ch         ;Draw Pixel Command
               mov   si,startrow
    square:    
    right:     int   10h
               inc   cx
               mov   bx,0
               add   bx,30
               add   bx,startcol
               cmp   cx,bx
               jnz   right          ; this will draw a line of 25 length
               inc   si
               mov   cx,startcol    ;Column //x
               inc   dx             ;Row //y
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
              local   drawPiece
              push    dx
              mov     ax,0A000H
              mov     es,ax
              mov     si,offset piece
              mov     ax,startRow
              mov     bx,320
              mul     bx
              add     ax,startCol
              mov     di,ax
              mov     cx,width
              
              mov     PieceHeight,height
              pop     dx
              mov     color,c
           
    drawPiece:
              
              drawRow
                
                
              add     di,320
              dec     cx
              jnz     drawPiece
ENDM
drawRow macro
               local draw1
               local background
               push  di
               push  cx

               mov   cx,PieceHeight
    draw1:     
               mov   al,[si]
               cmp   al,00H
               je    background
               cmp   al,02H
               je    background
               mov   dl,color
               mov   dh,0
               mov   es:[di],dx
    background:
               inc   di
               inc   si
               dec   cx
               jnz   draw1
               pop   cx
               pop   di
endm

MY_HIGHLIGHT_Rec MACRO startrow,startcol
                     local square
                     local right
                     mov   cx,startcol    ;Column //x
                     mov   dx,startrow    ;Row //
                     mov   al,07h         ;Pixel color
                     mov   ah,0ch         ;Draw Pixel Command
                     mov   si,startrow
    square:          
    right:           int   10h
                     inc   cx
                     mov   bx,0
                     add   bx,30
                     add   bx,startcol
                     cmp   cx,bx
                     jnz   right          ; this will draw a line of 25 length
                     inc   si
                     mov   cx,startcol    ;Column //x
                     inc   dx             ;Row //y
                     mov   bx,0
                     add   bx,23
                     add   bx,startrow
                     cmp   si,bx
                     jnz   square
ENDM

startpieces MACRO
                local l
                Draw  0,96,king,16,16,3
                Draw  161,96,king,16,16,0
     
                Draw  0,126,queen,13,16,3
                Draw  161,126,queen,13,16,0
     
                mov   cx,6
    l:          
    
                push  cx
                Draw  23,cx,pawn,16,16,3
                pop   cx
                push  cx
                Draw  138,cx,pawn,16,16,0
                pop   cx
                add   cx,30
                cmp   cx,240+6
                jne   l

                Draw  0,66,Bishop,17,16,3
                Draw  0,156,Bishop,17,16,3
                Draw  161,66,Bishop,17,16,0
                Draw  161,156,Bishop,17,16,0

                Draw  0,36,knight,20,20,3
                Draw  0,186,knight,20,20,3
                Draw  161,36,knight,20,20,0
                Draw  161,186,knight,20,20,0

                Draw  0,6,rook,16,16,3
                Draw  0,216,rook,16,16,3
                Draw  161,6,rook,16,16,0
                Draw  161,216,rook,16,16,0

    
 
ENDM

HIGHLIGHT_selected macro flag
                       local            draw_b
                       local            draw_w
                       local            to_team_color
                       local            team1
                       local            team2
                       local            to_piece
                       local            horse_draw
                       local            pwan_draw
                       local            king_draw
                       local            queen_draw
                       local            Bishop_draw
                       local            rook_draw
                       local            exit
                       local            draw_highlight


                       mov              cl,flag
                       cmp              cl,0
                       jne              draw_highlight
                       mov              al,current_col_grid
                       dec              al
                       mov              bl,3
                       mul              bl
                       mov              cx,ax


                       mov              al,current_row_grid
                       dec              al
                       mov              ah,0
                       mov              bl,24
                       mul              bl
                       add              ax,offset grid_row1
                       mov              di,ax
                       add              di,cx
                       mov              al,[di]+2
                       cmp              al ,'w'
                       je               draw_w
                       cmp              al ,'b'
                       je               draw_b
                       jmp              exit



    draw_b:            

                       MYBrownRec       row,column

                       jmp              to_team_color
    draw_w:            

                       MYWhiteRec       row,column
                       jmp              to_team_color

    draw_highlight:    


                       MY_HIGHLIGHT_Rec current_row,current_col
                       jmp              to_team_color



    to_team_color:     
                       mov              al,current_col_grid
                       dec              al
                       mov              bl,3
                       mul              bl
                       mov              cx,ax


                       mov              al,current_row_grid
                       dec              al
                       mov              ah,0
                       mov              bl,24
                       mul              bl
                       add              ax,offset grid_row1
                       mov              di,ax
                       add              di,cx
                       mov              al,[di]+1
                       cmp              al ,'1'
                       je               team1
                       cmp              al,'2'
                       je               team2
                       jmp              exit

    team1:             mov              check_color,3h
                       jmp              to_piece
    team2:             mov              check_color,0h
                       jmp              to_piece

    to_piece:          
                       mov              al,current_col_grid
                       dec              al
                       mov              bl,3
                       mul              bl
                       mov              bx,ax

                       mov              al,current_col_grid
                       dec              al
                       mov              bl,3
                       mul              bl
                       mov              cx,ax


                       mov              al,current_row_grid
                       dec              al
                       mov              ah,0
                       mov              bl,24
                       mul              bl
                       add              ax,offset grid_row1
                       mov              di,ax
                       add              di,cx
                       mov              al,[di]
                       cmp              al,'h'
                       je               horse_draw
                       cmp              al,'q'
                       je               queen_draw
                       cmp              al,'p'
                       je               pwan_draw
                       cmp              al,'k'
                       je               king_draw
                       cmp              al,'b'
                       je               Bishop_draw
                       cmp              al,'r'
                       je               rook_draw
                       jmp              exit

    horse_draw:        
                       add              column,6
                       mov              dl,check_color

                       Draw             row,column,knight,20,20,dl
                       sub              column,6
                       jmp              exit

    queen_draw:        

                       add              column,6
                       mov              dl,check_color
                       Draw             row,column,queen,13,16,dl
                       sub              column,6
                       jmp              exit


    pwan_draw:         

                       add              column,6
                       mov              dl,check_color
                       Draw             row,column,pawn,16,16,dl
                       sub              column,6
                       jmp              exit

    king_draw:         

                       add              column,6
                       mov              dl,check_color
                       Draw             row,column,king,16,16,dl
                       sub              column,6
                       jmp              exit


    Bishop_draw:       

                       add              column,6
                       mov              dl,check_color
                       Draw             row,column,Bishop,17,16,dl
                       sub              column,6
                       jmp              exit


    rook_draw:         
                       add              column,6
                       mov              dl,check_color
                       Draw             row,column,rook,16,16,dl
                       sub              column,6
                       jmp              exit

    exit:              


endm


.model huge
.stack 64
.data
    row                dw ?
    column             dw ?
    team1_pos          dw 0,0 ,0,30,00,60,00,90,0,120,0,150,0,180,0,210
                       dw 23,0,23,30,23,60 ,23,90,23,120,23,150,23,180,23,210
    team2_pos          dw 138,0,138,30,138,60,138,90,138,120,138,150,138,150,138,210
                       dw 161,0,161,30,161,60,161,90,161,120,161,150,161,180,161,210

    current_row        dw 0                                                                                                     ;;;;pixel
    current_col        dw 90                                                                                                    ;;;;pixel
    current_row_grid   db 1
    current_col_grid   db 4

    selected_row       dw -1                                                                                                    ;;;;pixel
    selected_col       dw -1                                                                                                    ;;;;pixel
    selected_row_grid  db -1
    selected_col_grid  db -1

    goto_row           dw -1                                                                                                    ;;;;pixel
    goto_col           dw -1                                                                                                    ;;;;pixel
    goto_row_grid      db -1
    goto_col_grid      db -1

    highlight_row      dw -1                                                                                                    ;;;;pixel
    highlight_col      dw -1                                                                                                    ;;;;pixel
    highlight_row_grid db -1
    highlight_col_grid db -1

    cell               dw ?
    check_color        db 3

    RowVar             dw 0
    PieceHeight        dw 0
    color              db 0
    highlight_flag     db 't'                                                                                                   ;;;;;t--->highlight   f->stop there is piece feom your team
    team               db 0
    pawn               db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
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

    Bishop             db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
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
    knight             db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
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
    queen              db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 00h, 08h, 00h, 08h, 08h, 00h, 08h, 00h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 08h, 00h, 00h, 08h, 00h, 00h, 00h, 00h, 08h, 00h, 00h, 08h, 00h, 00h
                       db 00h, 00h, 08h, 00h, 00h, 08h, 00h, 08h, 08h, 00h, 08h, 00h, 00h, 08h, 00h, 00h
                       db 00h, 00h, 00h, 08h, 00h, 08h, 00h, 08h, 08h, 00h, 08h, 00h, 08h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 08h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 08h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 08h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    rook               db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 01h, 01h, 00h, 00h, 01h, 01h, 00h, 00h, 01h, 01h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                       db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    king               db 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 02h, 02h, 02h, 01h, 01h, 02h, 02h, 02h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 02h, 02h, 01h, 01h, 01h, 01h, 02h, 02h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 01h, 01h, 01h, 02h, 02h, 01h, 01h, 01h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 01h, 01h, 01h, 02h, 02h, 01h, 01h, 01h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 02h, 01h, 01h, 01h, 01h, 01h, 01h, 02h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 02h, 01h, 01h, 01h, 01h, 01h, 01h, 02h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h
                       db 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h

    grid_row1          db 'r1w', 'h1b', 'b1w', 'k1b', 'q1w', 'b1b', 'h1w','r1b'
    grid_row2          db 'p1b', 'p1w', 'p1b', 'p1w', 'p1b', 'p1w', 'p1b', 'p1w'
    grid_row3          db '00w', '00b', '00w', '00b', '00w', '00b', '00w', '00b'
    grid_row4          db '00b', '00w', '00b', '00w', '00b', '00w', '00b', '00w'
    grid_row5          db '00w', '00b', '00w', '00b', '00w', '00b', '00w', '00b'
    grid_row6          db '00b', '00w', '00b', '00w', '00b', '00w', '00b', '00w'
    grid_row7          db 'p2w', 'p2b', 'p2w', 'p2b', 'p2w', 'p2b', 'p2w', 'p2b'
    grid_row8          db 'r2b', 'h2w', 'b2b', 'k2w', 'q2b', 'b2w', 'h2b', 'r2w'


    highlight_row1     db 'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
    highlight_row2     db 'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
    highlight_row3     db 'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
    highlight_row4     db 'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
    highlight_row5     db 'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
    highlight_row6     db 'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
    highlight_row7     db 'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
    highlight_row8     db 'f', 'f', 'f', 'f', 'f', 'f', 'f','f'



    ;;;;;h->horse  q->queen   p->pawn   k->king   b->Bishop   r->rook   1->green->team1   2->black->team2  00->no_piece w-b--->white-black
    ;;;;rook--horse--Bishop--king---queen--Bishop--horse--rook      8pawn
    ; current_pos dw 00,90


.code

move_pawn proc far
             
                         mov                      al,selected_col_grid
                         dec                      al
                         mov                      bl,3
                         mul                      bl
                         mov                      cx,ax
                         mov                      al,selected_row_grid
                         dec                      al
                         mov                      ah,0
                         mov                      bl,24
                         mul                      bl
                         add                      ax,offset grid_row1
                         mov                      di,ax
                         add                      di,cx
                         mov                      al,[di]+1
                         mov                      ah,0
                         mov                      team,al
                         cmp                      al ,'1'
                         je                       pteam1
                         cmp                      al ,'2'
                         je                       pteam2
                         jmp                      pexit

    pteam1:              
                         mov                      dl,1                         ;;;;;;;;;row
                         mov                      dh,0                         ;;;;;;;;;column
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bx,23
                         add                      highlight_row,bx
                         jmp                      pchange

    pteam2:              
                         mov                      dl,-1                        ;;;;;;;;;row
                         mov                      dh,0                         ;;;;;;;;;column
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bx,23
                         sub                      highlight_row,23
                         jmp                      pchange

    pchange:             
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         add                       highlight_row_grid,dl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
                         add                      highlight_col_grid,dh
                         call set_highlighled_true
                         highlight_goto
    pexit:               
                         ret
move_pawn endp
move_bishop proc   far
                         mov                      al,selected_col_grid
                         dec                      al
                         mov                      bl,3
                         mul                      bl
                         mov                      cx,ax
                         mov                      al,selected_row_grid
                         dec                      al
                         mov                      ah,0
                         mov                      bl,24
                         mul                      bl
                         add                      ax,offset grid_row1
                         mov                      di,ax
                         add                      di,cx
                         mov                      al,[di]+1
                         mov                      team,al
                         cmp                      al ,'1'
                         je                       bteam1
                         cmp                      al ,'2'
                         je                       bteam2
                         jmp                      bexit

    bteam1:              
    bteam2:              
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    bcompare1:           
                         add                      highlight_row,23
                         add                      highlight_col,30
                         cmp                      highlight_col,240
                         je                       blevel2
                         cmp                      highlight_row,184
                         je                       blevel2
                         add                      highlight_row_grid,1
                         add                      highlight_col_grid,1
                         call set_highlighled_true
                         highlight_goto
                         cmp                      highlight_flag,'f'
                         je                       blevel2
                         jmp                      bcompare1

                
    blevel2:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    bcompare2:           
                         add                      highlight_row,23
                         sub                      highlight_col,30
                         cmp                      highlight_col,-30
                         je                       blevel3
                         cmp                      highlight_row,184
                         je                       blevel3
                         add                      highlight_row_grid,1
                         
                         sub                      highlight_col_grid,1
                        call set_highlighled_true
                         highlight_goto
                         cmp                      highlight_flag,'f'
                         je                       blevel3
                         jmp                      bcompare2


    blevel3:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    bcompare3:           
                         sub                      highlight_row,23
                         add                      highlight_col,30
                         cmp                      highlight_col,240
                         je                       blevel4
                         cmp                      highlight_row,-23
                         je                       blevel4
                         sub                      highlight_row_grid,1
                         
                         add                      highlight_col_grid,1
                         call set_highlighled_true
                         highlight_goto
                         cmp                      highlight_flag,'f'
                         je                       blevel4
                         jmp                      bcompare3

    blevel4:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    bcompare4:           
                         sub                      highlight_row,23
                         sub                      highlight_col,30
                         cmp                      highlight_col,-30
                         je                       bexit
                         cmp                      highlight_row,-23
                         je                       bexit
                         sub                      highlight_row_grid,1
                         
                         sub                      highlight_col_grid,1
                         call set_highlighled_true
                         highlight_goto
                         cmp                      highlight_flag,'f'
                         je                       bexit
                         jmp                      bcompare4



    bexit:               
                         ret
move_bishop endp
move_rook proc  far

                         mov                      al,selected_col_grid
                         dec                      al
                         mov                      bl,3
                         mul                      bl
                         mov                      cx,ax
                         mov                      al,selected_row_grid
                         dec                      al
                         mov                      ah,0
                         mov                      bl,24
                         mul                      bl
                         add                      ax,offset grid_row1
                         mov                      di,ax
                         add                      di,cx
                         inc                      di
                         mov                      al,[di]
                         mov                      team,al
                         cmp                      al ,'1'
                         je                       rteam1
                         cmp                      al ,'2'
                         je                       rteam2
                         jmp                      rexit

    rteam1:              
    rteam2:              
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    rcompare1:           
                         add                      highlight_row,23
                         cmp                      highlight_row,184
                         je                       rlevel2
                         add                      highlight_row_grid,1
                         call set_highlighled_true
                         highlight_goto
                         cmp                      highlight_flag,'f'
                         je                       rlevel2
                         jmp                      rcompare1
               
                


                
    rlevel2:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    rcompare2:           
                         sub                      highlight_row,23
                         cmp                      highlight_row,-23
                         je                       rlevel3
                         sub                      highlight_row_grid,1
                         call set_highlighled_true
                         highlight_goto
                         cmp                      highlight_flag,'f'
                         je                       rlevel3
                         jmp                      rcompare2


    rlevel3:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    rcompare3:           
                
                         add                      highlight_col,30
                         cmp                      highlight_col,240
                         je                       rlevel4
                         add                      highlight_col_grid,1
                         call set_highlighled_true
                         highlight_goto
                         cmp                      highlight_flag,'f'
                         je                       rlevel4
                         jmp                      rcompare3

    rlevel4:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    rcompare4:           
               
                         sub                      highlight_col,30
                         cmp                      highlight_col,-30
                         je                       rexit
                         sub                      highlight_col_grid,1
                         call set_highlighled_true
                         highlight_goto
                         cmp                      highlight_flag,'f'
                         je                       rexit
                         jmp                      rcompare4



    rexit:               
                         ret
move_rook endp
move_knight proc  far
                         mov                      al,selected_col_grid
                         dec                      al
                         mov                      bl,3
                         mul                      bl
                         mov                      cx,ax
                         mov                      al,selected_row_grid
                         dec                      al
                         mov                      ah,0
                         mov                      bl,24
                         mul                      bl
                         add                      ax,offset grid_row1
                         mov                      di,ax
                         add                      di,cx
                         mov                      al,[di]+1
                         mov                      ah,0
                         mov                      team,al
                         cmp                      al ,'1'
                         je                       kteam1
                         cmp                      al ,'2'
                         je                       kteam2
                         jmp                      kexit
 
    kteam1:              
    kteam2:              
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    choise1:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
       
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  +2c   +1r
                         add                      highlight_col,60
                         add                      highlight_row,23
                         cmp                      highlight_col,210
                         ja                       choise2
                         cmp                      highlight_row,161
                         ja                       choise2
                         add                      highlight_col_grid,2
                         add                      highlight_row_grid,1
                        call set_highlighled_true
                         highlight_goto
                
                
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    choise2:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;+2c -1r
                         add                      highlight_col,60
                         sub                      highlight_row,23
                         cmp                      highlight_col,210
                         ja                       choise3
                         cmp                      highlight_row,0
                         jl                       choise3
                         add                      highlight_col_grid,2
                         sub                      highlight_row_grid,1
                        call set_highlighled_true
                         highlight_goto
                
    ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    choise3:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-2c +1r
                         sub                      highlight_col,60
                         add                      highlight_row,23
                         cmp                      highlight_col,0
                         jl                       choise4
                         cmp                      highlight_row,161
                         ja                       choise4
                         sub                      highlight_col_grid,2
                         add                      highlight_row_grid,1
                        call set_highlighled_true
                         highlight_goto
               
    ;     ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    choise4:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-2c -1r
                         sub                      highlight_col,60
                         sub                      highlight_row,23
                         cmp                      highlight_col,0
                         jl                       choise5
                         cmp                      highlight_row,0
                         jl                       choise5
                         sub                      highlight_col_grid,2
                         sub                      highlight_row_grid,1
                        call set_highlighled_true
                         highlight_goto
               
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    choise5:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;+2r +1c
                         add                      highlight_col,30
                         add                      highlight_row,46
                         cmp                      highlight_col,210
                         ja                       choise6
                         cmp                      highlight_row,161
                         ja                       choise6
                         add                      highlight_col_grid,1
                         add                      highlight_row_grid,2
                       call set_highlighled_true
                         highlight_goto
               
    ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    choise6:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    ;;;;;;;;;;;;;;;;;;;;;;;;;+2r   -1c
                         sub                      highlight_col,30
                         add                      highlight_row,46
                         cmp                      highlight_col,0
                         jl                       choise7
                         cmp                      highlight_row,161
                         ja                       choise7
                         sub                      highlight_col_grid,1
                         add                      highlight_row_grid,2
                        call set_highlighled_true
                         highlight_goto
               
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    choise7:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-2r +1c
                         add                      highlight_col,30
                         sub                      highlight_row,46
                         cmp                      highlight_col,210
                         ja                       choise8
                         cmp                      highlight_row,0
                         jl                       choise8
                         add                      highlight_col_grid,1
                         sub                      highlight_row_grid,2
                        call set_highlighled_true
                         highlight_goto
               
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    choise8:             
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    ;;;;;;;;;;;;;;;;;;;;;;;-2r   -1c
                         sub                      highlight_col,30
                         sub                      highlight_row,46
                         cmp                      highlight_col,0
                         jl                       kexit
                         cmp                      highlight_row,0
                         jl                       kexit
                         sub                      highlight_col_grid,1
                         sub                      highlight_row_grid,2
                        call set_highlighled_true
                         highlight_goto
    
    kexit: ret               
                        
move_knight endp
loop_until_goto proc far
                    
    ; pusha
    check:               
                         mov                      ax,goto_col
                         cmp                      ax,-1
                         jne                      exitl
                         mov                      ah,01H
                         int                      16h
                         jz                       check
                         mov                      ah,00
                         int                      16h
                         move_goto_cell_or_select ah
                         jmp                      check
    exitl:               
                         mov                      goto_col,-1
                         mov                      goto_row,-1
                         mov                      goto_row_grid,-1
                         mov                      goto_col_grid,-1
    ; popa
                         ret
loop_until_goto endp
move_piece proc far
                         mov                      al,goto_row_grid
                         dec                      al
                         mov                      bl,8
                         mul                      bl
                         mov                      bl,goto_col_grid
                         dec                      bl
                         add                      al,bl
                         mov                      di ,offset highlight_row1
                         mov                      ah,0
                         add                      di,ax
                         mov                      cl,[di]
    ;    cmp                cl,'f'
    ;    je                 exit

                         mov                      al,selected_col_grid
                         dec                      al
                         mov                      bl,3
                         mul                      bl
                         mov                      cx,ax


                         mov                      al,selected_row_grid
                         dec                      al
                         mov                      ah,0
                         mov                      bl,24
                         mul                      bl
                         add                      ax,offset grid_row1
                         mov                      di,ax
                         add                      di,cx

                         mov                      cl,[di]                      ;;;;;piece

                         mov                      ch,[di]+1                    ;;;team color
                         push                     cx
                         mov                      [di],'0'

               
    ;   inc di
    ;    mov                [di],'0'
    ;    dec di
             

                         mov                      ax,selected_col
                         mov                      column,ax
                         mov                      bx, selected_row
                         mov                      row,bx
                         mov                      ax,selected_col
                         mov                      current_col,ax
                         mov                      ax,selected_row
                         mov                      current_row,ax
                         mov                      al,selected_col_grid
                         mov                      current_col_grid,al
                         mov                      al,selected_row_grid
                         mov                      current_row_grid,al
                         HIGHLIGHT_selected       0

                         mov                      al,goto_col_grid
                         dec                      al
                         mov                      bl,3
                         mul                      bl
                         mov                      cx,ax
                         mov                      al,goto_row_grid
                         dec                      al
                         mov                      ah,0
                         mov                      bl,24
                         mul                      bl
                         add                      ax,offset grid_row1
                         mov                      si,ax
                         add                      si,cx
                         mov                      al,[si]
                         pop                      cx
                         mov                      [si],cl
                         mov                      [si]+1,ch
                         mov                      ax,goto_col
                         mov                      column,ax
                         mov                      ax, goto_row
                         mov                      row,ax
                         mov                      ax,goto_col
                         mov                      current_col,ax
                         mov                      ax,goto_row
                         mov                      current_row,ax
                         mov                      al,goto_col_grid
                         mov                      current_col_grid,al
                         mov                      al,goto_row_grid
                         mov                      current_row_grid,al

                         mov                      ax,goto_col
                         mov                      column,ax
                         mov                      ax, goto_row
                         mov                      row,ax
                         HIGHLIGHT_selected       0


                         mov                      selected_col,-1
                         mov                      selected_row,-1
                         mov                      selected_row_grid,-1
                         mov                      selected_col_grid,-1

     
                         ret
move_piece endp
move_king proc far
                         mov                      al,selected_col_grid
                         dec                      al
                         mov                      bl,3
                         mul                      bl
                         mov                      cx,ax
                         mov                      al,selected_row_grid
                         dec                      al
                         mov                      ah,0
                         mov                      bl,24
                         mul                      bl
                         add                      ax,offset grid_row1
                         mov                      di,ax
                         add                      di,cx
                         mov                      al,[di]+1
                         mov                      ah,0
                         mov                      team,al
                         cmp                      al ,'1'
                         je                       jteam1
                         cmp                      al ,'2'
                         je                       jteam2
                         jmp                      jexit

    jteam1:              
    jteam2:              
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    m1:                                                                        ;;;;;;;;;;;-1r
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    jcompare1:           
                         sub                      highlight_row,23
                         cmp                      highlight_row,-23
                         je                       m2
                         sub                      highlight_row_grid,1
                         call                     set_highlighled_true
                         highlight_goto
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    m2:                                                                        ;;;;;;;;;;;;;-1r  +1c
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    jcompare2:           
                         sub                      highlight_row,23
                         add                      highlight_col,30
                         cmp                      highlight_row,-23
                         je                       m3
                         cmp                      highlight_col,240
                         je                       m3
                         sub                      highlight_row_grid,1
                         add                      highlight_col_grid,1
                         call                     set_highlighled_true
                         highlight_goto
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    m3:                                                                        ;;;;;;;;;;;;;  +1c
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    jcompare3:           
                         add                      highlight_col,30
                         cmp                      highlight_col,240
                         je                       m4
                         add                      highlight_col_grid,1
                         call                     set_highlighled_true
                         highlight_goto
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    m4:                                                                        ;;;;;;;;;;;;;+1r  +1c
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    jcompare4:           
                         add                      highlight_row,23
                         add                      highlight_col,30
                         cmp                      highlight_row,184
                         je                       m5
                         cmp                      highlight_col,240
                         je                       m5
                         add                      highlight_row_grid,1
                         add                      highlight_col_grid,1
                         call                     set_highlighled_true
                         highlight_goto
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    m5:                                                                        ;;;;;;;;;;;;;+1r 
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    jcompare5:           
                         add                      highlight_row,23
                         cmp                      highlight_row,184
                         je                       m6
                         add                      highlight_row_grid,1
                         call                     set_highlighled_true
                         highlight_goto
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    m6:                                                                        ;;;;;;;;;;;;;+1r  -1c
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    jcompare6:           
                         add                      highlight_row,23
                         sub                      highlight_col,30
                         cmp                      highlight_row,184
                         je                       m7
                         cmp                      highlight_col,-30
                         je                       m7
                         add                      highlight_row_grid,1
                         sub                      highlight_col_grid,1
                         call                     set_highlighled_true
                         highlight_goto
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    m7:                                                                        ;;;;;;;;;;;;;-1c
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    jcompare7:           
                         sub                      highlight_col,30
                         cmp                      highlight_col,-30
                         je                       m8
                         sub                      highlight_col_grid,1
                         call                     set_highlighled_true
                         highlight_goto
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    m8:                                                                        ;;;;;;;;;;;;;-1r  -1c
                         mov                      bx,selected_col
                         mov                      highlight_col,bx
                         mov                      cx,selected_row
                         mov                      highlight_row,cx
                         mov                      bl, selected_row_grid
                         mov                      highlight_row_grid,bl
                         mov                      bh, selected_col_grid
                         mov                      highlight_col_grid,bh
    jcompare8:           
                         sub                      highlight_col,30
                         sub                      highlight_row,23
                         cmp                      highlight_col,-30
                         je                       jexit
                         cmp                      highlight_row,-23
                         je                       jexit
                         sub                      highlight_col_grid,1
                         sub                      highlight_row_grid,1
                         call                     set_highlighled_true
                         highlight_goto
                          jmp jexit


    jexit:               ret
move_king endp

set_highlighled_true proc far
                         mov                      bl,highlight_row_grid
                         dec                      bl
                         mov                      bh,highlight_col_grid
                         dec                      bh
                         mov                      di,offset highlight_row1
                         mov                      al,bl
                         mov                      ah,0
                         mov                      cl,8
                         mul                      cl
                         add                      di,ax
                         mov                      bl,bh
                         mov                      bh,0
                         add                      di,bx
                         mov                      [di],'t'
                         ret
set_highlighled_true endp


main proc far
                         mov                      ax,@data
                         mov                      ds,ax
                         ChgVideoMode
                         mov                      ax,0A000H
                         mov                      es,ax
                         DrawGrid
                         startpieces
                         MY_HIGHLIGHT_Rec         00,0090
                         Draw                     0,96,king,16,16,3
                         mov_until_select
                         mov                      ah,4ch
                         int                      21h

main endp
end main


