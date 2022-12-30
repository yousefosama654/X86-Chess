.model small
.386
.stack 64
include macros.inc
.data
                           include graphics.inc
   row                     dw      ?
   column                  dw      ?
   current_row             dw      0                                                                                              ;;;;pixel
   current_col             dw      90                                                                                             ;;;;pixel
   current_row_grid        db      1
   current_col_grid        db      4
   selected_row            dw      -1                                                                                             ;;;;pixel
   selected_col            dw      -1                                                                                             ;;;;pixel
   selected_row_grid       db      -1
   selected_col_grid       db      -1

   start_hour              db      0
   start_minute            db      0
   start_second            db      0
   current_hour            db      0
   current_minute          db      0
   current_second          db      0
   display_hour            dd      0
   display_minute          dd      0
   display_second          dd      0
   start_time              dd      0

   current_rowTeam2        dw      161                                                                                            ;;;;pixel
   current_colTeam2        dw      90                                                                                             ;;;;pixel
   current_row_gridTeam2   db      8
   current_col_gridTeam2   db      4
   selected_rowTeam2       dw      -1                                                                                             ;;;;pixel
   selected_colTeam2       dw      -1                                                                                             ;;;;pixel
   selected_row_gridTeam2  db      -1
   selected_col_gridTeam2  db      -1

   goto_row                dw      -1                                                                                             ;;;;pixel
   goto_col                dw      -1                                                                                             ;;;;pixel
   goto_row_grid           db      -1
   goto_col_grid           db      -1

   goto_rowTeam2           dw      -1                                                                                             ;;;;pixel
   goto_colTeam2           dw      -1                                                                                             ;;;;pixel
   goto_row_gridTeam2      db      -1
   goto_col_gridTeam2      db      -1


   highlight_row           dw      -1                                                                                             ;;;;pixel
   highlight_col           dw      -1                                                                                             ;;;;pixel
   highlight_row_grid      db      -1
   highlight_col_grid      db      -1


   highlight_rowTeam2      dw      -1                                                                                             ;;;;pixel
   highlight_colTeam2      dw      -1                                                                                             ;;;;pixel
   highlight_row_gridTeam2 db      -1
   highlight_col_gridTeam2 db      -1

   cell                    dw      ?
   check_color             db      3
   RowVar                  dw      0
   color                   db      0

   highlight_flag          db      't'                                                                                            ;;;;;t--->highlight   f->stop there is piece feom your team
   team                    db      0

   startRow                dw      0
   startCol                dw      0
   piece                   dw      0
   pieceWidth              dw      0
   pieceHeight             dw      0
   pieceColor              dw      0
         
   clicked                 db      0
   game_over_flag_team     db      -1

   grid_row1               db      'r1w', 'h1b', 'b1w', 'k1b', 'q1w', 'b1b', 'h1w','r1b'
   grid_row2               db      'p1b', 'p1w', 'p1b', 'p1w', 'p1b', 'p1w', 'p1b', 'p1w'
   grid_row3               db      '00w', '00b', '00w', '00b', '00w', '00b', '00w', '00b'
   grid_row4               db      '00b', '00w', '00b', '00w', '00b', '00w', '00b', '00w'
   grid_row5               db      '00w', '00b', '00w', '00b', '00w', '00b', '00w', '00b'
   grid_row6               db      '00b', '00w', '00b', '00w', '00b', '00w', '00b', '00w'
   grid_row7               db      'p2w', 'p2b', 'p2w', 'p2b', 'p2w', 'p2b', 'p2w', 'p2b'
   grid_row8               db      'r2b', 'h2w', 'b2b', 'k2w', 'q2b', 'b2w', 'h2b', 'r2w'


   highlight_row1          db      'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
   highlight_row2          db      'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
   highlight_row3          db      'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
   highlight_row4          db      'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
   highlight_row5          db      'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
   highlight_row6          db      'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
   highlight_row7          db      'f', 'f', 'f', 'f', 'f', 'f', 'f','f'
   highlight_row8          db      'f', 'f', 'f', 'f', 'f', 'f', 'f','f'


    

   
   operand                 db      0
   rowgrid                 db      0
   colgrid                 db      0
   Currrow                 dw      0
   Currcol                 dw      0
   cell_number             db      0
   cell_add                dw      0
   
   msg1                    db      "Game over team2 won:F4-new game ",'$'
   msg2                    db      "Game over team1 won:F4-new game",'$'
   msgking1                db      "king of team1 has died  ",'$'
   msgqueen1               db      "queen of team1 has died ",'$'
   msgbishop1              db      "bishop of team1 has died",'$'
   msgpawn1                db      "pawn of team1 has died  ",'$'
   msgknight1              db      "knight of team1 has died",'$'
   msgrook1                db      "rook of team1 has died  ",'$'

   msgking2                db      "king of team2 has died  ",'$'
   msgqueen2               db      "queen of team2 has died ",'$'
   msgbishop2              db      "bishop of team2 has died",'$'
   msgpawn2                db      "pawn of team2 has died  ",'$'
   msgknight2              db      "knight of team2 has died",'$'
   msgrook2                db      "rook of team2 has died  ",'$'
   msg_checkmate1          db      "checkmate team1         ",'$'
   msg_checkmate2          db      "checkmate team2         ",'$'


   time1                   dd      0, 0, 0, 0, 0, 0, 0,0
   time2                   dd      0, 0, 0, 0, 0, 0, 0,0
   time3                   dd      0, 0, 0, 0, 0, 0, 0,0
   time4                   dd      0, 0, 0, 0, 0, 0, 0,0
   time5                   dd      0, 0, 0, 0, 0, 0, 0,0
   time6                   dd      0, 0, 0, 0, 0, 0, 0,0
   time7                   dd      0, 0, 0, 0, 0, 0, 0,0
   time8                   dd      0, 0, 0, 0, 0, 0, 0,0


   prev                    db      0
   timeflag                db      't'
   sec                     db      0
   min                     db      0
   hrs                     db      0


   ; data of  game menu
   welcome                 db      "Please enter your name :",'$'
   menter                  db      "Plaese press enter to continue ",'$'
   name1                   db      30 ,?, 30 dup('$')
   mf1                     db      "To start chatting press F1 ",10,13,'$'
   mf2                     db      "To start Game press F2 ",10,13,'$'
   mesc                    db      "To end the program press ESC",10,13,'$'
   endProgram              db      "---------------------------------Game is Over-----------------------------------",10,13,'$'

   ;;;;;h->horse  q->queen   p->pawn   k->king   b->Bishop   r->rook   1->green->team1   2->black->team2  00->no_piece w-b--->white-black
   ;;;;rook--horse--Bishop--king---queen--Bishop--horse--rook      8pawn
   ; current_pos dw 00,90
   ; (row*8)+col
.code
   ; responsible for drawing the full Grid
DrawGrid proc far
            
                                        mov                     di,0
                                        mov                     RowVar,0
   DrawGrid_col:                        
   DrawGrid_row:                        
                                        MYWhiteRec              RowVar, di
                                        add                     di,30
                                        MYBrownRec              RowVar,di
                                        add                     di,30
                                        cmp                     di,240
                                        jnz                     DrawGrid_row
                                        mov                     di,0
                                        add                     RowVar,46
                                        cmp                     RowVar,184
                                        jnz                     DrawGrid_col
                                        mov                     di,0
                                        mov                     rowvar,23
   DrawGrid_col1:                       
   DrawGrid_row1:                       
                                        MYBrownRec              RowVar, di
                                        add                     di,30
                                        MYWhiteRec              RowVar,di
                                        add                     di,30
                                        cmp                     di,240
                                        jnz                     DrawGrid_row1
                                        mov                     di,0
                                        add                     RowVar,46
                                        cmp                     RowVar,207
                                        jnz                     DrawGrid_col1
                                        ret
DrawGrid endp
   ; responsible for drawing a single piece in the Grid
Draw proc far
                                        mov                     ax,0A000H
                                        mov                     es,ax
                                        mov                     si, piece
                                        mov                     ax,startRow
                                        mov                     bx,320
                                        mul                     bx
                                        add                     ax,startCol
                                        mov                     di,ax
                                        mov                     cx,pieceWidth
   Draw_drawPiece:                      
                                        call                    far ptr   DrawRow
                                        add                     di,320
                                        dec                     cx
                                        jnz                     Draw_drawPiece
                                        ret
Draw ENDP
   ; responsible for drawing a row in the drid
DrawRow proc far
                                        push                    di
                                        push                    cx
                                        mov                     cx,pieceHeight
   DrawRow_draw1:                       
                                        mov                     al,[si]
                                        cmp                     al,00H
                                        je                      DrawRow_background
                                        cmp                     al,02H
                                        je                      DrawRow_background
                                        mov                     dx,pieceColor
                                        mov                     es:[di],dx
   DrawRow_background:                  
                                        inc                     di
                                        inc                     si
                                        dec                     cx
                                        jnz                     DrawRow_draw1
                                        pop                     cx
                                        pop                     di
                                        ret
DrawRow endp
   ; responsible for drawing the pieces in the grid
startpieces proc far
                                        mov                     startRow,0
                                        mov                     startCol,96
                                        lea                     bx,king
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,3
                                        call                    far ptr Draw


                                        mov                     startRow,161
                                        mov                     startCol,96
                                        lea                     bx,king
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,0
                                        call                    far ptr Draw

                      
                                        mov                     startRow,0
                                        mov                     startCol,126
                                        lea                     bx,queen
                                        mov                     piece,bx
                                        mov                     pieceWidth,13
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,3
                                        call                    far ptr Draw
   ;  Draw         0,96,king,16,16,3
   ;  Draw         161,96,king,16,16,0
   ;  Draw         0,126,queen,13,16,3
   ;  Draw         161,126,queen,13,16,0

                      
                                        mov                     startRow,161
                                        mov                     startCol,126
                                        lea                     bx,queen
                                        mov                     piece,bx
                                        mov                     pieceWidth,13
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,0
                                        call                    far ptr Draw

                                        mov                     cx,6
   startpieces_label:                   
                                        push                    cx


   ;  Draw         23,cx,pawn,16,16,3
                                        mov                     startRow,23
                                        mov                     startCol,cx
                                        lea                     bx,pawn
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,3
                                        call                    far ptr Draw


                                        pop                     cx
                                        push                    cx


   ;  Draw         138,cx,pawn,16,16,0
                                        mov                     startRow,138
                                        mov                     startCol,cx
                                        lea                     bx,pawn
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,0
                                        call                    far ptr Draw

                                        pop                     cx
                                        add                     cx,30
                                        cmp                     cx,240+6
                                        jne                     startpieces_label
                      
   ;  Draw         0,66,Bishop,17,16,3
                                        mov                     startRow,0
                                        mov                     startCol,66
                                        lea                     bx,Bishop
                                        mov                     piece,bx
                                        mov                     pieceWidth,17
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,3
                                        call                    far ptr Draw

   ;  Draw         0,156,Bishop,17,16,3
                                        mov                     startRow,0
                                        mov                     startCol,156
                                        lea                     bx,Bishop
                                        mov                     piece,bx
                                        mov                     pieceWidth,17
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,3
                                        call                    far ptr Draw
   ;  Draw         161,66,Bishop,17,16,0
                                        mov                     startRow,161
                                        mov                     startCol,66
                                        lea                     bx,Bishop
                                        mov                     piece,bx
                                        mov                     pieceWidth,17
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,0
                                        call                    far ptr Draw
   ;  Draw         161,156,Bishop,17,16,0
                                        mov                     startRow,161
                                        mov                     startCol,156
                                        lea                     bx,Bishop
                                        mov                     piece,bx
                                        mov                     pieceWidth,17
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,0
                                        call                    far ptr Draw
   ;  Draw         0,36,knight,20,20,3
                                        mov                     startRow,0
                                        mov                     startCol,36
                                        lea                     bx,knight
                                        mov                     piece,bx
                                        mov                     pieceWidth,20
                                        mov                     pieceHeight,20
                                        mov                     pieceColor,3
                                        call                    far ptr Draw
   ;  Draw         0,186,knight,20,20,3
                                        mov                     startRow,0
                                        mov                     startCol,186
                                        lea                     bx,knight
                                        mov                     piece,bx
                                        mov                     pieceWidth,20
                                        mov                     pieceHeight,20
                                        mov                     pieceColor,3
                                        call                    far ptr Draw
   ;  Draw         161,36,knight,20,20,0
                                        mov                     startRow,161
                                        mov                     startCol,36
                                        lea                     bx,knight
                                        mov                     piece,bx
                                        mov                     pieceWidth,20
                                        mov                     pieceHeight,20
                                        mov                     pieceColor,0
                                        call                    far ptr Draw
   ;  Draw         161,186,knight,20,20,0
                                        mov                     startRow,161
                                        mov                     startCol,186
                                        lea                     bx,knight
                                        mov                     piece,bx
                                        mov                     pieceWidth,20
                                        mov                     pieceHeight,20
                                        mov                     pieceColor,0
                                        call                    far ptr Draw
   ;  Draw         0,6,rook,16,16,3
                                        mov                     startRow,0
                                        mov                     startCol,6
                                        lea                     bx,rook
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,3
                                        call                    far ptr Draw
   ;  Draw         0,216,rook,16,16,3
                                        mov                     startRow,0
                                        mov                     startCol,216
                                        lea                     bx,rook
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,3
                                        call                    far ptr Draw
   ;  Draw         161,6,rook,16,16,0
                                        mov                     startRow,161
                                        mov                     startCol,6
                                        lea                     bx,rook
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,0
                                        call                    far ptr Draw
   ;  Draw         161,216,rook,16,16,0
                                        mov                     startRow,161
                                        mov                     startCol,216
                                        lea                     bx,rook
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,0
                                        call                    far ptr Draw
                                        ret
startpieces endp





   ; responsible for moving the pawn piece for team1
move_pawn proc far
                                        mov                     highlight_flag,'t'
                                        call                    far ptr calctime
                                        cmp                     timeflag,'f'
                                        jne                     highhigh
                                        jmp                     far ptr move_pawn_exitnomove
   highhigh:                            
                                        mov                     al,selected_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        inc                     di
                                        mov                     al,[di]
                                        mov                     ah,0
                                        mov                     team,al
                                        cmp                     al ,'1'
                                        je                      move_pawn_team1
                                        cmp                     al ,'2'
                                        jne                     breakpoint1
                                        jmp                     far ptr                  move_pawn_team2
   breakpoint1:                         jmp                     far ptr   move_pawn_exit
   move_pawn_team1:                     
                                     
                                        mov                     dl,1                                                            ;;;;;;;;;row
                                        mov                     dh,0
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx                                                ;;;;;;;;;column
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        add                     highlight_row_grid,dl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
                                        add                     highlight_col_grid,dh
                                        mov                     bx,23
                                        add                     highlight_row,bx
   ;  jmp                  far ptr                  move_pawn_change
                                        mov                     di,offset grid_row1
                                        mov                     ax,0
                                        mov                     al,highlight_row_grid
                                        dec                     al
                                        mov                     bl,24
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     ax,0
                                        mov                     al,highlight_col_grid
                                        dec                     al
                                        mov                     bh,3
                                        mul                     bh
                                        add                     ax,cx
                                        add                     di,ax
                                        mov                     al,'0'
                                        cmp                     [di],al
                                        jne                     move_pawn_team1_b1
                                        call                    far ptr highlight_goto
                                      
                                        cmp                     highlight_flag,'f'
                                        je                      move_pawn_team1_b1
                                        call                    far ptr                     set_highlighled_true
   ;  jmp                  far ptr                  move_pawn_exit
   move_pawn_team1_b1:                  
                                        mov                     dl,1                                                            ;;;;;;;;;row
                                        mov                     dh,1
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx                                                ;;;;;;;;;column
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        add                     highlight_row_grid,dl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
                                        add                     highlight_col_grid,dh
                                        mov                     bx,23
                                        add                     highlight_row,bx
                                        mov                     bx,30
                                        add                     highlight_col,bx
   ;  jmp                  far ptr                  move_pawn_change
                                        mov                     di,offset grid_row1
                                        mov                     ax,0
                                        mov                     al,highlight_row_grid
                                        dec                     al
                                        mov                     bl,24
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     ax,0
                                        mov                     al,highlight_col_grid
                                        dec                     al
                                        mov                     bh,3
                                        mul                     bh
                                        add                     ax,cx
                                        add                     di,ax
                                        mov                     al,'2'
                                        cmp                     [di]+1,al
                                        jne                     move_pawn_team1_b2
                                        call                    far ptr highlight_goto
                                        call                    far ptr                     set_highlighled_true
                                      
   ;  cmp                  highlight_flag,'f'
   ;  je                   move_pawn_team1_b2
                                     

   move_pawn_team1_b2:                  
                                        mov                     dl,1                                                            ;;;;;;;;;row
                                        mov                     dh,-1
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx                                                ;;;;;;;;;column
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        add                     highlight_row_grid,dl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
                                        add                     highlight_col_grid,dh
                                        mov                     bx,23
                                        add                     highlight_row,bx
                                        mov                     bx,-30
                                        add                     highlight_col,bx
   ;  jmp                  far ptr                  move_pawn_change
                                        mov                     di,offset grid_row1
                                        mov                     ax,0
                                        mov                     al,highlight_row_grid
                                        dec                     al
                                        mov                     bl,24
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     ax,0
                                        mov                     al,highlight_col_grid
                                        dec                     al
                                        mov                     bh,3
                                        mul                     bh
                                        add                     ax,cx
                                        add                     di,ax
                                        mov                     al,'2'
                                        cmp                     [di]+1,al
                                        jne                     breakpoint2
                                        call                    far ptr highlight_goto
                                        call                    far ptr                     set_highlighled_true
                                        jmp                     far ptr                  move_pawn_exit
   breakpoint2:                         jmp                     far ptr    move_pawn_exit

   move_pawn_team2:                     
                                     
                                        mov                     dl,-1                                                           ;;;;;;;;;row
                                        mov                     dh,0
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx                                                ;;;;;;;;;column
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        add                     highlight_row_grid,dl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
                                        add                     highlight_col_grid,dh
                                        mov                     bx,-23
                                        add                     highlight_row,bx
   ;  jmp                  far ptr                  move_pawn_change
                                        mov                     di,offset grid_row1
                                        mov                     ax,0
                                        mov                     al,highlight_row_grid
                                        dec                     al
                                        mov                     bl,24
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     ax,0
                                        mov                     al,highlight_col_grid
                                        dec                     al
                                        mov                     bh,3
                                        mul                     bh
                                        add                     ax,cx
                                        add                     di,ax
                                        mov                     al,'0'
                                        cmp                     [di],al
                                        jne                     move_pawn_team2_b1
                                        call                    far ptr highlight_goto
                                      
                                        cmp                     highlight_flag,'f'
                                        je                      move_pawn_team2_b1
                                        call                    far ptr                     set_highlighled_true
   ;  jmp                  far ptr                  move_pawn_exit
   move_pawn_team2_b1:                  
                                        mov                     dl,-1                                                           ;;;;;;;;;row
                                        mov                     dh,-1
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx                                                ;;;;;;;;;column
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        add                     highlight_row_grid,dl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
                                        add                     highlight_col_grid,dh
                                        mov                     bx,-23
                                        add                     highlight_row,bx
                                        mov                     bx,-30
                                        add                     highlight_col,bx
   ;  jmp                  far ptr                  move_pawn_change
                                        mov                     di,offset grid_row1
                                        mov                     ax,0
                                        mov                     al,highlight_row_grid
                                        dec                     al
                                        mov                     bl,24
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     ax,0
                                        mov                     al,highlight_col_grid
                                        dec                     al
                                        mov                     bh,3
                                        mul                     bh
                                        add                     ax,cx
                                        add                     di,ax
                                        mov                     al,'1'
                                        cmp                     [di]+1,al
                                        jne                     move_pawn_team2_b2
                                        call                    far ptr highlight_goto
                                        call                    far ptr                     set_highlighled_true
                                      
   ;  cmp                  highlight_flag,'f'
   ;  je                   move_pawn_team1_b2
                                     

   move_pawn_team2_b2:                  
                                        mov                     dl,-1                                                           ;;;;;;;;;row
                                        mov                     dh,1
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx                                                ;;;;;;;;;column
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        add                     highlight_row_grid,dl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
                                        add                     highlight_col_grid,dh
                                        mov                     bx,-23
                                        add                     highlight_row,bx
                                        mov                     bx,30
                                        add                     highlight_col,bx
   ;  jmp                  far ptr                  move_pawn_change
                                        mov                     di,offset grid_row1
                                        mov                     ax,0
                                        mov                     al,highlight_row_grid
                                        dec                     al
                                        mov                     bl,24
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     ax,0
                                        mov                     al,highlight_col_grid
                                        dec                     al
                                        mov                     bh,3
                                        mul                     bh
                                        add                     ax,cx
                                        add                     di,ax
                                        mov                     al,'1'
                                        cmp                     [di]+1,al
                                        jne                     move_pawn_exit
                                        call                    far ptr highlight_goto
                                        call                    far ptr                     set_highlighled_true
                                        jmp                     far ptr                  move_pawn_exit
                                  
   move_pawn_exitnomove:                


                                        mov                     selected_col,-1
                                        mov                     selected_col_grid,-1
                                        mov                     selected_row,-1
                                        mov                     selected_row_grid,-1
                                        jmp                     ret_exit1

   move_pawn_exit:                      

                                        call                    far ptr highlighted_cells_existing_team1
                                        cmp                     cx,0
                                        je                      move_pawn_exitnomove
   ret_exit1:                           

                                        ret
move_pawn endp
   ; responsible for moving the bishop piece for team1
move_bishop proc far
                                        call                    far ptr calctime
                                        cmp                     timeflag,'f'
                                        jne                     highhigh2
                                        jmp                     far ptr move_bishop_exitnomove
   highhigh2:                           
                                        mov                     al,selected_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        inc                     di
                                        mov                     al,[di]
                                        mov                     team,al
                                        cmp                     al ,'1'
                                        je                      move_bishop_team1
                                        cmp                     al ,'2'
                                        je                      move_bishop_team2
                                        jmp                     far ptr                  move_bishop_exit

   move_bishop_team1:                   
   move_bishop_team2:                   
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   move_bishop_compare1:                
                                        add                     highlight_row,23
                                        add                     highlight_col,30
                                        cmp                     highlight_col,240
                                        je                      move_bishop_level2
                                        cmp                     highlight_row,184
                                        je                      move_bishop_level2
                                        add                     highlight_row_grid,1
                                        add                     highlight_col_grid,1
                                        call                    far ptr  highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      move_bishop_level2
                                        call                    far ptr                     set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      move_bishop_level2
                                        jmp                     far ptr                  move_bishop_compare1

                
   move_bishop_level2:                  
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   move_bishop_compare2:                
                                        add                     highlight_row,23
                                        sub                     highlight_col,30
                                        cmp                     highlight_col,-30
                                        je                      move_bishop_level3
                                        cmp                     highlight_row,184
                                        je                      move_bishop_level3
                                        add                     highlight_row_grid,1
                         
                                        sub                     highlight_col_grid,1
                                        call                    far ptr   highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      move_bishop_level3
                                        call                    far ptr                     set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      move_bishop_level3
                                        jmp                     far ptr                  move_bishop_compare2


   move_bishop_level3:                  
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   move_bishop_compare3:                
                                        sub                     highlight_row,23
                                        add                     highlight_col,30
                                        cmp                     highlight_col,240
                                        je                      move_bishop_level4
                                        cmp                     highlight_row,-23
                                        je                      move_bishop_level4
                                        sub                     highlight_row_grid,1
                         
                                        add                     highlight_col_grid,1
                                        call                    far ptr  highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      move_bishop_level4
                                        call                    far ptr                     set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      move_bishop_level4
                                        jmp                     far ptr                  move_bishop_compare3

   move_bishop_level4:                  
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   move_bishop_compare4:                
                                        sub                     highlight_row,23
                                        sub                     highlight_col,30
                                        cmp                     highlight_col,-30
                                        je                      move_bishop_exit
                                        cmp                     highlight_row,-23
                                        je                      move_bishop_exit
                                        sub                     highlight_row_grid,1
                         
                                        sub                     highlight_col_grid,1
                                        call                    far ptr  highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      move_bishop_exit
                                        call                    far ptr                     set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      move_bishop_exit
                                        jmp                     far ptr                  move_bishop_compare4
                                        jmp                     move_bishop_exit

   move_bishop_exitnomove:              


                                        mov                     selected_col,-1
                                        mov                     selected_col_grid,-1
                                        mov                     selected_row,-1
                                        mov                     selected_row_grid,-1
                                        jmp                     ret_exit2

   move_bishop_exit:                    


                                        call                    far ptr highlighted_cells_existing_team1
                                        cmp                     cx,0
                                        je                      move_bishop_exitnomove
   ret_exit2:                           
                                        ret
move_bishop endp
   ; responsible for moving the king piece for team1
move_king proc far
                                        call                    far ptr calctime
                                        cmp                     timeflag,'f'
                                        jne                     highhigh3
                                        jmp                     far ptr move_king_exitnomove
   highhigh3:                           
                                        mov                     al,selected_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        inc                     di
                                        mov                     al,[di]
                                        mov                     ah,0
                                        mov                     team,al
                                        cmp                     al ,'1'
                                        je                      jteam1
                                        cmp                     al ,'2'
                                        je                      jteam2
                                        jmp                     far ptr                  jexit

   jteam1:                              
   jteam2:                              
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m1:                                                                                                                          ;;;;;;;;;;;-1r
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   jcompare1:                           
                                        sub                     highlight_row,23
                                        cmp                     highlight_row,-23
                                        je                      m2
                                        sub                     highlight_row_grid,1
                                        call                    far ptr highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      m2
                                        call                    far ptr                     set_highlighled_true
                        
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m2:                                                                                                                          ;;;;;;;;;;;;;-1r  +1c
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   jcompare2:                           
                                        sub                     highlight_row,23
                                        add                     highlight_col,30
                                        cmp                     highlight_row,-23
                                        je                      m3
                                        cmp                     highlight_col,240
                                        je                      m3
                                        sub                     highlight_row_grid,1
                                        add                     highlight_col_grid,1
                                        call                    far ptr highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      m3
                                        call                    far ptr                     set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m3:                                                                                                                          ;;;;;;;;;;;;;  +1c
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   jcompare3:                           
                                        add                     highlight_col,30
                                        cmp                     highlight_col,240
                                        je                      m4
                                        add                     highlight_col_grid,1
                                        call                    far ptr highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      m4
                                        call                    far ptr                     set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m4:                                                                                                                          ;;;;;;;;;;;;;+1r  +1c
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   jcompare4:                           
                                        add                     highlight_row,23
                                        add                     highlight_col,30
                                        cmp                     highlight_row,184
                                        je                      m5
                                        cmp                     highlight_col,240
                                        je                      m5
                                        add                     highlight_row_grid,1
                                        add                     highlight_col_grid,1
                                        call                    far ptr highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      m5
                                        call                    far ptr                     set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m5:                                                                                                                          ;;;;;;;;;;;;;+1r
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   jcompare5:                           
                                        add                     highlight_row,23
                                        cmp                     highlight_row,184
                                        je                      m6
                                        add                     highlight_row_grid,1
                                        call                    far ptr highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      m6
                                        call                    far ptr                     set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m6:                                                                                                                          ;;;;;;;;;;;;;+1r  -1c
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   jcompare6:                           
                                        add                     highlight_row,23
                                        sub                     highlight_col,30
                                        cmp                     highlight_row,184
                                        je                      m7
                                        cmp                     highlight_col,-30
                                        je                      m7
                                        add                     highlight_row_grid,1
                                        sub                     highlight_col_grid,1
                                        call                    far ptr highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      m7
                                        call                    far ptr                     set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m7:                                                                                                                          ;;;;;;;;;;;;;-1c
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   jcompare7:                           
                                        sub                     highlight_col,30
                                        cmp                     highlight_col,-30
                                        je                      m8
                                        sub                     highlight_col_grid,1
                                        call                    far ptr highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      m8
                                        call                    far ptr                     set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m8:                                                                                                                          ;;;;;;;;;;;;;-1r  -1c
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   jcompare8:                           
                                        sub                     highlight_col,30
                                        sub                     highlight_row,23
                                        cmp                     highlight_col,-30
                                        je                      jexit
                                        cmp                     highlight_row,-23
                                        je                      jexit
                                        sub                     highlight_col_grid,1
                                        sub                     highlight_row_grid,1
                                        call                    far ptr  highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      jexit
                                        call                    far ptr          set_highlighled_true
                                        jmp                     jexit

   move_king_exitnomove:                
                                        mov                     selected_col,-1
                                        mov                     selected_col_grid,-1
                                        mov                     selected_row,-1
                                        mov                     selected_row_grid,-1
                                        jmp                     ret_exit3


   jexit:                               
                                        call                    far ptr highlighted_cells_existing_team1
                                        cmp                     cx,0
                                        je                      move_king_exitnomove
   ret_exit3:                           
                                        ret
move_king endp
   ; responsible for moving the rook piece for team1
move_rook proc  far
                                    
                                        call                    far ptr calctime
                                        cmp                     timeflag,'f'
                                        jne                     highhigh4
                                        jmp                     far ptr move_rook_exitnomove
   highhigh4:                           
                                        mov                     al,selected_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        inc                     di
                                        mov                     al,[di]
                                        mov                     team,al
                                        cmp                     al ,'1'
                                        je                      rteam1
                                        cmp                     al ,'2'
                                        je                      rteam2
                                        jmp                     far ptr                  rexit

   rteam1:                              
   rteam2:                              
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   rcompare1:                           
                                        add                     highlight_row,23
                                        cmp                     highlight_row,184
                                        je                      rlevel2
                                        add                     highlight_row_grid,1
                                        call                    far ptr   highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      rlevel2
                                        call                    far ptr                     set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      rlevel2
                                        jmp                     far ptr                  rcompare1
               
                


                
   rlevel2:                             
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   rcompare2:                           
                                        sub                     highlight_row,23
                                        cmp                     highlight_row,-23
                                        je                      rlevel3
                                        sub                     highlight_row_grid,1
                                        call                    far ptr  highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      rlevel3
                                        call                    far ptr                     set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      rlevel3
                                        jmp                     far ptr                  rcompare2


   rlevel3:                             
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   rcompare3:                           
                
                                        add                     highlight_col,30
                                        cmp                     highlight_col,240
                                        je                      rlevel4
                                        add                     highlight_col_grid,1
                                        call                    far ptr   highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      rlevel4
                                        call                    far ptr                     set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      rlevel4
                                        jmp                     far ptr                  rcompare3

   rlevel4:                             
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   rcompare4:                           
               
                                        sub                     highlight_col,30
                                        cmp                     highlight_col,-30
                                        je                      rexit
                                        sub                     highlight_col_grid,1
                                        call                    far ptr   highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      rexit
                                        call                    far ptr                     set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      rexit
                                        jmp                     far ptr                  rcompare4
                                        jmp                     rexit
   move_rook_exitnomove:                
                                        mov                     selected_col,-1
                                        mov                     selected_col_grid,-1
                                        mov                     selected_row,-1
                                        mov                     selected_row_grid,-1
                                        jmp                     ret_exit4

   rexit:                               
                                        call                    far ptr highlighted_cells_existing_team1
                                        cmp                     cx,0
                                        je                      move_rook_exitnomove
   ret_exit4:                           
                                        ret
move_rook endp
   ; responsible for moving the knight piece for team1
move_knight proc  far
                                        call                    far ptr calctime
                                        cmp                     timeflag,'f'
                                        jne                     highhigh5
                                        jmp                     far ptr move_knight_exitnomove
   highhigh5:                           
                                        mov                     al,selected_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        inc                     di
                                        mov                     al,[di]
                                        mov                     ah,0
                                        mov                     team,al
                                        cmp                     al ,'1'
                                        je                      kteam1
                                        cmp                     al ,'2'
                                        je                      kteam2
                                        jmp                     far ptr                  kexit
 
   kteam1:                              
   kteam2:                              
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise1:                             
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
       
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  +2c   +1r
                                        add                     highlight_col,60
                                        add                     highlight_row,23
                                        cmp                     highlight_col,210
                                        ja                      choise2
                                        cmp                     highlight_row,161
                                        ja                      choise2
                                        add                     highlight_col_grid,2
                                        add                     highlight_row_grid,1
                         
                                        call                    far ptr   highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      choise2
                                        call                    far ptr                     set_highlighled_true
                        
                
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise2:                             
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;+2c -1r
                                        add                     highlight_col,60
                                        sub                     highlight_row,23
                                        cmp                     highlight_col,210
                                        ja                      choise3
                                        cmp                     highlight_row,0
                                        jl                      choise3
                                        add                     highlight_col_grid,2
                                        sub                     highlight_row_grid,1
                                        call                    far ptr   highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      choise3
                                        call                    far ptr                     set_highlighled_true
   ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise3:                             
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-2c +1r
                                        sub                     highlight_col,60
                                        add                     highlight_row,23
                                        cmp                     highlight_col,0
                                        jl                      choise4
                                        cmp                     highlight_row,161
                                        ja                      choise4
                                        sub                     highlight_col_grid,2
                                        add                     highlight_row_grid,1
                                        call                    far ptr   highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      choise4
                                        call                    far ptr                     set_highlighled_true
               
   ;     ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise4:                             
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-2c -1r
                                        sub                     highlight_col,60
                                        sub                     highlight_row,23
                                        cmp                     highlight_col,0
                                        jl                      choise5
                                        cmp                     highlight_row,0
                                        jl                      choise5
                                        sub                     highlight_col_grid,2
                                        sub                     highlight_row_grid,1
                                        call                    far ptr   highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      choise5
                                        call                    far ptr                     set_highlighled_true
               
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise5:                             
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;+2r +1c
                                        add                     highlight_col,30
                                        add                     highlight_row,46
                                        cmp                     highlight_col,210
                                        ja                      choise6
                                        cmp                     highlight_row,161
                                        ja                      choise6
                                        add                     highlight_col_grid,1
                                        add                     highlight_row_grid,2
                                        call                    far ptr   highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      choise6
                                        call                    far ptr                     set_highlighled_true
               
   ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise6:                             
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;+2r   -1c
                                        sub                     highlight_col,30
                                        add                     highlight_row,46
                                        cmp                     highlight_col,0
                                        jl                      choise7
                                        cmp                     highlight_row,161
                                        ja                      choise7
                                        sub                     highlight_col_grid,1
                                        add                     highlight_row_grid,2
                                        call                    far ptr   highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      choise7
                                        call                    far ptr                     set_highlighled_true
               
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise7:                             
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-2r +1c
                                        add                     highlight_col,30
                                        sub                     highlight_row,46
                                        cmp                     highlight_col,210
                                        ja                      choise8
                                        cmp                     highlight_row,0
                                        jl                      choise8
                                        add                     highlight_col_grid,1
                                        sub                     highlight_row_grid,2
                                        call                    far ptr   highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      choise8
                                        call                    far ptr                     set_highlighled_true
               
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise8:                             
                                        mov                     bx,selected_col
                                        mov                     highlight_col,bx
                                        mov                     cx,selected_row
                                        mov                     highlight_row,cx
                                        mov                     bl, selected_row_grid
                                        mov                     highlight_row_grid,bl
                                        mov                     bh, selected_col_grid
                                        mov                     highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;-2r   -1c
                                        sub                     highlight_col,30
                                        sub                     highlight_row,46
                                        cmp                     highlight_col,0
                                        jl                      kexit
                                        cmp                     highlight_row,0
                                        jl                      kexit
                                        sub                     highlight_col_grid,1
                                        sub                     highlight_row_grid,2
                                        call                    far ptr   highlight_goto
                                        cmp                     highlight_flag,'f'
                                        je                      kexit
                                        call                    far ptr                     set_highlighled_true
                                        jmp                     kexit
   move_knight_exitnomove:              
                                        mov                     selected_col,-1
                                        mov                     selected_col_grid,-1
                                        mov                     selected_row,-1
                                        mov                     selected_row_grid,-1
                                        jmp                     ret_exit5


   kexit:                               

                                        call                    far ptr highlighted_cells_existing_team1
                                        cmp                     cx,0
                                        je                      move_knight_exitnomove
   ret_exit5:                           
                                        ret
                        
move_knight endp


   ; responsible for moving the pawn piece for team2
movepawnTeam2 proc far
                                        call                    far ptr calctimeTeam2
                                        cmp                     timeflag,'f'
                                        jne                     highhigh66
                                        jmp                     far ptr t2move_pawn_exitnomove
   highhigh66:                          
                                        mov                     al,selected_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        inc                     di
                                        mov                     al,[di]
                                        mov                     ah,0
                                        mov                     team,al
                                     
                                   

   movepawnTeam2_move_pawn_team2:       
                                     
                                        mov                     dl,-1                                                           ;;;;;;;;;row
                                        mov                     dh,0
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx                                           ;;;;;;;;;column
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        add                     highlight_row_gridTeam2,dl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
                                        add                     highlight_col_gridTeam2,dh
                                        mov                     bx,-23
                                        add                     highlight_rowTeam2,bx
   ;  jmp                  far ptr                  move_pawn_change
                                        mov                     di,offset grid_row1
                                        mov                     ax,0
                                        mov                     al,highlight_row_gridTeam2
                                        dec                     al
                                        mov                     bl,24
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     ax,0
                                        mov                     al,highlight_col_gridTeam2
                                        dec                     al
                                        mov                     bh,3
                                        mul                     bh
                                        add                     ax,cx
                                        add                     di,ax
                                        mov                     al,'0'
                                        cmp                     [di],al
                                        jne                     movepawnTeam2_move_pawn_team2_b1
                                        call                    far ptr Team2highlightgoto
                                      
                                        cmp                     highlight_flag,'f'
                                        je                      movepawnTeam2_move_pawn_team2_b1
                                        call                    far ptr                     Team2_set_highlighled_true
   ;  jmp                  far ptr                  move_pawn_exit
   movepawnTeam2_move_pawn_team2_b1:    
                                        mov                     dl,-1                                                           ;;;;;;;;;row
                                        mov                     dh,-1
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx                                           ;;;;;;;;;column
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        add                     highlight_row_gridTeam2,dl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
                                        add                     highlight_col_gridTeam2,dh
                                        mov                     bx,-23
                                        add                     highlight_rowTeam2,bx
                                        mov                     bx,-30
                                        add                     highlight_colTeam2,bx
   ;  jmp                  far ptr                  move_pawn_change
                                        mov                     di,offset grid_row1
                                        mov                     ax,0
                                        mov                     al,highlight_row_gridTeam2
                                        dec                     al
                                        mov                     bl,24
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     ax,0
                                        mov                     al,highlight_col_gridTeam2
                                        dec                     al
                                        mov                     bh,3
                                        mul                     bh
                                        add                     ax,cx
                                        add                     di,ax
                                        mov                     al,'1'
                                        cmp                     [di]+1,al
                                        jne                     b22b
                                        call                    far ptr Team2highlightgoto
                                        call                    far ptr                     Team2_set_highlighled_true
                                      
   ;  cmp                  highlight_flag,'f'
   ;  je                   move_pawn_team1_b2
                                     

   b22b:                                
                                        mov                     dl,-1                                                           ;;;;;;;;;row
                                        mov                     dh,1
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx                                           ;;;;;;;;;column
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        add                     highlight_row_gridTeam2,dl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
                                        add                     highlight_col_gridTeam2,dh
                                        mov                     bx,-23
                                        add                     highlight_rowTeam2,bx
                                        mov                     bx,30
                                        add                     highlight_colTeam2,bx
   ;  jmp                  far ptr                  move_pawn_change
                                        mov                     di,offset grid_row1
                                        mov                     ax,0
                                        mov                     al,highlight_row_gridTeam2
                                        dec                     al
                                        mov                     bl,24
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     ax,0
                                        mov                     al,highlight_col_gridTeam2
                                        dec                     al
                                        mov                     bh,3
                                        mul                     bh
                                        add                     ax,cx
                                        add                     di,ax
                                        mov                     al,'1'
                                        cmp                     [di]+1,al
                                        jne                     movepawnTeam2_move_pawn_exit
                                        call                    far ptr Team2highlightgoto
                                        call                    far ptr                     Team2_set_highlighled_true
                                        jmp                     far ptr                 movepawnTeam2_move_pawn_exit



   t2move_pawn_exitnomove:              


                                        mov                     selected_colTeam2,-1
                                        mov                     selected_col_gridTeam2,-1
                                        mov                     selected_rowTeam2,-1
                                        mov                     selected_row_gridTeam2,-1
                                        jmp                     ret_exit6


   movepawnTeam2_move_pawn_exit:        

                                        call                    far ptr team2_highlighted_cells_existing
                                        cmp                     cx,0
                                        je                      t2move_pawn_exitnomove
   ret_exit6:                           
                                        ret
   
  
movepawnTeam2 endp
   ; responsible for moving the bishop piece for team2
move_bishopTeam2 proc far
                                        call                    far ptr calctimeTeam2
                                        cmp                     timeflag,'f'
                                        jne                     highhigh77
                                        jmp                     far ptr t2move_bishop_exitnomove
   highhigh77:                          
                                        mov                     al,selected_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        inc                     di
                                        mov                     al,[di]
                                        mov                     team,al
                                     
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   mybishop1:                           
                                        add                     highlight_rowTeam2,23
                                        add                     highlight_colTeam2,30
                                        cmp                     highlight_colTeam2,240
                                        je                      mybishop2
                                        cmp                     highlight_rowTeam2,184
                                        je                      mybishop2
                                        add                     highlight_row_gridTeam2,1
                                        add                     highlight_col_gridTeam2,1
                                        call                    far ptr  Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      mybishop2
                                        call                    far ptr                     Team2_set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      mybishop2
                                        jmp                     far ptr                  mybishop1

                
   mybishop2:                           
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   mybishop3:                           
                                        add                     highlight_rowTeam2,23
                                        sub                     highlight_colTeam2,30
                                        cmp                     highlight_colTeam2,-30
                                        je                      mybishop5
                                        cmp                     highlight_rowTeam2,184
                                        je                      mybishop5
                                        add                     highlight_row_gridTeam2,1
                         
                                        sub                     highlight_col_gridTeam2,1
                                        call                    far ptr   Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      mybishop5
                                        call                    far ptr                     Team2_set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      mybishop5
                                        jmp                     far ptr                  mybishop3


   mybishop5:                           
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   mybishop6:                           
                                        sub                     highlight_rowTeam2,23
                                        add                     highlight_colTeam2,30
                                        cmp                     highlight_colTeam2,240
                                        je                      mybishop4
                                        cmp                     highlight_rowTeam2,-23
                                        je                      mybishop4
                                        sub                     highlight_row_gridTeam2,1
                         
                                        add                     highlight_col_gridTeam2,1
                                        call                    far ptr  Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      mybishop4
                                        call                    far ptr                     Team2_set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      mybishop4
                                        jmp                     far ptr                  mybishop6

   mybishop4:                           
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   mybishop7:                           
                                        sub                     highlight_rowTeam2,23
                                        sub                     highlight_colTeam2,30
                                        cmp                     highlight_colTeam2,-30
                                        je                      bishopexit
                                        cmp                     highlight_rowTeam2,-23
                                        je                      bishopexit
                                        sub                     highlight_row_gridTeam2,1
                         
                                        sub                     highlight_col_gridTeam2,1
                                        call                    far ptr  Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      bishopexit
                                        call                    far ptr                     Team2_set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      bishopexit
                                        jmp                     far ptr                  mybishop7

                                        jmp                     bishopexit
   t2move_bishop_exitnomove:            


                                        mov                     selected_colTeam2,-1
                                        mov                     selected_col_gridTeam2,-1
                                        mov                     selected_rowTeam2,-1
                                        mov                     selected_row_gridTeam2,-1
                                        jmp                     ret_exit7

   bishopexit:                          
                                        call                    far ptr team2_highlighted_cells_existing
                                        cmp                     cx,0
                                        je                      t2move_bishop_exitnomove
   ret_exit7:                           
                                        ret
move_bishopTeam2 endp
   ; responsible for moving the king piece for team2
movekingTeam2 proc far
                                        call                    far ptr calctimeTeam2
                                        cmp                     timeflag,'f'
                                        jne                     highhigh88
                                        jmp                     far ptr t2move_king_exitnomove
   highhigh88:                          
                                        mov                     al,selected_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        inc                     di
                                        mov                     al,[di]
                                        mov                     ah,0
                                        mov                     team,al
                                        cmp                     al ,'1'
                                        je                      wjteam1
                                        cmp                     al ,'2'
                                        je                      wjteam2
                                        jmp                     far ptr                  wjexit

   wjteam1:                             
   wjteam2:                             
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   wm1:                                                                                                                         ;;;;;;;;;;;-1r
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   wjcompare1:                          
                                        sub                     highlight_rowTeam2,23
                                        cmp                     highlight_rowTeam2,-23
                                        je                      wm2
                                        sub                     highlight_row_gridTeam2,1
                                        call                    far ptr Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      wm2
                                        call                    far ptr                     Team2_set_highlighled_true
                        
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   wm2:                                                                                                                         ;;;;;;;;;;;;;-1r  +1c
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   wjcompare2:                          
                                        sub                     highlight_rowTeam2,23
                                        add                     highlight_colTeam2,30
                                        cmp                     highlight_rowTeam2,-23
                                        je                      wm3
                                        cmp                     highlight_colTeam2,240
                                        je                      wm3
                                        sub                     highlight_row_gridTeam2,1
                                        add                     highlight_col_gridTeam2,1
                                        call                    far ptr Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      wm3
                                        call                    far ptr                     Team2_set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   wm3:                                                                                                                         ;;;;;;;;;;;;;  +1c
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   wjcompare3:                          
                                        add                     highlight_colTeam2,30
                                        cmp                     highlight_colTeam2,240
                                        je                      wm4
                                        add                     highlight_col_gridTeam2,1
                                        call                    far ptr Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      wm4
                                        call                    far ptr                     Team2_set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   wm4:                                                                                                                         ;;;;;;;;;;;;;+1r  +1c
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   wjcompare4:                          
                                        add                     highlight_rowTeam2,23
                                        add                     highlight_colTeam2,30
                                        cmp                     highlight_rowTeam2,184
                                        je                      wm5
                                        cmp                     highlight_colTeam2,240
                                        je                      wm5
                                        add                     highlight_row_gridTeam2,1
                                        add                     highlight_col_gridTeam2,1
                                        call                    far ptr Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      wm5
                                        call                    far ptr                     Team2_set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   wm5:                                                                                                                         ;;;;;;;;;;;;;+1r
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   wjcompare5:                          
                                        add                     highlight_rowTeam2,23
                                        cmp                     highlight_rowTeam2,184
                                        je                      wm6
                                        add                     highlight_row_gridTeam2,1
                                        call                    far ptr Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      wm6
                                        call                    far ptr                     Team2_set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   wm6:                                                                                                                         ;;;;;;;;;;;;;+1r  -1c
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   wjcompare6:                          
                                        add                     highlight_rowTeam2,23
                                        sub                     highlight_colTeam2,30
                                        cmp                     highlight_rowTeam2,184
                                        je                      wm7
                                        cmp                     highlight_colTeam2,-30
                                        je                      wm7
                                        add                     highlight_row_gridTeam2,1
                                        sub                     highlight_col_gridTeam2,1
                                        call                    far ptr Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      wm7
                                        call                    far ptr                     Team2_set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   wm7:                                                                                                                         ;;;;;;;;;;;;;-1c
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   wjcompare7:                          
                                        sub                     highlight_colTeam2,30
                                        cmp                     highlight_colTeam2,-30
                                        je                      wm8
                                        sub                     highlight_col_gridTeam2,1
                                        call                    far ptr Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      wm8
                                        call                    far ptr                     Team2_set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   wm8:                                                                                                                         ;;;;;;;;;;;;;-1r  -1c
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   wjcompare8:                          
                                        sub                     highlight_colTeam2,30
                                        sub                     highlight_rowTeam2,23
                                        cmp                     highlight_colTeam2,-30
                                        je                      wjexit
                                        cmp                     highlight_rowTeam2,-23
                                        je                      wjexit
                                        sub                     highlight_col_gridTeam2,1
                                        sub                     highlight_row_gridTeam2,1
                                        call                    far ptr  Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      wjexit
                                        call                    far ptr          Team2_set_highlighled_true
                                        jmp                     wjexit
   t2move_king_exitnomove:              


                                        mov                     selected_colTeam2,-1
                                        mov                     selected_col_gridTeam2,-1
                                        mov                     selected_rowTeam2,-1
                                        mov                     selected_row_gridTeam2,-1
                                        jmp                     ret_exit8

   wjexit:                              
                                        call                    far ptr team2_highlighted_cells_existing
                                        cmp                     cx,0
                                        je                      t2move_king_exitnomove
   ret_exit8:                           
   
                                        ret
movekingTeam2 endp
   ; responsible for moving the rook piece for team2
moverookTeam2 proc  far
                                        call                    far ptr calctimeTeam2
                                        cmp                     timeflag,'f'
                                        jne                     highhigh99
                                        jmp                     far ptr t2move_rook_exitnomove
   highhigh99:                          
                                        mov                     al,selected_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        inc                     di
                                        mov                     al,[di]
                                        mov                     team,al
                                        cmp                     al ,'1'
                                        je                      erteam1
                                        cmp                     al ,'2'
                                        je                      erteam2
                                        jmp                     far ptr                  erexit

   erteam1:                             
   erteam2:                             
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   ercompare1:                          
                                        add                     highlight_rowTeam2,23
                                        cmp                     highlight_rowTeam2,184
                                        je                      erlevel2
                                        add                     highlight_row_gridTeam2,1
                                        call                    far ptr   Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      erlevel2
                                        call                    far ptr                     Team2_set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      erlevel2
                                        jmp                     far ptr                  ercompare1
               
                


                
   erlevel2:                            
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   ercompare2:                          
                                        sub                     highlight_rowTeam2,23
                                        cmp                     highlight_rowTeam2,-23
                                        je                      erlevel3
                                        sub                     highlight_row_gridTeam2,1
                                        call                    far ptr  Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      erlevel3
                                        call                    far ptr                     Team2_set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      erlevel3
                                        jmp                     far ptr                  ercompare2


   erlevel3:                            
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   ercompare3:                          
                
                                        add                     highlight_colTeam2,30
                                        cmp                     highlight_colTeam2,240
                                        je                      erlevel4
                                        add                     highlight_col_gridTeam2,1
                                        call                    far ptr   Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      erlevel4
                                        call                    far ptr                     Team2_set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      erlevel4
                                        jmp                     far ptr                  ercompare3

   erlevel4:                            
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   ercompare4:                          
               
                                        sub                     highlight_colTeam2,30
                                        cmp                     highlight_colTeam2,-30
                                        je                      erexit
                                        sub                     highlight_col_gridTeam2,1
                                        call                    far ptr   Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      erexit
                                        call                    far ptr                     Team2_set_highlighled_true
                                        cmp                     highlight_flag,'0'
                                        je                      erexit
                                        jmp                     far ptr                  ercompare4
                                        jmp                     erexit

   t2move_rook_exitnomove:              


                                        mov                     selected_colTeam2,-1
                                        mov                     selected_col_gridTeam2,-1
                                        mov                     selected_rowTeam2,-1
                                        mov                     selected_row_gridTeam2,-1
                                        jmp                     ret_exit9
   erexit:                              

                                        call                    far ptr team2_highlighted_cells_existing
                                        cmp                     cx,0
                                        je                      t2move_rook_exitnomove
   ret_exit9:                           
                                        ret
moverookTeam2 endp
   ; responsible for moving the knight piece for team2
moveknightteam2 proc  far
                                        call                    far ptr calctimeTeam2
                                        cmp                     timeflag,'f'
                                        jne                     highhigh111
                                        jmp                     far ptr t2move_knight_exitnomove
   highhigh111:                         
                                        mov                     al,selected_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        inc                     di
                                        mov                     al,[di]
                                        mov                     ah,0
                                        mov                     team,al
                                        cmp                     al ,'1'
                                        je                      kteam1121
                                        cmp                     al ,'2'
                                        je                      kteam2121
                                        jmp                     far ptr                  kexit121
 
   kteam1121:                           
   kteam2121:                           
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise1121:                          
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
       
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  +2c   +1r
                                        add                     highlight_colTeam2,60
                                        add                     highlight_rowTeam2,23
                                        cmp                     highlight_colTeam2,210
                                        ja                      choise2121
                                        cmp                     highlight_rowTeam2,161
                                        ja                      choise2121
                                        add                     highlight_col_gridTeam2,2
                                        add                     highlight_row_gridTeam2,1
                         
                                        call                    far ptr   Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      choise2121
                                        call                    far ptr                     Team2_set_highlighled_true
                        
                
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise2121:                          
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;+2c -1r
                                        add                     highlight_colTeam2,60
                                        sub                     highlight_rowTeam2,23
                                        cmp                     highlight_colTeam2,210
                                        ja                      choise3121
                                        cmp                     highlight_rowTeam2,0
                                        jl                      choise3121
                                        add                     highlight_col_gridTeam2,2
                                        sub                     highlight_row_gridTeam2,1
                                        call                    far ptr   Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      choise3121
                                        call                    far ptr                     Team2_set_highlighled_true
   ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise3121:                          
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-2c +1r
                                        sub                     highlight_colTeam2,60
                                        add                     highlight_rowTeam2,23
                                        cmp                     highlight_colTeam2,0
                                        jl                      choise4121
                                        cmp                     highlight_rowTeam2,161
                                        ja                      choise4121
                                        sub                     highlight_col_gridTeam2,2
                                        add                     highlight_row_gridTeam2,1
                                        call                    far ptr   Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      choise4121
                                        call                    far ptr                     Team2_set_highlighled_true
               
   ;     ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise4121:                          
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-2c -1r
                                        sub                     highlight_colTeam2,60
                                        sub                     highlight_rowTeam2,23
                                        cmp                     highlight_colTeam2,0
                                        jl                      choise5121
                                        cmp                     highlight_rowTeam2,0
                                        jl                      choise5121
                                        sub                     highlight_col_gridTeam2,2
                                        sub                     highlight_row_gridTeam2,1
                                        call                    far ptr   Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      choise5121
                                        call                    far ptr                     Team2_set_highlighled_true
               
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise5121:                          
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;+2r +1c
                                        add                     highlight_colTeam2,30
                                        add                     highlight_rowTeam2,46
                                        cmp                     highlight_colTeam2,210
                                        ja                      choise6121
                                        cmp                     highlight_rowTeam2,161
                                        ja                      choise6121
                                        add                     highlight_col_gridTeam2,1
                                        add                     highlight_row_gridTeam2,2
                                        call                    far ptr   Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      choise6121
                                        call                    far ptr                     Team2_set_highlighled_true
               
   ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise6121:                          
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;+2r   -1c
                                        sub                     highlight_colTeam2,30
                                        add                     highlight_rowTeam2,46
                                        cmp                     highlight_colTeam2,20
                                        jl                      choise7121
                                        cmp                     highlight_rowTeam2,161
                                        ja                      choise7121
                                        sub                     highlight_col_gridTeam2,1
                                        add                     highlight_row_gridTeam2,2
                                        call                    far ptr   Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      choise7121
                                        call                    far ptr                     Team2_set_highlighled_true
               
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise7121:                          
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-2r +1c
                                        add                     highlight_colTeam2,30
                                        sub                     highlight_rowTeam2,46
                                        cmp                     highlight_colTeam2,210
                                        ja                      choise8121
                                        cmp                     highlight_rowTeam2,0
                                        jl                      choise8121
                                        add                     highlight_col_gridTeam2,1
                                        sub                     highlight_row_gridTeam2,2
                                        call                    far ptr   Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      choise8121
                                        call                    far ptr                     Team2_set_highlighled_true
               
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise8121:                          
                                        mov                     bx,selected_colTeam2
                                        mov                     highlight_colTeam2,bx
                                        mov                     cx,selected_rowTeam2
                                        mov                     highlight_rowTeam2,cx
                                        mov                     bl, selected_row_gridTeam2
                                        mov                     highlight_row_gridTeam2,bl
                                        mov                     bh, selected_col_gridTeam2
                                        mov                     highlight_col_gridTeam2,bh
   ;;;;;;;;;;;;;;;;;;;;;;;-2r   -1c
                                        sub                     highlight_colTeam2,30
                                        sub                     highlight_rowTeam2,46
                                        cmp                     highlight_colTeam2,0
                                        jl                      kexit121
                                        cmp                     highlight_rowTeam2,0
                                        jl                      kexit121
                                        sub                     highlight_col_gridTeam2,1
                                        sub                     highlight_row_gridTeam2,2
                                        call                    far ptr   Team2highlightgoto
                                        cmp                     highlight_flag,'f'
                                        je                      kexit121
                                        call                    far ptr                     Team2_set_highlighled_true
                                        jmp                     kexit121
   t2move_knight_exitnomove:            


                                        mov                     selected_colTeam2,-1
                                        mov                     selected_col_gridTeam2,-1
                                        mov                     selected_rowTeam2,-1
                                        mov                     selected_row_gridTeam2,-1
                                        jmp                     ret_exit11

   kexit121:                            
                                        call                    far ptr team2_highlighted_cells_existing
                                        cmp                     cx,0
                                        je                      t2move_knight_exitnomove
   ret_exit11:                          
                                        ret
                        
moveknightteam2 endp


   ;responsible for going to a highlited cell for team2
Team2highlightgoto proc far
                  
                                        mov                     highlight_flag,'t'
                                        mov                     al,highlight_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,highlight_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        inc                     di
                                        mov                     al,[di]
   ; means that cell is empty
                                        cmp                     al,'0'
                                        je                      Team2highlightgoto_exit22
                                        cmp                     team,al
                                        je                      Team2highlightgoto_exit11
                                        cmp                     team,al
                                        jnz                     Team2highlightgoto_exit33
                                        jmp                     Team2highlightgoto_back

   ;one of my team
                                        cmp                     team,al
                                        je                      Team2highlightgoto_exit11
   ;not one of my team
                                        cmp                     team,al
                                        jnz                     Team2highlightgoto_exit33
                                        jmp                     far ptr                  Team2highlightgoto_back
   Team2highlightgoto_exit22:           
                                        call                    far ptr  Team2highlightoption
                                        jmp                     far ptr                  Team2highlightgoto_back
   Team2highlightgoto_exit33:           
                                        call                    far ptr  Team2highlightoption
   ;highlight flag is = false to break the loop of highlight
                                        mov                     highlight_flag,'0'
                                        jmp                     far ptr                  Team2highlightgoto_back
   Team2highlightgoto_exit11:           
   ;highlight flag is = false to break the loop of highlight
                                        mov                     highlight_flag,'f'
                                        jmp                     far ptr                  Team2highlightgoto_back
   Team2highlightgoto_back:             
                                        ret
Team2highlightgoto endp
   ;responsible for going to a highlited cell for team1
highlight_goto proc far
                  
                                        mov                     highlight_flag,'t'
                                        mov                     al,highlight_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,highlight_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        inc                     di
                                        mov                     al,[di]
   ; means that cell is empty
                                        cmp                     al,'0'
                                        je                      highlight_goto_exit22
                                        cmp                     team,al
                                        je                      highlight_goto_exit11
                                        cmp                     team,al
                                        jnz                     highlight_goto_exit33
                                        jmp                     highlight_goto_back

   ;one of my team
                                        cmp                     team,al
                                        je                      highlight_goto_exit11
   ;not one of my team
                                        cmp                     team,al
                                        jnz                     highlight_goto_exit33
                                        jmp                     far ptr                  highlight_goto_back
   highlight_goto_exit22:               
                                        call                    far ptr  highlight_option
                                        jmp                     far ptr                  highlight_goto_back
   highlight_goto_exit33:               
                                        call                    far ptr  highlight_option
   ;highlight flag is = false to break the loop of highlight
                                        mov                     highlight_flag,'0'
                                        jmp                     far ptr                  highlight_goto_back
   highlight_goto_exit11:               
   ;highlight flag is = false to break the loop of highlight
                                        mov                     highlight_flag,'f'
                                        jmp                     far ptr                  highlight_goto_back
   highlight_goto_back:                 
                                        ret
highlight_goto endp
   ;responsible for highlighting options for team2
Team2highlightoption proc far
                                        MY_purple_HIGHLIGHT_Rec highlight_rowTeam2,highlight_colTeam2
                                        mov                     al,highlight_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,highlight_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]+1
                                        cmp                     al ,'1'
                                        je                      highlightVersion2_option_team1
                                        cmp                     al,'2'
                                        je                      highlightVersion2_option_team2
                                        jmp                     far ptr                  highlight_Team2_option_exit
   highlightVersion2_option_team1:      mov                     check_color,3h
                                        jmp                     far ptr                  highlightVersion2_option_to_piece
   highlightVersion2_option_team2:      mov                     check_color,0h
                                        jmp                     far ptr                  highlightVersion2_option_to_piece
   highlightVersion2_option_to_piece:   
                                        mov                     al,highlight_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,highlight_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]
                                        cmp                     al,'h'
                                        je                      highlight_Team2_option_horse_draw
                                        cmp                     al,'q'
                                        je                      highlight_Team2_option_queen_draw
                                        cmp                     al,'p'
                                        je                      Team2_option_breakpoint11
                                        cmp                     al,'k'
                                        je                      Team2_option_breakpoint22
                                        cmp                     al,'b'
                                        je                      Team2_option_breakpoint33
                                        cmp                     al,'r'
                                        je                      Team2_option_breakpoint44
                                        jmp                     far ptr                  highlight_Team2_option_exit
   highlight_Team2_option_horse_draw:   
                                        mov                     cx,highlight_colTeam2
   ; mov          column,cx
                                        mov                     startCol,cx
                                        mov                     cx,highlight_rowTeam2
   ; mov          row,cx
                                        mov                     startRow,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
   ; Draw         row,column,knight,20,20,dl
                                        mov                     pieceWidth,20
                                        mov                     pieceHeight,20
                                        lea                     bx,knight
                                        mov                     piece,bx
                                        call                    far ptr Draw
   ; sub          column,6
                                        jmp                     far ptr                       highlight_Team2_option_exit
   Team2_option_breakpoint11:           jmp                     far ptr                  highlight_Team2_option_pwan_draw
   Team2_option_breakpoint22:           jmp                     far ptr                  highlightVersion2_option_king_draw
   Team2_option_breakpoint33:           jmp                     far ptr                  highlightVersion2_option_Bishop_draw
   Team2_option_breakpoint44:           jmp                     far ptr                  highlightVersion2_option_rook_draw
   highlight_Team2_option_queen_draw:   
                                        mov                     cx,highlight_colTeam2
   ; mov          column,cx
                                        mov                     startCol,cx
                                        mov                     cx,highlight_rowTeam2
   ; mov          row,cx
                                        mov                     startRow,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
   ; Draw         row,column,queen,13,16,dl
                                        mov                     pieceWidth,13
                                        mov                     pieceHeight,16
                                        lea                     bx,queen
                                        mov                     piece,bx
                                        call                    far ptr Draw
   ; sub          column,6
                                        jmp                     far ptr                  highlight_Team2_option_exit
   highlight_Team2_option_pwan_draw:    
                                        mov                     cx,highlight_colTeam2
   ; mov          column,cx
                                        mov                     startCol,cx
                                        mov                     cx,highlight_rowTeam2
   ; mov          row,cx
                                        mov                     startRow,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
   ; Draw         row,column,pawn,16,16,dl
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        lea                     bx,pawn
                                        mov                     piece,bx
                                        call                    far ptr Draw
   ; sub          column,6
                                        jmp                     far ptr                  highlight_Team2_option_exit

   highlightVersion2_option_king_draw:  
                                        mov                     cx,highlight_colTeam2
   ; mov          column,cx
                                        mov                     startCol,cx
                                        mov                     cx,highlight_rowTeam2
   ; mov          row,cx
                                        mov                     startRow,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
   ; Draw         row,column,king,16,16,dl
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        lea                     bx,king
                                        mov                     piece,bx
                                        call                    far ptr Draw
                                        call                    far ptr print_checkmate_team2
   ; sub          column,6
                                        jmp                     far ptr                  highlight_Team2_option_exit
   highlightVersion2_option_Bishop_draw:
                                        mov                     cx,highlight_colTeam2
   ; mov          column,cx
                                        mov                     startCol,cx
                                        mov                     cx,highlight_rowTeam2
   ; mov          row,cx
                                        mov                     startRow,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
   ; Draw         row,column,Bishop,17,16,dl
                                        mov                     pieceWidth,17
                                        mov                     pieceHeight,16
                                        lea                     bx,Bishop
                                        mov                     piece,bx
                                        call                    far ptr Draw
   ; sub          column,6
                                        jmp                     far ptr                  highlight_Team2_option_exit


   highlightVersion2_option_rook_draw:  
                                        mov                     cx,highlight_colTeam2
   ; mov          column,cx
                                        mov                     startCol,cx
                                        mov                     cx,highlight_rowTeam2
   ; mov          row,cx
                                        mov                     startRow,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
   ; Draw         row,column,rook,16,16,dl
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        lea                     bx,rook
                                        mov                     piece,bx
                                        call                    far ptr Draw
   ; sub          column,6
                                        jmp                     far ptr                  highlight_Team2_option_exit
   highlight_Team2_option_exit:         
                                        ret
Team2highlightoption endp
   ;responsible for highlighting options for team1
highlight_option proc far
                       
                                        MY_red_HIGHLIGHT_Rec    highlight_row,highlight_col
                                        mov                     al,highlight_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax


                                        mov                     al,highlight_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]+1
                                        cmp                     al ,'1'
                                        je                      highlight_option_team1
                                        cmp                     al,'2'
                                        je                      highlight_option_team2
                                        jmp                     far ptr                  highlight_option_exit

   highlight_option_team1:              mov                     check_color,3h
                                        jmp                     far ptr                  highlight_option_to_piece
   highlight_option_team2:              mov                     check_color,0h
                                        jmp                     far ptr                  highlight_option_to_piece

   highlight_option_to_piece:           
                     

                                        mov                     al,highlight_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax


                                        mov                     al,highlight_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]
                                        cmp                     al,'h'
                                        je                      highlight_option_horse_draw
                                        cmp                     al,'q'
                                        je                      highlight_option_queen_draw
                                        cmp                     al,'p'
                                        je                      highlight_option_breakpoint1
                                        cmp                     al,'k'
                                        je                      highlight_option_breakpoint2
                                        cmp                     al,'b'
                                        je                      highlight_option_breakpoint3
                                        cmp                     al,'r'
                                        je                      highlight_option_breakpoint4
                                        jmp                     far ptr                  highlight_option_exit

   highlight_option_horse_draw:         
                                        mov                     cx,highlight_col
   ; mov          column,cx
                                        mov                     startCol,cx
                                        mov                     cx,highlight_row
   ; mov          row,cx
                                        mov                     startRow,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
   ; Draw         row,column,knight,20,20,dl
                                        mov                     pieceWidth,20
                                        mov                     pieceHeight,20
                                        lea                     bx,knight
                                        mov                     piece,bx
                                        call                    far ptr Draw
   ; sub          column,6
                                        jmp                     far ptr                  highlight_option_exit
   highlight_option_breakpoint1:        jmp                     far ptr                  highlight_option_pwan_draw
   highlight_option_breakpoint2:        jmp                     far ptr                  highlight_option_king_draw
   highlight_option_breakpoint3:        jmp                     far ptr                  highlight_option_Bishop_draw
   highlight_option_breakpoint4:        jmp                     far ptr                  highlight_option_rook_draw
   highlight_option_queen_draw:         
                                        mov                     cx,highlight_col
   ; mov          column,cx
                                        mov                     startCol,cx
                                        mov                     cx,highlight_row
   ; mov          row,cx
                                        mov                     startRow,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
   ; Draw         row,column,queen,13,16,dl
                                        mov                     pieceWidth,13
                                        mov                     pieceHeight,16
                                        lea                     bx,queen
                                        mov                     piece,bx
                                        call                    far ptr Draw
   ; sub          column,6
                                        jmp                     far ptr                  highlight_option_exit
   highlight_option_pwan_draw:          
                                        mov                     cx,highlight_col
   ; mov          column,cx
                                        mov                     startCol,cx
                                        mov                     cx,highlight_row
   ; mov          row,cx
                                        mov                     startRow,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
   ; Draw         row,column,pawn,16,16,dl
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        lea                     bx,pawn
                                        mov                     piece,bx
                                        call                    far ptr Draw
   ; sub          column,6
                                        jmp                     far ptr                  highlight_option_exit

   highlight_option_king_draw:          
                                        mov                     cx,highlight_col
   ; mov          column,cx
                                        mov                     startCol,cx
                                        mov                     cx,highlight_row
   ; mov          row,cx
                                        mov                     startRow,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
   ; Draw         row,column,king,16,16,dl
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        lea                     bx,king
                                        mov                     piece,bx
                                        call                    far ptr Draw
                                        call                    far ptr print_checkmate
   ; sub          column,6
                                        jmp                     far ptr                  highlight_option_exit
   highlight_option_Bishop_draw:        
                                        mov                     cx,highlight_col
   ; mov          column,cx
                                        mov                     startCol,cx
                                        mov                     cx,highlight_row
   ; mov          row,cx
                                        mov                     startRow,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
   ; Draw         row,column,Bishop,17,16,dl
                                        mov                     pieceWidth,17
                                        mov                     pieceHeight,16
                                        lea                     bx,Bishop
                                        mov                     piece,bx
                                        call                    far ptr Draw
   ; sub          column,6
                                        jmp                     far ptr                  highlight_option_exit


   highlight_option_rook_draw:          
                                        mov                     cx,highlight_col
   ; mov          column,cx
                                        mov                     startCol,cx
                                        mov                     cx,highlight_row
   ; mov          row,cx
                                        mov                     startRow,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
   ; Draw         row,column,rook,16,16,dl
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        lea                     bx,rook
                                        mov                     piece,bx
                                        call                    far ptr Draw
   ; sub          column,6
                                        jmp                     far ptr                  highlight_option_exit
   highlight_option_exit:               
                                        ret
highlight_option endp
   ;responsible for making the highlited availiable to got to by making its value==true
set_highlighled_true proc far
                                        mov                     bl,highlight_row_grid
                                        dec                     bl
                                        mov                     bh,highlight_col_grid
                                        dec                     bh
                                        mov                     di,offset highlight_row1
                                        mov                     al,bl
                                        mov                     ah,0
                                        mov                     cl,8
                                        mul                     cl
                                        add                     di,ax
                                        mov                     bl,bh
                                        mov                     bh,0
                                        add                     di,bx
                                        mov                     al,'r'
                                        mov                     [di],al
                                        ret
set_highlighled_true endp
   ;responsible for making the highlited availiable to got to by making its value==true
Team2_set_highlighled_true proc far
                                        mov                     bl,highlight_row_gridTeam2
                                        dec                     bl
                                        mov                     bh,highlight_col_gridTeam2
                                        dec                     bh
                                        mov                     di,offset highlight_row1
                                        mov                     al,bl
                                        mov                     ah,0
                                        mov                     cl,8
                                        mul                     cl
                                        add                     di,ax
                                        mov                     bl,bh
                                        mov                     bh,0
                                        add                     di,bx
                                        mov                     al,'p'
                                        mov                     [di],al
                                        ret
Team2_set_highlighled_true endp
   ;responsible for looping till I select a cell
mov_until_select proc far
   ;  pusha
   mov_until_select_check:              
                                        call                    far ptr  game_time
                                        mov                     ah,01H
                                        int                     16h
                                        jz                      mov_until_select_check
                                        mov                     ah,00
                                        int                     16h
                                        mov                     clicked,ah
                                        call                    far ptr  move_current_cell_or_select
                                        jmp                     far ptr                  mov_until_select_check
   mov_until_select_exit:               
   ;  popa
                                        ret
mov_until_select endp
   ; responsible for moving a piece after determine it for team2
move_piece proc far
                                        mov                     al,goto_row_grid
                                        dec                     al
                                        mov                     bl,8
                                        mul                     bl
                                        mov                     bl,goto_col_grid
                                        mov                     bh,0
                                        dec                     bl
                                        add                     ax,bx
                                        mov                     di ,offset highlight_row1
                                        add                     di,ax
                                        mov                     cl,[di]
                                        mov                     al,'r'
                                        cmp                     cl,al
                                        jne                     move_piece_breakpoint1
                                        mov                     al,'f'
                                        mov                     [di],al
                                        mov                     al,selected_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax


                                        mov                     al,selected_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx

                                        mov                     cl,[di]                                                         ;;;;;piece

                                        mov                     ch,[di]+1                                                       ;;;team color
   ;  push                 cx
                                        mov                     bp,cx
                                        mov                     al,'0'
                                        mov                     [di],al
                                        inc                     di
                                        mov                     al,'0'
                                        mov                     [di],al
                                        jmp                     move_piece_breakpoint18
             
   move_piece_breakpoint1:              jmp                     far ptr move_piece_breakpoint2
   move_piece_breakpoint18:             
                                        mov                     ax,selected_col
                                        mov                     column,ax
                                        mov                     bx, selected_row
                                        mov                     row,bx
                                        mov                     ax,selected_col
                                        mov                     current_col,ax
                                        mov                     ax,selected_row
                                        mov                     current_row,ax
                                        mov                     al,selected_col_grid
                                        mov                     current_col_grid,al
                                        mov                     al,selected_row_grid
                                        mov                     current_row_grid,al
                                        mov                     al,0
                                        call                    far ptr HIGHLIGHT_selected

                             
                                        mov                     al,goto_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,goto_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     si,ax
                                        add                     si,cx
                                        mov                     al,[si]+1
                                        call                    far ptr print_removed_team1
   ;  pop                  cx
                                        mov                     cx,bp
                                        jmp                     move_piece_breakpoint19
   move_piece_breakpoint2:              jmp                     far ptr move_piece_exit
   move_piece_breakpoint19:             
                                        mov                     al,'k'
                                        cmp                     [si],al
                                        jne                     con_con
                                        mov                     al,[si]+1
                                        mov                     game_over_flag_team,al
   con_con:                             
                                        mov                     [si],cl
                                        mov                     [si]+1,ch
                                        mov                     ax,goto_col
                                        mov                     column,ax
                                        mov                     ax, goto_row
                                        mov                     row,ax
                                        mov                     ax,goto_col
                                        mov                     current_col,ax
                                        mov                     ax,goto_row
                                        mov                     current_row,ax
                                        mov                     al,goto_col_grid
                                        mov                     current_col_grid,al
                                        mov                     al,goto_row_grid
                                        mov                     current_row_grid,al

                                    
                                        mov                     al,1
                                        call                    far ptr HIGHLIGHT_selected

                                        mov                     ah,2CH
                                        INT                     21h
                                    
                                        mov                     hrs,ch
                                        mov                     min,cl
                                        mov                     sec,dh
                                        mov                     ebx ,3600
                                        mov                     eax,0
                                        mov                     al,hrs
                                        mul                     ebx
                                        mov                     ecx,eax
                                        mov                     ebx ,60
                                        mov                     eax,0
                                        mov                     al,min
                                        mul                     ebx
                                        add                     ecx,eax
                                        mov                     edx,0
                                        mov                     dl,sec
                                        add                     ecx,edx
                                        mov                     edx,ecx

                                  
                                        mov                     al,goto_col_grid
                                        dec                     al
                                        mov                     bl,4
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,goto_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,32
                                        mul                     bl
                                        add                     ax,offset time1
                                        mov                     si,ax
                                        add                     si,cx
                                        mov                     [si],edx
   ;;;;
   ;;;;

   move_piece_exit:                     
                                        mov                     selected_col,-1
                                        mov                     selected_row,-1
                                        mov                     selected_row_grid,-1
                                        mov                     selected_col_grid,-1
                                        call                    far ptr  Dehighlight_Grid
                    
                                        ret
move_piece endp
   ;responsible for highlighting seleceted cell for team1
HIGHLIGHT_selected proc far
   ;   mov              cl,flag ;;;;;;;;;;;;;;;;;;flag should be in al
                                        mov                     cl,al
                                        cmp                     cl,0
                                        jne                     HIGHLIGHT_selected_break_point5
                                        mov                     al,current_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax

                                        mov                     al,current_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]+2
                                        cmp                     al ,'w'
                                        jne                     com_com
                                        jmp                     HIGHLIGHT_selected_draw_w
   com_com:                             
                                        cmp                     al ,'b'
                                        je                      HIGHLIGHT_selected_draw_b
                                        jmp                     far ptr              HIGHLIGHT_selected_exit

   HIGHLIGHT_selected_break_point5:     jmp                     far ptr HIGHLIGHT_selected_draw_highlight

   HIGHLIGHT_selected_draw_b:           
                                        mov                     di,offset highlight_row1
                                        mov                     al,current_row_grid
                                        dec                     al
                                        mov                     bl,8
                                        mul                     bl
                                        mov                     bl,current_col_grid
                                        dec                     bl
                                        mov                     bh,00
                                        add                     ax,bx
                                        add                     di,ax
                                        mov                     al,'r'
                                        cmp                     [di],al
                                        je                      red
                                        mov                     al,'p'
                                        cmp                     [di],al
                                        je                      purpel
                                        jmp                     far ptr  brown
   purpel:                              MY_purple_HIGHLIGHT_Rec row,column
                                        jmp                     far ptr              HIGHLIGHT_selected_to_team_color
   red:                                 MY_red_HIGHLIGHT_Rec    row,column
                                        jmp                     far ptr              HIGHLIGHT_selected_to_team_color
   brown:                               
                                        MYBrownRec              row,column

                                        jmp                     far ptr              HIGHLIGHT_selected_to_team_color
   HIGHLIGHT_selected_draw_w:           
                                        mov                     di,offset highlight_row1
                                        mov                     al,current_row_grid
                                        dec                     al
                                        mov                     bl,8
                                        mul                     bl
                                        mov                     bl,current_col_grid
                                        dec                     bl
                                        mov                     bh,00
                                        add                     ax,bx
                                        add                     di,ax
                                   
                                    
                                        mov                     al,'r'
                                        cmp                     [di],al
                                        je                      red2
                                        mov                     al,'p'
                                        cmp                     [di],al
                                        je                      purpel2
                                        jmp                     far ptr  white
   purpel2:                             MY_purple_HIGHLIGHT_Rec row,column
                                        jmp                     far ptr              HIGHLIGHT_selected_to_team_color
   red2:                                MY_red_HIGHLIGHT_Rec    row,column
                                        jmp                     far ptr              HIGHLIGHT_selected_to_team_color
                                    
   white:                               
                                        MYWhiteRec              row,column
                                        jmp                     far ptr              HIGHLIGHT_selected_to_team_color

   HIGHLIGHT_selected_draw_highlight:                                                                                           ; will be deleted soon (Nesma)

                                   
                                        MY_HIGHLIGHT_Rec        row,column
                                        jmp                     far ptr              HIGHLIGHT_selected_to_team_color



   HIGHLIGHT_selected_to_team_color:    
                                        mov                     al,current_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax


                                        mov                     al,current_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]+1
                                        cmp                     al ,'1'
                                        je                      HIGHLIGHT_selected_team1
                                        cmp                     al,'2'
                                        je                      HIGHLIGHT_selected_team2
                                        jmp                     far ptr              HIGHLIGHT_selected_exit

   HIGHLIGHT_selected_team1:            mov                     check_color,3h
                                        jmp                     far ptr              HIGHLIGHT_selected_to_piece
   HIGHLIGHT_selected_team2:            mov                     check_color,0h
                                        jmp                     far ptr              HIGHLIGHT_selected_to_piece

   HIGHLIGHT_selected_to_piece:         
                                        mov                     al,current_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     bx,ax

                                        mov                     al,current_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax


                                        mov                     al,current_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]
                                        cmp                     al,'h'
                                        je                      HIGHLIGHT_selected_horse_draw
                                        cmp                     al,'q'
                                        je                      HIGHLIGHT_selected_queen_draw
                                        cmp                     al,'p'
                                        je                      HIGHLIGHT_selected_break_point1
                                        cmp                     al,'k'
                                        je                      HIGHLIGHT_selected_break_point2
                                        cmp                     al,'b'
                                        je                      HIGHLIGHT_selected_break_point3
                                        cmp                     al,'r'
                                        je                      HIGHLIGHT_selected_break_point4
                                        jmp                     far ptr              HIGHLIGHT_selected_exit

   HIGHLIGHT_selected_horse_draw:       
                                        mov                     cx,column
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx,row
                                        mov                     startRow,cx
                                        lea                     bx,knight
                                        mov                     piece,bx
                                        mov                     pieceWidth,20
                                        mov                     pieceHeight,20
                                        call                    far ptr Draw
   ;   Draw             row,column,knight,20,20,dl
   ;   sub              column,6
                                        jmp                     far ptr              HIGHLIGHT_selected_exit
                    
                    
   HIGHLIGHT_selected_break_point1:     jmp                     far ptr   HIGHLIGHT_selected_pwan_draw
   HIGHLIGHT_selected_break_point2:     jmp                     far ptr   HIGHLIGHT_selected_king_draw
   HIGHLIGHT_selected_break_point3:     jmp                     far ptr   HIGHLIGHT_selected_Bishop_draw
   HIGHLIGHT_selected_break_point4:     jmp                     far ptr   HIGHLIGHT_selected_rook_draw
                     

   HIGHLIGHT_selected_queen_draw:       

                                        mov                     cx,column
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx,row
                                        mov                     startRow,cx
                                        lea                     bx,queen
                                        mov                     piece,bx
                                        mov                     pieceWidth,13
                                        mov                     pieceHeight,16
                                        call                    far ptr Draw

   ;   Draw             row,column,queen,13,16,dl
   ;   sub              column,6
                                        jmp                     far ptr              HIGHLIGHT_selected_exit


   HIGHLIGHT_selected_pwan_draw:        

                                        mov                     cx,column
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx,row
                                        mov                     startRow,cx
                                        lea                     bx,pawn
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        call                    far ptr Draw
   ;   Draw             row,column,pawn,16,16,dl
   ;   sub              column,6
                                        jmp                     far ptr              HIGHLIGHT_selected_exit

   HIGHLIGHT_selected_king_draw:        

                                        mov                     cx,column
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx,row
                                        mov                     startRow,cx
                                        lea                     bx,king
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        call                    far ptr Draw
   ;   Draw             row,column,king,16,16,dl
   ;   sub              column,6
                                        jmp                     far ptr              HIGHLIGHT_selected_exit


   HIGHLIGHT_selected_Bishop_draw:      

                                        mov                     cx,column
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx,row
                                        mov                     startRow,cx
                                        lea                     bx,Bishop
                                        mov                     piece,bx
                                        mov                     pieceWidth,17
                                        mov                     pieceHeight,16
                                        call                    far ptr Draw
   ;   Draw             row,column,Bishop,17,16,dl
   ;   sub              column,6
                                        jmp                     far ptr              HIGHLIGHT_selected_exit


   HIGHLIGHT_selected_rook_draw:        
                                        mov                     cx,column
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx,row
                                        mov                     startRow,cx
                                        lea                     bx,rook
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        call                    far ptr Draw
   ;   Draw             row,column,rook,16,16,dl
   ;   sub              column,6
                                        jmp                     far ptr              HIGHLIGHT_selected_exit

   HIGHLIGHT_selected_exit:             
                                        ret

HIGHLIGHT_selected endp
   ;responsible for highlighting seleceted cell team2
HIGHLIGHTSelectedTeam2 proc far
   ;   mov              cl,flag ;;;;;;;;;;;;;;;;;;flag should be in al
                                        mov                     cl,al
                                        cmp                     cl,0
                                        jne                     team2_break_point5
                                        mov                     al,current_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax

                                        mov                     al,current_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]+2
                                        cmp                     al ,'w'
                                        jne                     team2_com_com
                                        jmp                     team2_draw_w
   team2_com_com:                       
                                        cmp                     al ,'b'
                                        je                      team2_draw_b
                                        jmp                     far ptr              team2_exit

   team2_break_point5:                  jmp                     far ptr team2_highlight

   team2_draw_b:                        
                                        mov                     di,offset highlight_row1
                                        mov                     al,current_row_gridTeam2
                                        dec                     al
                                        mov                     bl,8
                                        mul                     bl
                                        mov                     bl,current_col_gridTeam2
                                        dec                     bl
                                        mov                     bh,00
                                        add                     ax,bx
                                        add                     di,ax
                                   
                                   
                                        mov                     al,'r'
                                        cmp                     [di],al
                                        je                      redred
                                        mov                     al,'p'
                                        cmp                     [di],al
                                        je                      purpelpurpel
                                        jmp                     far ptr  team2_brown
   purpelpurpel:                        MY_purple_HIGHLIGHT_Rec row,column
                                        jmp                     far ptr              team2_to_team_color
   redred:                              MY_red_HIGHLIGHT_Rec    row,column
                                        jmp                     far ptr              team2_to_team_color
                                    
   team2_brown:                         
                                        MYBrownRec              row,column

                                        jmp                     far ptr              team2_to_team_color
   team2_draw_w:                        
                                        mov                     di,offset highlight_row1
                                        mov                     al,current_row_gridTeam2
                                        dec                     al
                                        mov                     bl,8
                                        mul                     bl
                                        mov                     bl,current_col_gridTeam2
                                        dec                     bl
                                        mov                     bh,00
                                        add                     ax,bx
                                        add                     di,ax
                                        mov                     al,'r'
                                        cmp                     [di],al
                                        je                      redred2
                                        mov                     al,'p'
                                        cmp                     [di],al
                                        je                      purpelpurpel2
                                        jmp                     far ptr  team2_white
   purpelpurpel2:                       MY_purple_HIGHLIGHT_Rec row,column
                                        jmp                     far ptr              team2_to_team_color
   redred2:                             MY_red_HIGHLIGHT_Rec    row,column
                                        jmp                     far ptr              team2_to_team_color
   team2_white:                         
                                        MYWhiteRec              row,column
                                        jmp                     far ptr              team2_to_team_color

   team2_highlight:                                                                                                             ; will be deleted soon (Nesma)

                                   
                                        MY_HIGHLIGHT_Rec_level2 current_rowTeam2,current_colTeam2
                                        jmp                     far ptr            team2_to_team_color



   team2_to_team_color:                 
                                        mov                     al,current_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax


                                        mov                     al,current_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]+1
                                        cmp                     al ,'1'
                                        je                      team2_team1
                                        cmp                     al,'2'
                                        je                      team2_team2
                                        jmp                     far ptr              team2_exit

   team2_team1:                         mov                     check_color,3h
                                        jmp                     far ptr              team2_to_piece
   team2_team2:                         mov                     check_color,0h
                                        jmp                     far ptr              team2_to_piece

   team2_to_piece:                      
                                        mov                     al,current_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     bx,ax

                                        mov                     al,current_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax


                                        mov                     al,current_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]
                                        cmp                     al,'h'
                                        je                      team2_horse_draw
                                        cmp                     al,'q'
                                        je                      team2_queen_draw
                                        cmp                     al,'p'
                                        je                      team2_break_point1
                                        cmp                     al,'k'
                                        je                      team2_break_point2
                                        cmp                     al,'b'
                                        je                      team2_break_point3
                                        cmp                     al,'r'
                                        je                      team2_break_point4
                                        jmp                     far ptr              team2_exit

   team2_horse_draw:                    
                                        mov                     cx,column
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx,row
                                        mov                     startRow,cx
                                        lea                     bx,knight
                                        mov                     piece,bx
                                        mov                     pieceWidth,20
                                        mov                     pieceHeight,20
                                        call                    far ptr Draw
   ;   Draw             row,column,knight,20,20,dl
   ;   sub              column,6
                                        jmp                     far ptr          team2_exit
                    
                    
   team2_break_point1:                  jmp                     far ptr  team2_pwan_draw
   team2_break_point2:                  jmp                     far ptr  team2_king_draw
   team2_break_point3:                  jmp                     far ptr   team2_Bishop_draw
   team2_break_point4:                  jmp                     far ptr   team2_rook_draw
                     

   team2_queen_draw:                    

                                        mov                     cx,column
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx,row
                                        mov                     startRow,cx
                                        lea                     bx,queen
                                        mov                     piece,bx
                                        mov                     pieceWidth,13
                                        mov                     pieceHeight,16
                                        call                    far ptr Draw

   ;   Draw             row,column,queen,13,16,dl
   ;   sub              column,6
                                        jmp                     far ptr             team2_exit


   team2_pwan_draw:                     

                                        mov                     cx,column
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx,row
                                        mov                     startRow,cx
                                        lea                     bx,pawn
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        call                    far ptr Draw
   ;   Draw             row,column,pawn,16,16,dl
   ;   sub              column,6
                                        jmp                     far ptr              team2_exit

   team2_king_draw:                     

                                        mov                     cx,column
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx,row
                                        mov                     startRow,cx
                                        lea                     bx,king
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        call                    far ptr Draw
   ;   Draw             row,column,king,16,16,dl
   ;   sub              column,6
                                        jmp                     far ptr              team2_exit


   team2_Bishop_draw:                   

                                        mov                     cx,column
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx,row
                                        mov                     startRow,cx
                                        lea                     bx,Bishop
                                        mov                     piece,bx
                                        mov                     pieceWidth,17
                                        mov                     pieceHeight,16
                                        call                    far ptr Draw
   ;   Draw             row,column,Bishop,17,16,dl
   ;   sub              column,6
                                        jmp                     far ptr              team2_exit


   team2_rook_draw:                     
                                        mov                     cx,column
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx,row
                                        mov                     startRow,cx
                                        lea                     bx,rook
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        call                    far ptr Draw
   ;   Draw             row,column,rook,16,16,dl
   ;   sub              column,6
                                        jmp                     far ptr             team2_exit

   team2_exit:                          
                                        ret

HIGHLIGHTSelectedTeam2 endp
   ;responsible for checking the button pressed up-down-left-right-enter-f4
move_current_cell_or_select proc far
                                        cmp                     clicked,3eh
                                        JNE                     GGGG
                                        CALL                    FAR PTR end_game_F4
   GGGG:                                cmp                     clicked,30                                                      ;;;left -->>A
                                        jne                     next_cur1Team2
                                        jmp                     far ptr                 leftTeam2
   next_cur1Team2:                      
                                        cmp                     clicked,17                                                      ;;;up-->>W
                                        jne                     next_cur2Team2
                                        jmp                     far ptr                upTeam2
   next_cur2Team2:                      
                                        cmp                     clicked,31                                                      ;;;down-->>S
                                        jne                     next_cur3Team2
                                        jmp                     far ptr                downTeam2
   next_cur3Team2:                      
                                        cmp                     clicked,32                                                      ;;;right-->>D
                                        jne                     next_cur4Team2
                                        jmp                     far ptr                rightTeam2
   next_cur4Team2:                      
                                        cmp                     clicked,16                                                      ;;;enter-->>Q
                                        jne                     next_cur11
                                        jmp                     far ptr                enterTeam2

   next_cur11:                          cmp                     clicked,75                                                      ;;;left
                                        jne                     next_cur1
                                        jmp                     far ptr                 move_current_cell_or_select_left
   next_cur1:                           
                                        cmp                     clicked,72                                                      ;;;up
                                        jne                     next_cur2
                                        jmp                     far ptr                 move_current_cell_or_select_up
   next_cur2:                           
                                        cmp                     clicked,80                                                      ;;;down
                                        jne                     next_cur3
                                        jmp                     far ptr                 move_current_cell_or_select_down
   next_cur3:                           
                                        cmp                     clicked,77                                                      ;;;right
                                        jne                     next_cur4
                                        jmp                     far ptr                 move_current_cell_or_select_right
   next_cur4:                           
                                        cmp                     clicked,28                                                      ;;;enter
                                        jne                     next_cur5
                                        jmp                     far ptr                 move_current_cell_or_select_enter
   next_cur5:                           
                                        jmp                     far ptr                move_current_cell_or_select_exit

   move_current_cell_or_select_left:    
                                        cmp                     current_col,00
                                        jne                     next_cur6
                                        jmp                     far ptr                move_current_cell_or_select_exit
   next_cur6:                           
                                        sub                     current_col,30
                                        push                    dx
                                        mov                     dx,current_row
                                        mov                     row,dx

                                        mov                     dx,current_col
                                        mov                     column,dx
                                        add                     column,30
                                        mov                     al,0
                                        call                    far ptr HIGHLIGHT_selected
                                        dec                     current_col_grid
  
                                        mov                     dx,current_row
                                        mov                     row,dx
                                        mov                     dx,current_col
                                        mov                     column,dx
                                        pop                     dx
                                        mov                     al,1
                                        call                    far ptr HIGHLIGHT_selected
                                        jmp                     far ptr                 move_current_cell_or_select_exit




   leftTeam2:                           
                                        cmp                     current_colTeam2,00
                                        jne                     next_cur6Team2
                                        jmp                     far ptr                move_current_cell_or_select_exit
   next_cur6Team2:                      
                                        sub                     current_colTeam2,30
                                        push                    dx
                                        mov                     dx,current_rowTeam2
                                        mov                     row,dx

                                        mov                     dx,current_colTeam2
                                        mov                     column,dx
                                        add                     column,30
                                        mov                     al,0
                                        call                    far ptr HIGHLIGHTSelectedTeam2
                                        dec                     current_col_gridTeam2
  
                                        mov                     dx,current_rowTeam2
                                        mov                     row,dx
                                        mov                     dx,current_colTeam2
                                        mov                     column,dx
                                        pop                     dx
                                        mov                     al,1
                                        call                    far ptr HIGHLIGHTSelectedTeam2
                                        jmp                     far ptr                 move_current_cell_or_select_exit






   move_current_cell_or_select_down:    
                                        cmp                     current_row,161
                                        jne                     next_cur7
                                        jmp                     far ptr                move_current_cell_or_select_exit
   next_cur7:                           

                                        add                     current_row,23
                                        push                    dx
                                        mov                     dx,current_row
                                        mov                     row,dx

                                        mov                     dx,current_col
                                        mov                     column,dx
                                        sub                     row,23
                                        mov                     al,0
                                        call                    far ptr HIGHLIGHT_selected
                                        inc                     current_row_grid
                                        mov                     dx,current_row
                                        mov                     row,dx

                                        mov                     dx,current_col
                                        mov                     column,dx
                                        pop                     dx
                                        mov                     al,1
                                        call                    far ptr HIGHLIGHT_selected
                                        jmp                     far ptr                 move_current_cell_or_select_exit





   downTeam2:                           
                                        cmp                     current_rowTeam2,161
                                        jne                     next_cur7Team2
                                        jmp                     far ptr                move_current_cell_or_select_exit
   next_cur7Team2:                      

                                        add                     current_rowTeam2,23
                                        push                    dx
                                        mov                     dx,current_rowTeam2
                                        mov                     row,dx

                                        mov                     dx,current_colTeam2
                                        mov                     column,dx
                                        sub                     row,23
                                        mov                     al,0
                                        call                    far ptr HIGHLIGHTSelectedTeam2
                                        inc                     current_row_gridTeam2
                                        mov                     dx,current_rowTeam2
                                        mov                     row,dx

                                        mov                     dx,current_colTeam2
                                        mov                     column,dx
                                        pop                     dx
                                        mov                     al,1
                                        call                    far ptr HIGHLIGHTSelectedTeam2
                                        jmp                     far ptr                 move_current_cell_or_select_exit



   move_current_cell_or_select_up:      
                                        cmp                     current_row,0
                                        jne                     next_cur8
                                        jmp                     far ptr                move_current_cell_or_select_exit
   next_cur8:                           

                                        sub                     current_row,23
                                        push                    dx
                                        mov                     dx,current_row
                                        mov                     row,dx

                                        mov                     dx,current_col
                                        mov                     column,dx
                                        add                     row,23
                                        mov                     al,0
                                        call                    far ptr HIGHLIGHT_selected
                                        dec                     current_row_grid
                                        mov                     dx,current_row
                                        mov                     row,dx

                                        mov                     dx,current_col
                                        mov                     column,dx
                                        pop                     dx
                                        mov                     al,1
                                        call                    far ptr HIGHLIGHT_selected
                                        jmp                     far ptr                 move_current_cell_or_select_exit




   upTeam2:                             
                                        cmp                     current_rowTeam2,0
                                        jne                     next_cur8Team2
                                        jmp                     far ptr                move_current_cell_or_select_exit
   next_cur8Team2:                      

                                        sub                     current_rowTeam2,23
                                        push                    dx
                                        mov                     dx,current_rowTeam2
                                        mov                     row,dx

                                        mov                     dx,current_colTeam2
                                        mov                     column,dx
                                        add                     row,23
                                        mov                     al,0
                                        call                    far ptr HIGHLIGHTSelectedTeam2
                                        dec                     current_row_gridTeam2
                                        mov                     dx,current_rowTeam2
                                        mov                     row,dx

                                        mov                     dx,current_colTeam2
                                        mov                     column,dx
                                        pop                     dx
                                        mov                     al,1
                                        call                    far ptr HIGHLIGHTSelectedTeam2
                                        jmp                     far ptr                 move_current_cell_or_select_exit
   move_current_cell_or_select_right:   
                                        cmp                     current_col,210
                                        jne                     next_cur9
                                        jmp                     far ptr                move_current_cell_or_select_exit
   next_cur9:                           

                                        add                     current_col,30
                                        push                    dx
                                        mov                     dx,current_row
                                        mov                     row,dx

                                        mov                     dx,current_col
                                        mov                     column,dx
                                        sub                     column,30
                                        mov                     al,0
                                        call                    far ptr HIGHLIGHT_selected
                                        inc                     current_col_grid
                                        mov                     dx,current_row
                                        mov                     row,dx
                                        mov                     dx,current_col
                                        mov                     column,dx
                                        pop                     dx
                                        mov                     al,1
                                        call                    far ptr HIGHLIGHT_selected
                                        jmp                     far ptr                 move_current_cell_or_select_exit
   rightTeam2:                          
                                        cmp                     current_colTeam2,210
                                        jne                     next_cur9Team2
                                        jmp                     far ptr                move_current_cell_or_select_exit
   next_cur9Team2:                      

                                        add                     current_colTeam2,30
                                        push                    dx
                                        mov                     dx,current_rowTeam2
                                        mov                     row,dx

                                        mov                     dx,current_colTeam2
                                        mov                     column,dx
                                        sub                     column,30
                                        mov                     al,0
                                        call                    far ptr HIGHLIGHTSelectedTeam2
                                        inc                     current_col_gridTeam2
                                        mov                     dx,current_rowTeam2
                                        mov                     row,dx
                                        mov                     dx,current_colTeam2
                                        mov                     column,dx
                                        pop                     dx
                                        mov                     al,1
                                        call                    far ptr HIGHLIGHTSelectedTeam2
                                        jmp                     far ptr                 move_current_cell_or_select_exit

   move_current_cell_or_select_enter:   
                                        mov                     al,-1
                                        cmp                     selected_col_grid,al
                                        je                      enter_select
                                        jmp                     far ptr  mov_team1_piece
   enter_select:                        
                                        mov                     al,current_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,current_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]+1
                                        cmp                     al ,'1'
                                        je                      next_cur10
                                        jmp                     far ptr                move_current_cell_or_select_exit

   next_cur10:                          
                                     
                                                
                                        mov                     ax,current_col
                                        mov                     selected_col,ax

                                        mov                     ax,current_row
                                        mov                     selected_row,ax

                                        mov                     al,current_col_grid
                                        mov                     selected_col_grid,al

                                        mov                     al,current_row_grid
                                        mov                     selected_row_grid,al

                                        mov                     al,selected_col_grid
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]
                                        cmp                     al,'h'
                                        jne                     Knightchoice
                                        jmp                     far ptr move_current_cell_or_select_kh
   Knightchoice:                        cmp                     al,'p'
                                        jne                     pawnchoice
                                        jmp                     far ptr move_current_cell_or_select_p
   pawnchoice:                          cmp                     al,'b'
                                        jne                     Bishopchoice
                                        jmp                     far ptr move_current_cell_or_select_b

   Bishopchoice:                        cmp                     al,'r'
                                        jne                     rookchoice
                                        jmp                     far ptr move_current_cell_or_select_r

   rookchoice:                          cmp                     al,'q'
                                        jne                     kingchoice
                                        jmp                     far ptr move_current_cell_or_select_q
   kingchoice:                          cmp                     al,'k'
                                        jne                     nn
   nochoice:                            jmp                     far ptr move_current_cell_or_select_kg
   nn:                                  jmp                     far ptr                 move_current_cell_or_select_exit
   mov_team1_piece:                     
              
                                        mov                     ax,current_col
                                        mov                     goto_col,ax
                                        mov                     al,current_col_grid
                                        mov                     goto_col_grid,al
                                        mov                     ax,current_row
                                        mov                     goto_row,ax
                                        mov                     al,current_row_grid
                                        mov                     goto_row_grid,al
                                        call                    far ptr move_piece
                                        cmp                     game_over_flag_team,-1
                                        jne                     ff
                                        jmp                     far ptr                 move_current_cell_or_select_exit
   ff:                                  call                    far ptr  game_over_notification
                                        jmp                     far ptr                 move_current_cell_or_select_exit
   move_current_cell_or_select_kh:      
                                        call                    far ptr      move_knight
                                        jmp                     far ptr                 move_exit
   
   move_current_cell_or_select_p:       
                                     
                                        call                    far ptr               move_pawn
                                        jmp                     far ptr                 move_exit
   move_current_cell_or_select_r:       
                                        call                    far ptr               move_rook
                                        jmp                     far ptr                 move_exit
   move_current_cell_or_select_b:       
                                        call                    far ptr               move_bishop
                                        jmp                     far ptr                 move_exit
   move_current_cell_or_select_kg:      
                                        call                    far ptr               move_king
                                        jmp                     far ptr                 move_exit
   move_current_cell_or_select_q:       
                                        call                    far ptr               move_bishop
                                        mov                     ax,current_col
                                        mov                     selected_col,ax
                                        mov                     ax,current_row
                                        mov                     selected_row,ax
                                        mov                     al,current_col_grid
                                        mov                     selected_col_grid,al
                                        mov                     al,current_row_grid
                                        mov                     selected_row_grid,al
                                        call                    far ptr               move_rook

                                        jmp                     far ptr                 move_exit

   enterTeam2:                          
                                        mov                     al,-1
                                        cmp                     selected_col_gridTeam2,al
                                        je                      enter_select1
                                        jmp                     far ptr  mov_team1_piece1
   enter_select1:                       
                                        mov                     al,current_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,current_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]+1
                                        cmp                     al ,'2'
                                        je                      next_cur101
                                        jmp                     far ptr                move_current_cell_or_select_exit

   next_cur101:                         
                                     
                                                
                                        mov                     ax,current_colTeam2
                                        mov                     selected_colTeam2,ax

                                        mov                     ax,current_rowTeam2
                                        mov                     selected_rowTeam2,ax

                                        mov                     al,current_col_gridTeam2
                                        mov                     selected_col_gridTeam2,al

                                        mov                     al,current_row_gridTeam2
                                        mov                     selected_row_gridTeam2,al

                                        mov                     al,selected_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx
                                        mov                     al,[di]
                                        cmp                     al,'h'
                                        jne                     Knightchoice1
                                        jmp                     far ptr kh11
   Knightchoice1:                       cmp                     al,'p'
                                        jne                     pawnchoice1
                                        jmp                     far ptr p11
   pawnchoice1:                         cmp                     al,'b'
                                        jne                     Bishopchoice1
                                        jmp                     far ptr b11

   Bishopchoice1:                       cmp                     al,'r'
                                        jne                     rookchoice1
                                        jmp                     far ptr r11

   rookchoice1:                         cmp                     al,'q'
                                        jne                     kingchoice1
                                        jmp                     far ptr q11
   kingchoice1:                         cmp                     al,'k'
                                        jne                     nn1
   nochoice1:                           jmp                     far ptr kg11
   nn1:                                 jmp                     far ptr                 move_current_cell_or_select_exit
   mov_team1_piece1:                    
                
                                        mov                     ax,current_colTeam2
                                        mov                     goto_colTeam2,ax
                                        mov                     al,current_col_gridTeam2
                                        mov                     goto_col_gridTeam2,al
                                        mov                     ax,current_rowTeam2
                                        mov                     goto_rowTeam2,ax
                                        mov                     al,current_row_gridTeam2
                                        mov                     goto_row_gridTeam2,al
                                        call                    far ptr move_piecet2
                                        cmp                     game_over_flag_team,-1
                                        je                      move_current_cell_or_select_exit
                                        call                    far ptr  game_over_notification
                                        jmp                     far ptr                 move_current_cell_or_select_exit
   kh11:                                
                                        call                    far ptr      moveknightteam2
                                        jmp                     far ptr                 move_exit
   
   p11:                                 
                                     
                                        call                    far ptr               movepawnTeam2
                                        jmp                     far ptr                 move_exit
   r11:                                 
                                        call                    far ptr               moverookTeam2
                                        jmp                     far ptr                 move_exit
   b11:                                 
                                        call                    far ptr               move_bishopTeam2
                                        jmp                     far ptr                 move_exit
   kg11:                                
                                        call                    far ptr               movekingTeam2
                                        jmp                     far ptr                 move_exit
   q11:                                 
                                        call                    far ptr               move_bishopTeam2
                                        mov                     ax,current_colTeam2
                                        mov                     selected_colTeam2,ax
                                        mov                     ax,current_rowTeam2
                                        mov                     selected_rowTeam2,ax
                                        mov                     al,current_col_gridTeam2
                                        mov                     selected_col_gridTeam2,al
                                        mov                     al,current_row_gridTeam2
                                        mov                     selected_row_gridTeam2,al
                                        call                    far ptr               moverookTeam2
         
  
                                        jmp                     far ptr                 move_exit

   move_exit:                           
                                     
                               
                                        jmp                     far ptr                 move_current_cell_or_select_exit
   move_current_cell_or_select_exit:    
                                
                                        ret
move_current_cell_or_select endp
   ;responsible for getting the coordinates of the cell by its given number
Get_Cell_Points proc far
                                        mov                     operand,8                                                       ;operand is by deafult=8
                                        mov                     dl,operand
                                        mov                     ah,0
                                        mov                     al,cell_number
                                        div                     dl
                                        inc                     al
                                        mov                     rowgrid,al
                                        mov                     colgrid,ah
                                        cmp                     ah,0
                                        jne                     continue

                                        dec                     rowgrid
                                        dec                     al
                                        mov                     ah,8
                                        mov                     colgrid,ah
   continue:                            
                                        dec                     al
                                        mov                     operand,23
                                        mov                     dl,operand
                                        mul                     dl
                                        mov                     Currrow,ax                                                      ;Currrow must be a word

                                        mov                     ax,0
                                        mov                     al,colgrid
                                        dec                     al
                                        mov                     operand,30
                                        mov                     dl,operand
                                        mul                     dl
                                        mov                     Currcol,ax                                                      ;Currcol must be a word
                                        ret
Get_Cell_Points endp
   ;responsible for Drawing  Original Cell Color while dehighlithing
DrawOriginalCellColor proc far
                               
                                
                                        mov                     al,[si]+2
                                        mov                     bl,'w'
                                        cmp                     al ,bl
                                        je                      DrawWhite
                                        mov                     bl,'b'
                                        cmp                     al ,bl
                                        je                      DrawBrown
   ; jmp far ptr                      MyExit
   DrawBrown:                           
                                 
                                        MYBrownRec              Currrow,Currcol
                                 
                                        jmp                     far ptr                      TeamColor
   DrawWhite:                           
                                 
                                        MYWhiteRec              Currrow,Currcol
                                 
                                        jmp                     far ptr                      TeamColor
   TeamColor:                           
                                        mov                     si,bp
                                        mov                     al,[si]+1
                                 
                                        cmp                     al ,'1'
                                        je                      Team1
                                        cmp                     al,'2'
                                        je                      Team2
                                        jmp                     far ptr                      MyExit
   Team1:                               mov                     check_color,3h
                                        jmp                     far ptr                      CheckPiece
   Team2:                               mov                     check_color,0h
                                        jmp                     far ptr                      CheckPiece
   CheckPiece:                          
                                        mov                     si,bp
                                        mov                     al,[si]
                                        cmp                     al,'h'
                                        je                      HorseDraw
                                        cmp                     al,'q'
                                        je                      QueenDraw
                                        cmp                     al,'p'
                                        je                      a1
                                        cmp                     al,'k'
                                        je                      b1
                                        cmp                     al,'b'
                                        je                      c1
                                        cmp                     al,'r'
                                        je                      d1
                                        jmp                     far ptr                      MyExit
   HorseDraw:                           
                                        mov                     cx, Currcol
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx, Currrow
                                        mov                     startRow,cx
                                        mov                     pieceWidth,20
                                        mov                     pieceHeight,20

                                 
                                        lea                     bx,knight
                                        mov                     piece,bx
                                 
                                
                                        call                    far ptr Draw
   ; Draw                     Currrow,Currcol,knight,20,20,dl
   ; sub                      Currcol,6
                                        jmp                     far ptr                      MyExit
   a1:                                  jmp                     PawnDraw
   b1:                                  jmp                     KingDraw
   c1:                                  jmp                     BishopDraw
   d1:                                  jmp                     RookDraw
   QueenDraw:                           
                                        mov                     cx, Currcol
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx, Currrow
                                        mov                     startRow,cx
                                        mov                     pieceWidth,13
                                        mov                     pieceHeight,16

                                 
                                        lea                     bx,queen
                                        mov                     piece,bx
                                 
                                
                                        call                    far ptr Draw
   ; Draw                     Currrow,Currcol,queen,13,16,dl
   ; sub                      Currcol,6
                                        jmp                     far ptr                      MyExit
   PawnDraw:                            
                                        mov                     cx, Currcol
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx, Currrow
                                        mov                     startRow,cx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16

                                 
                                        lea                     bx,pawn
                                        mov                     piece,bx
                                 
                                
                                        call                    far ptr Draw
   ; Draw                     Currrow,Currcol,pawn,16,16,dl
   ; sub                      Currcol,6
                                        jmp                     far ptr                      MyExit
   KingDraw:                            
                                        mov                     cx, Currcol
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx, Currrow
                                        mov                     startRow,cx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16

                                 
                                        lea                     bx,king
                                        mov                     piece,bx
                                 
                                
                                        call                    far ptr Draw
   ; Draw                     Currrow,Currcol,king,16,16,dl
   ; sub                      Currcol,6
                                        jmp                     far ptr                      MyExit
   BishopDraw:                          
                                        mov                     cx, Currcol
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx, Currrow
                                        mov                     startRow,cx
                                        mov                     pieceWidth,17
                                        mov                     pieceHeight,16

                                 
                                        lea                     bx,Bishop
                                        mov                     piece,bx
                                 
                                
                                        call                    far ptr Draw
   ; Draw                     Currrow,Currcol,Bishop,17,16,dl
   ; sub                      Currcol,6
                                        jmp                     far ptr                      MyExit
   RookDraw:                            
                                        mov                     cx, Currcol
                                        mov                     startCol,cx
                                        add                     startCol,6
                                        mov                     dl,check_color
                                        mov                     dh,0
                                        mov                     pieceColor,dx
                                        mov                     cx, Currrow
                                        mov                     startRow,cx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16

                                 
                                        lea                     bx,rook
                                        mov                     piece,bx
                                 
                                
                                        call                    far ptr Draw
   ; Draw                     Currrow,Currcol,rook,16,16,dl
   ; sub                      Currcol,6
                                        jmp                     far ptr                      MyExit
   MyExit:                              
                                        ret
DrawOriginalCellColor endp
   ;responsible for dehighlighting the drid after a movement from team1
Dehighlight_Grid proc far
                                        mov                     cell_number,1
                                        mov                     di,offset highlight_row1
                                        mov                     cell_add,di
   Dehighlight_Grid_loop:                                                                                                       ;change the label name
                                        mov                     di,cell_add
                                        mov                     al,'r'
                                        cmp                     [di],al
                                 
   ;not highlited Do Nothing
                                        jne                     Dehighlight_Grid_exit
   Dehighlight_Grid_dehighlight:        
                                        call                    far ptr                     Get_Cell_Points
                                        dec                     rowgrid
                                        dec                     colgrid

                                        mov                     ax,0
                                        mov                     operand,24
                                        mov                     dl,operand
                                        mov                     al,rowgrid
                                        mul                     dl
                                        mov                     bx,ax

                                        mov                     ax,0
                                        mov                     operand,3
                                        mov                     dl,operand
                                        mov                     al,colgrid
                                        mul                     dl
                                        mov                     cx,ax                                                           ;Sure OV will not happen
                         
                                        mov                     bp, offset grid_row1
                                        add                     bp,bx
                                        add                     bp,cx
                                        mov                     si,bp
                                        call                    far ptr                     DrawOriginalCellColor
                                        mov                     al,'f'
                                        mov                     di,cell_add
                                        mov                     [di],al
   Dehighlight_Grid_exit:                                                                                                       ;change lable name (Yousef)
                                        inc                     cell_number
                                        inc                     di
                                        mov                     cell_add,di
                                        cmp                     cell_number,65
                                        jnz                     Dehighlight_Grid_loop
                                        ret
Dehighlight_Grid endp
   ;responsible for dehighlighting the drid after a movement from team2
Dehighlight_Grid_team2 proc far
                                        mov                     cell_number,1
                                        mov                     di,offset highlight_row1
                                        mov                     cell_add,di
   t2Dehighlight_Grid_loop:                                                                                                     ;change the label name
                                        mov                     di,cell_add
                                        mov                     al,'p'
                                        cmp                     [di],al
                                 
   ;not highlited Do Nothing
                                        jne                     t2Dehighlight_Grid_exit
   t2Dehighlight_Grid_dehighlight:      
                                        call                    far ptr                     Get_Cell_Points
                                        dec                     rowgrid
                                        dec                     colgrid

                                        mov                     ax,0
                                        mov                     operand,24
                                        mov                     dl,operand
                                        mov                     al,rowgrid
                                        mul                     dl
                                        mov                     bx,ax

                                        mov                     ax,0
                                        mov                     operand,3
                                        mov                     dl,operand
                                        mov                     al,colgrid
                                        mul                     dl
                                        mov                     cx,ax                                                           ;Sure OV will not happen
                         
                                        mov                     bp, offset grid_row1
                                        add                     bp,bx
                                        add                     bp,cx
                                        mov                     si,bp
                                        call                    far ptr                     DrawOriginalCellColor
                                        mov                     al,'f'
                                        mov                     di,cell_add
                                        mov                     [di],al
   t2Dehighlight_Grid_exit:                                                                                                     ;change lable name (Yousef)
                                        inc                     cell_number
                                        inc                     di
                                        mov                     cell_add,di
                                        cmp                     cell_number,65
                                        jnz                     t2Dehighlight_Grid_loop
                                        ret
Dehighlight_Grid_team2 endp
   ; responsible for moving a piece after determine it for team2
move_piecet2 proc far
                    
                                        mov                     al,goto_row_gridTeam2
                                        dec                     al
                                        mov                     bl,8
                                        mul                     bl
                                        mov                     bl,goto_col_gridTeam2
                                        mov                     bh,0
                                        dec                     bl
                                        add                     ax,bx
                                        mov                     di ,offset highlight_row1
                                        add                     di,ax
                                        mov                     cl,[di]
                                        mov                     al,'p'
                                        cmp                     cl,al
                                        jne                     breakpoint111
                                        mov                     al,'f'
                                        mov                     [di],al
                                        mov                     al,selected_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax


                                        mov                     al,selected_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     di,ax
                                        add                     di,cx

                                        mov                     cl,[di]                                                         ;;;;;piece

                                        mov                     ch,[di]+1                                                       ;;;team color
   ;  push                 cx
                                        mov                     bp,cx
                                        mov                     al,'0'
                                        mov                     [di],al
                                        inc                     di
                                        mov                     al,'0'
                                        mov                     [di],al
                                     
                                        jmp                     breakpoint18
             
   breakpoint111:                       jmp                     far ptr breakpoint22
   breakpoint18:                        
                                        mov                     ax,selected_colTeam2
                                        mov                     column,ax
                                        mov                     bx, selected_rowTeam2
                                        mov                     row,bx
                                        mov                     ax,selected_colTeam2
                                        mov                     current_colTeam2,ax
                                        mov                     ax,selected_rowTeam2
                                        mov                     current_rowTeam2,ax
                                        mov                     al,selected_col_gridTeam2
                                        mov                     current_col_gridTeam2,al
                                        mov                     al,selected_row_gridTeam2
                                        mov                     current_row_gridTeam2,al
                                        mov                     al,0
                                        call                    far ptr HIGHLIGHTSelectedTeam2

                             
                                        mov                     al,goto_col_gridTeam2
                                        dec                     al
                                        mov                     bl,3
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,goto_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,24
                                        mul                     bl
                                        add                     ax,offset grid_row1
                                        mov                     si,ax
                                        add                     si,cx
                                        mov                     al,[si]+1
                                        call                    far ptr print_removed_team2
   ;  pop                  cx
                                        mov                     cx,bp
                                        jmp                     breakpoint19
   breakpoint22:                        jmp                     far ptr exit12
   breakpoint19:                        
                                        mov                     al,'k'
                                        cmp                     [si],al
                                        jne                     con_con11
                                        mov                     al,[si]+1
                                        mov                     game_over_flag_team,al
   con_con11:                           
                                        mov                     [si],cl
                                        mov                     [si]+1,ch
                                        mov                     ax,goto_colTeam2
                                        mov                     column,ax
                                        mov                     ax, goto_rowTeam2
                                        mov                     row,ax
                                        mov                     ax,goto_colTeam2
                                        mov                     current_colTeam2,ax
                                        mov                     ax,goto_rowTeam2
                                        mov                     current_rowTeam2,ax
                                        mov                     al,goto_col_gridTeam2
                                        mov                     current_col_gridTeam2,al
                                        mov                     al,goto_row_gridTeam2
                                        mov                     current_row_gridTeam2,al

                                        mov                     ax,goto_colTeam2
                                        mov                     column,ax
                                        mov                     ax, goto_rowTeam2
                                        mov                     row,ax
                                        mov                     al,1
                                        call                    far ptr HIGHLIGHTSelectedTeam2


                                        mov                     ah,2CH
                                        INT                     21h
                                    
                                        mov                     hrs,ch
                                        mov                     min,cl
                                        mov                     sec,dh
                                        mov                     ebx ,3600
                                        mov                     eax,0
                                        mov                     al,hrs
                                        mul                     ebx
                                        mov                     ecx,eax
                                        mov                     ebx ,60
                                        mov                     eax,0
                                        mov                     al,min
                                        mul                     ebx
                                        add                     ecx,eax
                                        mov                     edx,0
                                        mov                     dl,sec
                                        add                     ecx,edx
                                        mov                     edx,ecx

                                  
                                        mov                     al,goto_col_gridTeam2
                                        dec                     al
                                        mov                     bl,4
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,goto_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,32
                                        mul                     bl
                                        add                     ax,offset time1
                                        mov                     si,ax
                                        add                     si,cx
                                        mov                     [si],edx

   exit12:                              
                                        mov                     selected_colTeam2,-1
                                        mov                     selected_rowTeam2,-1
                                        mov                     selected_row_gridTeam2,-1
                                        mov                     selected_col_gridTeam2,-1
                                        call                    far ptr  Dehighlight_Grid_team2
              
                                        ret
move_piecet2 endp




   ;responsible for printing the message of game over notification
game_over_notification proc far

                                        mov                     ax,0600h
                                        mov                     bh,07
                                        mov                     cx,51820
                                        mov                     dx,184FH
                                        int                     10h


                                        mov                     ah,2
                                        mov                     dx,51825
                                        mov                     bh,0
                                        int                     10h
                                        mov                     al,'1'
                                        cmp                     game_over_flag_team,al
                                        je                      eee1
                                        mov                     ah, 9
                                        mov                     dx, offset msg2
                                        int                     21h
                                        jmp                     far ptr exs
   eee1:                                
                                        mov                     ah, 9
                                        mov                     dx, offset msg1
                                        int                     21h
   exs:                                 

   game_over_f4_check:                  
                                        mov                     ah,01H
                                        int                     16h
                                        jz                      game_over_f4_check
                                        mov                     ah,00
                                        int                     16h
                                        cmp                     ah,3eh
                                        je                      game_over_f4_exit
                                        jmp                     far ptr                  game_over_f4_check
   game_over_f4_exit:                   
                             
                                        call                    far ptr end_game_F4

                                        ret
game_over_notification endp
   ;responsible for printing the message of checkmate of team2
print_checkmate_team2 proc far
                                        mov                     ah,2
                                        mov                     dx,51825
                                        mov                     bh,0
                                        int                     10h

                                        mov                     ah, 9
                                        mov                     dx, offset msg_checkmate1
                                        int                     21h
                                        ret
print_checkmate_team2 endp
   ;responsible for printing the message of checkmate of team1
print_checkmate proc far
                                        mov                     ah,2
                                        mov                     dx,51825
                                        mov                     bh,0
                                        int                     10h

                                        mov                     ah, 9
                                        mov                     dx, offset msg_checkmate2
                                        int                     21h
                                        ret
print_checkmate endp
   ;responsible for printing the message of removed piece of team1
print_removed_team1 proc far

                                        mov                     ax,0600h
                                        mov                     bh,07
                                        mov                     cx,51827
                                        mov                     dx,184FH
                                        int                     10h


                                        mov                     ah,2
                                        mov                     dx,51825
                                        mov                     bh,0
                                        int                     10h

                                        mov                     al,[si]
                                        cmp                     al,'p'
                                        jne                     bb1b
                                        mov                     ah, 9
                                        mov                     dx, offset msgpawn2
                                        int                     21h
                                        jmp                     far ptr eexxiitt
   bb1b:                                
                                        cmp                     al,'b'
                                        jne                     qq1q
                                        mov                     ah, 9
                                        mov                     dx, offset msgbishop2
                                        int                     21h
                                        jmp                     far ptr eexxiitt
   qq1q:                                
                                        cmp                     al,'q'
                                        jne                     rr1r
                                        mov                     ah, 9
                                        mov                     dx, offset msgqueen2
                                        int                     21h
                                        jmp                     far ptr eexxiitt
   rr1r:                                
                                        cmp                     al,'r'
                                        jne                     hh1h
                                        mov                     ah, 9
                                        mov                     dx, offset msgrook2
                                        int                     21h
                                        jmp                     far ptr eexxiitt
   hh1h:                                
                                        cmp                     al,'h'
                                        jne                     kk1k
                                        mov                     ah, 9
                                        mov                     dx, offset msgknight2
                                        int                     21h
                                        jmp                     far ptr eexxiitt
   kk1k:                                
                                        cmp                     al,'k'
                                        jne                     eexxiitt
                                        mov                     ah, 9
                                        mov                     dx, offset msgking2
                                        int                     21h
                                        jmp                     far ptr eexxiitt
   eexxiitt:                            


                                        ret
print_removed_team1 endp
   ;responsible for printing the message of removed piece of team2
print_removed_team2 proc far

                                        mov                     ax,0600h
                                        mov                     bh,07
                                        mov                     cx,51827
                                        mov                     dx,184FH
                                        int                     10h


                                        mov                     ah,2
                                        mov                     dx,51825
                                        mov                     bh,0
                                        int                     10h

                                        mov                     al,[si]
                                        cmp                     al,'p'
                                        jne                     bb1b1
                                        mov                     ah, 9
                                        mov                     dx, offset msgpawn1
                                        int                     21h
                                        jmp                     far ptr eexxiitt1
   bb1b1:                               
                                        cmp                     al,'b'
                                        jne                     qq1q1
                                        mov                     ah, 9
                                        mov                     dx, offset msgbishop1
                                        int                     21h
                                        jmp                     far ptr eexxiitt1
   qq1q1:                               
                                        cmp                     al,'q'
                                        jne                     rr1r1
                                        mov                     ah, 9
                                        mov                     dx, offset msgqueen1
                                        int                     21h
                                        jmp                     far ptr eexxiitt1
   rr1r1:                               
                                        cmp                     al,'r'
                                        jne                     hh1h1
                                        mov                     ah, 9
                                        mov                     dx, offset msgrook1
                                        int                     21h
                                        jmp                     far ptr eexxiitt1
   hh1h1:                               
                                        cmp                     al,'h'
                                        jne                     kk1k1
                                        mov                     ah, 9
                                        mov                     dx, offset msgknight1
                                        int                     21h
                                        jmp                     far ptr eexxiitt1
   kk1k1:                               
                                        cmp                     al,'k'
                                        jne                     eexxiitt1
                                        mov                     ah, 9
                                        mov                     dx, offset msgking1
                                        int                     21h
                                        jmp                     far ptr eexxiitt1
   eexxiitt1:                           


                                        ret
print_removed_team2 endp
   ; responsible for time calculations for team1
calctime proc far
                                        mov                     timeflag,"t"
                                        mov                     ah,2CH
                                        INT                     21h
                              
                                        mov                     hrs,ch
                                        mov                     min,cl
                                        mov                     sec,dh
                                        mov                     ebx ,3600
                                        mov                     eax,0
                                        mov                     al,hrs
                                        mul                     ebx
                                        mov                     ecx,eax
                                        mov                     ebx ,60
                                        mov                     eax,0
                                        mov                     al,min
                                        mul                     ebx
                                        add                     ecx,eax
                                        mov                     edx,0
                                        mov                     dl,sec
                                        add                     ecx,edx
                                        mov                     edx,ecx
                                        mov                     al,selected_col_grid
                                        dec                     al
                                        mov                     bl,4
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_grid
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,32
                                        mul                     bl
                                        add                     ax,offset time1
                                        add                     ax,cx
                                        mov                     si,ax
                                        mov                     ebx,[si]
                                        sub                     edx,ebx
                                        cmp                     edx ,3
                                        jae                     move_piece_exit111111


                                        mov                     timeflag,"f"
                                        
   move_piece_exit111111:               
                                     


                                        ret
calctime endp
   ; responsible for time calculations for team2
calctimeTeam2 proc far
                                        mov                     timeflag,"t"
                                        mov                     ah,2CH
                                        INT                     21h
                              
                                        mov                     hrs,ch
                                        mov                     min,cl
                                        mov                     sec,dh
                                        mov                     ebx ,3600
                                        mov                     eax,0
                                        mov                     al,hrs
                                        mul                     ebx
                                        mov                     ecx,eax
                                        mov                     ebx ,60
                                        mov                     eax,0
                                        mov                     al,min
                                        mul                     ebx
                                        add                     ecx,eax
                                        mov                     edx,0
                                        mov                     dl,sec
                                        add                     ecx,edx
                                        mov                     edx,ecx
                                        mov                     al,selected_col_gridTeam2
                                        dec                     al
                                        mov                     bl,4
                                        mul                     bl
                                        mov                     cx,ax
                                        mov                     al,selected_row_gridTeam2
                                        dec                     al
                                        mov                     ah,0
                                        mov                     bl,32
                                        mul                     bl
                                        add                     ax,offset time1
                                        add                     ax,cx
                                        mov                     si,ax
                                        mov                     ebx,[si]
                                        sub                     edx,ebx
                                        cmp                     edx ,3
                                        jae                     move_piece_exit22222


                                        mov                     timeflag,"f"
                                        
   move_piece_exit22222:                
                                     


                                        ret
calctimeTeam2 endp
   ; responsible for time calculations for the whole game
game_time proc far

                                        mov                     ah,2CH
                                        INT                     21h
                                        mov                     current_hour,ch
                                        mov                     current_minute,cl
                                        mov                     current_second,dh
                                        mov                     ebx ,3600
                                        mov                     eax,0
                                        mov                     al,current_hour
                                        mul                     ebx
                                        mov                     ecx,eax
                                        mov                     ebx ,60
                                        mov                     eax,0
                                        mov                     al,current_minute
                                        mul                     ebx
                                        add                     ecx,eax
                                        mov                     edx,0
                                        mov                     dl,current_second
                                        add                     ecx,edx

                                        sub                     ecx,start_time
                               
                                        add                     display_second,ecx
                                        cmp                     display_second,59
                                        jbe                     minutess
                                        sub                     display_second,60
                                        inc                     display_minute

   minutess:                            
                                        cmp                     display_minute,59
                                        jbe                     hourss
                                        sub                     display_minute,60
                                        inc                     display_hour
   hourss:                              
                                        mov                     ch,current_hour
                                        mov                     cl,current_minute
                                        mov                     dh,current_second

                                        mov                     start_hour,ch
                                        mov                     start_minute,cl
                                        mov                     start_second,dh
                                        mov                     ebx ,3600
                                        mov                     eax,0
                                        mov                     al,start_hour
                                        mul                     ebx
                                        mov                     start_time,eax
                                        mov                     ebx ,60
                                        mov                     eax,0
                                        mov                     al,start_minute
                                        mul                     ebx
                                        add                     start_time,eax
                                        mov                     edx,0
                                        mov                     dl,start_second
                                        add                     start_time,edx


                                        mov                     ah,2
                                        mov                     dx,51816
                                        mov                     bh,0
                                        int                     10h
                                        mov                     eax,display_hour
                                        call                    far ptr DISPLAYNUMBER

                                        mov                     ah,2
                                        mov                     dx,51818
                                        mov                     bh,0
                                        int                     10h
                                        mov                     dl,':'
                                        MOV                     AH,02H
                                        INT                     21H
                                        mov                     ah,2
                                        mov                     dx,51819
                                        mov                     bh,0
                                        int                     10h
                                        mov                     eax,display_minute
                                        call                    far ptr DISPLAYNUMBER
                                        mov                     ah,2
                                        mov                     dx,51821
                                        mov                     bh,0
                                        int                     10h
                                        mov                     dl,':'
                                        MOV                     AH,02H
                                        INT                     21H

                                        mov                     ah,2
                                        mov                     dx,51822
                                        mov                     bh,0
                                        int                     10h
                                        mov                     eax,display_second
                                        call                    far ptr DISPLAYNUMBER

                                        ret
game_time endp
   ; responsible for displaying time number while playing
DISPLAYNUMBER proc far
                                        MOV                     bl,10
                                        DIV                     bl
                                        MOV                     DL,AL
                                        PUSH                    AX
                                        ADD                     DL,30H
                                        MOV                     AH,02H
                                        INT                     21H
                                        POP                     AX
                                        MOV                     AL,AH
                                        MOV                     AH,0
                                        MOV                     DL,AL
                                        ADD                     DL,30H
                                        MOV                     AH,02H
                                        INT                     21H
                                        ret
DISPLAYNUMBER endp
   ; responsible for ending game when any player press F4
end_game_F4 proc far
               
                                        ClearScreen
   ;set the curser
                                        mov                     bh,0
                                        MoveCursor              05h 1ah
   ;display home menu
                                        PrintMsg                mf1
   ;set the cursor
                                        mov                     bh,0
                                        MoveCursor              07h 1ah
                                        PrintMsg                mf2
   ;set the curser
                                        mov                     bh,0
                                        MoveCursor              09h 1ah
                                        PrintMsg                mesc
   ;draw the line
                                        mov                     bh,0
                                        MoveCursor              15h 00h

                                        mov                     cx,80
   F4myloop:                            
                                        PrintChr                '-'
                                        dec                     cx
                                        jnz                     F4myloop
   F4waitForKey:                        mov                     ah,0
                                        GetKeyPressedWait
                                        cmp                     ah,59
                                        jz                      F4_F1Key
                                        cmp                     ah,60
                                        jz                      F4_F2Key
                                        cmp                     ah,1
                                        jz                      F4_ESCKey
                                        jnz                     F4waitForKey
               
   F4_F1Key:                            
                                        ClearScreen
                                        call                    far ptr reinitialize_data_segmant
   ;  will go to the chat module of the game
                                        jmp                     rest
   F4_F2Key:                            
                                        ClearScreen
                                        call                    far ptr reinitialize_data_segmant
   ;  start the logic of the game
                                        jmp                     rest
   F4_ESCKey:                           
                                        ClearScreen
   ; this is how to print or use the name of the user
   ; PrintMsg name1+2
                                        MoveCursor              12,0
                                        PrintMsg                endProgram
                                        CloseProgram
                                        ret
end_game_F4 endp
   ; responsible for reinitializing data segemnt to start game agin after pressing press F4 then F1
reinitialize_data_segmant proc far
                                        mov                     start_hour , 0
                                        mov                     start_minute  , 0
                                        mov                     start_second , 0
                                        mov                     current_hour , 0
                                        mov                     current_minute  , 0
                                        mov                     current_second , 0
                                        mov                     display_hour , 0
                                        mov                     display_minute  , 0
                                        mov                     display_second , 0
                                        mov                     start_time , 0
                                        mov                     game_over_flag_team,-1
                                        mov                     current_row,0                                                   ;;;;pixel
                                        mov                     current_col,90                                                  ;;;;pixel
                                        mov                     current_row_grid,1
                                        mov                     current_col_grid,4
                                        mov                     selected_row,-1                                                 ;;;;pixel
                                        mov                     selected_col,-1                                                 ;;;;pixel
                                        mov                     selected_row_grid,-1
                                        mov                     selected_col_grid,-1


                                        mov                     current_rowTeam2,161                                            ;;;;pixel
                                        mov                     current_colTeam2,90                                             ;;;;pixel
                                        mov                     current_row_gridTeam2,8
                                        mov                     current_col_gridTeam2,4
                                        mov                     selected_rowTeam2,-1                                            ;;;;pixel
                                        mov                     selected_colTeam2,-1                                            ;;;;pixel
                                        mov                     selected_row_gridTeam2,-1
                                        mov                     selected_col_gridTeam2,-1
 
                                        mov                     goto_row,-1                                                     ;;;;pixel
                                        mov                     goto_col,-1                                                     ;;;;pixel
                                        mov                     goto_row_grid,-1
                                        mov                     goto_col_grid,-1
 
                                        mov                     goto_rowTeam2,-1                                                ;;;;pixel
                                        mov                     goto_colTeam2,-1                                                ;;;;pixel
                                        mov                     goto_row_gridTeam2,-1
                                        mov                     goto_col_gridTeam2,-1


                                        mov                     highlight_row,-1                                                ;;;;pixel
                                        mov                     highlight_col,-1                                                ;;;;pixel
                                        mov                     highlight_row_grid,-1
                                        mov                     highlight_col_grid,-1

                                        mov                     highlight_rowTeam2,-1                                           ;;;;pixel
                                        mov                     highlight_colTeam2,-1                                           ;;;;pixel
                                        mov                     highlight_row_gridTeam2,-1
                                        mov                     highlight_col_gridTeam2,-1

                                        mov                     di,offset highlight_row1
                                        mov                     cx,64
   highlight_loop:                      
                                        mov                     al,'f'
                                        mov                     [di],al
                                        inc                     di
                                        dec                     cx
                                        jnz                     highlight_loop


                                        mov                     di,offset time1
                                        mov                     cx,256
   time_loop:                           
                                        mov                     al,0
                                        mov                     [di],al
                                        inc                     di
                                        dec                     cx
                                        jnz                     time_loop

                                        mov                     di,offset grid_row1
                                        mov                     [di],byte ptr'r'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'h'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'k'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'q'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'h'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'r'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        mov                     di,offset grid_row2
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'1'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
   
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        mov                     di,offset grid_row3
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di], byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        mov                     di,offset grid_row4
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte  ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        mov                     di,offset grid_row5
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        mov                     di,offset grid_row6
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'0'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        mov                     di,offset grid_row7
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'p'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        mov                     di,offset grid_row8
                                        mov                     [di],byte ptr'r'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'h'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'k'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'q'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr 'b'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
                                        mov                     [di],byte ptr'h'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'b'
                                        inc                     di
                                        mov                     [di],byte ptr'r'
                                        inc                     di
                                        mov                     [di],byte ptr'2'
                                        inc                     di
                                        mov                     [di],byte ptr'w'
                                        inc                     di
   

                                        ret
reinitialize_data_segmant endp
   ; responsible for checking if there amy moving options for selected player1
highlighted_cells_existing_team1 proc far
                                        mov                     di,offset highlight_row1
                                        mov                     cx,64
   loop_red:                            
                                        mov                     al,'r'
                                        cmp                     [di],al
                                        je                      red_exit
                                        inc                     di
                                        dec                     cx
                                        jnz                     loop_red
   red_exit:                            
                                        ret
highlighted_cells_existing_team1 endp
   ; responsible for checking if there amy moving options for selected player2
team2_highlighted_cells_existing proc far

                                        mov                     di,offset highlight_row1
                                        mov                     cx,64

   loop_purpel:                         
                                        mov                     al,'p'
                                        cmp                     [di],al
                                        je                      purel_exit
                                        inc                     di
                                        dec                     cx
                                        jnz                     loop_purpel

   purel_exit:                          

                                        ret
team2_highlighted_cells_existing endp
   ; responsible for all the game logic
main proc far
                                        mov                     ax,@data
                                        mov                     ds,ax
                                     
   ; the start of the game menu
                                        ClearScreen
   ;set curser 1st column and first row
                                        MoveCursor              01h 01h
   ;display welcome message
                                        PrintMsg                welcome
   ;set curser
                                        MoveCursor              02h 02h
   ;read name from user
                                        ReadMsg                 name1
   ;display enter
                                        MoveCursor              20 2
                                        PrintMsg                menter
   ;wait for enter
   CHECK:                               mov                     ah,1
                                        int                     16h
                                        JZ                      CHECK
                                        mov                     ah,0
                                        int                     16h
                                        JZ                      CHECK
                                        cmp                     al,13
                                        jnz                     CHECK
   ;clear the screen
                                        ClearScreen
   ;set the curser
                                        mov                     bh,0
                                        MoveCursor              05h 1ah
   ;display home menu
                                        PrintMsg                mf1
   ;set the cursor
                                        mov                     bh,0
                                        MoveCursor              07h 1ah
                                        PrintMsg                mf2
   ;set the curser
                                        mov                     bh,0
                                        MoveCursor              09h 1ah
                                        PrintMsg                mesc
   ;draw the line
                                        mov                     bh,0
                                        MoveCursor              15h 00h

                                        mov                     cx,80
   myloop:                              
                                        PrintChr                '-'
                                        dec                     cx
                                        jnz                     myloop
   waitForKey:                          mov                     ah,0
                                        GetKeyPressedWait
                                        cmp                     ah,59
                                        jz                      F1Key
                                        cmp                     ah,60
                                        jz                      F2Key
                                        cmp                     ah,1
                                        jz                      ESCKey
                                        jnz                     waitForKey
               
   F1Key:                               
                                        ClearScreen
   ;  will go to the chat module of the game
                                        jmp                     rest
   F2Key:                               
                                        ClearScreen
   ;  start the logic of the game
                                        jmp                     rest
   ESCKey:                              
                                        ClearScreen
   ; this is how to print or use the name of the user
   ; PrintMsg name1+2
                                        MoveCursor              12,0
                                        PrintMsg                endProgram
                                        CloseProgram
   rest:                                
   ;  the start of the game logic
                                    
                                        mov                     ax,@data
                                        mov                     ds,ax

                                        mov                     ah,2CH
                                        INT                     21h
                                        mov                     start_hour,ch
                                        mov                     start_minute,cl
                                        mov                     start_second,dh
                                        mov                     ebx ,3600
                                        mov                     eax,0
                                        mov                     al,start_hour
                                        mul                     ebx
                                        mov                     start_time,eax
                                        mov                     ebx ,60
                                        mov                     eax,0
                                        mov                     al,start_minute
                                        mul                     ebx
                                        add                     start_time,eax
                                        mov                     edx,0
                                        mov                     dl,start_second
                                        add                     start_time,edx

                                        ChgVideoMode
                                        mov                     ax,0A000H
                                        mov                     es,ax
                                        call                    far ptr DrawGrid
                                        call                    far ptr startpieces
                                        MY_HIGHLIGHT_Rec        00,0090
                                        mov                     startRow,0
                                        mov                     startCol,96
                                        lea                     bx,king
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,3
                                        call                    far ptr Draw
                                        MY_HIGHLIGHT_Rec_level2 161,0090
                                        mov                     startRow,161
                                        mov                     startCol,96
                                        lea                     bx,king
                                        mov                     piece,bx
                                        mov                     pieceWidth,16
                                        mov                     pieceHeight,16
                                        mov                     pieceColor,0
                                        call                    far ptr Draw
                                     
                                        call                    far ptr  mov_until_select
                                        mov                     ah,4ch
                                        int                     21h
main endp
end main

