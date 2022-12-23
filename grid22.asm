.286



.model small
.stack 64
.data
   row                dw ?
   column             dw ?
   team1_pos          dw 0,0 ,0,30,00,60,00,90,0,120,0,150,0,180,0,210
                      dw 23,0,23,30,23,60 ,23,90,23,120,23,150,23,180,23,210
   team2_pos          dw 138,0,138,30,138,60,138,90,138,120,138,150,138,150,138,210
                      dw 161,0,161,30,161,60,161,90,161,120,161,150,161,180,161,210
   current_row        dw 0                                                                                                    ;;;;pixel
   current_col        dw 90                                                                                                   ;;;;pixel
   current_row_grid   db 1
   current_col_grid   db 4
   selected_row       dw -1                                                                                                   ;;;;pixel
   selected_col       dw -1                                                                                                   ;;;;pixel
   selected_row_grid  db -1
   selected_col_grid  db -1

   goto_row           dw -1                                                                                                   ;;;;pixel
   goto_col           dw -1                                                                                                   ;;;;pixel
   goto_row_grid      db -1
   goto_col_grid      db -1

   highlight_row      dw -1                                                                                                   ;;;;pixel
   highlight_col      dw -1                                                                                                   ;;;;pixel
   highlight_row_grid db -1
   highlight_col_grid db -1

   cell               dw ?
   check_color        db 3

   RowVar             dw 0
   ; PieceHeight        dw 0
   color              db 0

   highlight_flag     db 't'                                                                                                  ;;;;;t--->highlight   f->stop there is piece feom your team
   team               db 0

   startRow           dw 0
   startCol           dw 0
   piece              dw 0
   pieceWidth         dw 0
   pieceHeight        dw 0
   pieceColor         dw 0
 
    clicked           db 0
   ; RowVar             dw 0
   ; PieceHeight dw 0
   ; color       dw       0
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

   operand            db 0
   rowgrid            db 0
   colgrid            db 0
   Currrow            dw 0
   Currcol            dw 0


   ;;;;;h->horse  q->queen   p->pawn   k->king   b->Bishop   r->rook   1->green->team1   2->black->team2  00->no_piece w-b--->white-black
   ;;;;rook--horse--Bishop--king---queen--Bishop--horse--rook      8pawn
   ; current_pos dw 00,90
   ; (row*8)+col

.code


ChgVideoMode MACRO
                mov ah,0
                mov al,13h
                int 10h
ENDM
MYWhiteRec MACRO startrow,startcol
              local square
              local right
              mov   cx,startcol   ;Column //x
              mov   dx,startrow   ;Row //
              mov   al,0fh        ;Pixel color
              mov   ah,0ch        ;Draw Pixel Command
              mov   si,startrow
   square:    
   right:     int   10h
              inc   cx
              mov   bx,0
              add   bx,30
              add   bx,startcol
              cmp   cx,bx
              jnz   right         ; this will draw a line of 25 length
              inc   si
              mov   cx,startcol   ;Column //x
              inc   dx            ;Row //y
              mov   bx,0
              add   bx,23
              add   bx,startrow
              cmp   si,bx
              jnz   square
ENDM
MYBrownRec MACRO startrow,startcol
              local square
              local right
              mov   cx,startcol   ;Column //x
              mov   dx,startrow   ;Row //y
              mov   al,06h        ;Pixel color
              mov   ah,0ch        ;Draw Pixel Command
              mov   si,startrow
   square:    
   right:     int   10h
              inc   cx
              mov   bx,0
              add   bx,30
              add   bx,startcol
              cmp   cx,bx
              jnz   right         ; this will draw a line of 25 length
              inc   si
              mov   cx,startcol   ;Column //x
              inc   dx            ;Row //y
              mov   bx,0
              add   bx,23
              add   bx,startrow
              cmp   si,bx
              jnz   square
ENDM
MY_HIGHLIGHT_Rec MACRO startrow,startcol
                    local square
                    local right
                    mov   cx,startcol   ;Column //x
                    mov   dx,startrow   ;Row //
                    mov   al,07h        ;Pixel color
                    mov   ah,0ch        ;Draw Pixel Command
                    mov   si,startrow
   square:          
   right:           int   10h
                    inc   cx
                    mov   bx,0
                    add   bx,30
                    add   bx,startcol
                    cmp   cx,bx
                    jnz   right         ; this will draw a line of 25 length
                    inc   si
                    mov   cx,startcol   ;Column //x
                    inc   dx            ;Row //y
                    mov   bx,0
                    add   bx,23
                    add   bx,startrow
                    cmp   si,bx
                    jnz   square
ENDM
MY_red_HIGHLIGHT_Rec MACRO startrow,startcol
                        local square
                        local right
                        mov   cx,startcol   ;Column //x
                        mov   dx,startrow   ;Row //
                        mov   al,0ch        ;Pixel color
                        mov   ah,0ch        ;Draw Pixel Command
                        mov   si,startrow
   square:              
   right:               int   10h
                        inc   cx
                        mov   bx,0
                        add   bx,30
                        add   bx,startcol
                        cmp   cx,bx
                        jnz   right         ; this will draw a line of 25 length
                        inc   si
                        mov   cx,startcol   ;Column //x
                        inc   dx            ;Row //y
                        mov   bx,0
                        add   bx,23
                        add   bx,startrow
                        cmp   si,bx
                        jnz   square
endm




DrawGrid proc far
            
                                mov                  di,0
                                mov                  RowVar,0
   DrawGrid_col:                
   DrawGrid_row:                
                                MYWhiteRec           RowVar, di
                                add                  di,30
                                MYBrownRec           RowVar,di
                                add                  di,30
                                cmp                  di,240
                                jnz                  DrawGrid_row
                                mov                  di,0
                                add                  RowVar,46
                                cmp                  RowVar,184
                                jnz                  DrawGrid_col
                                mov                  di,0
                                mov                  rowvar,23
   DrawGrid_col1:               
   DrawGrid_row1:               
                                MYBrownRec           RowVar, di
                                add                  di,30
                                MYWhiteRec           RowVar,di
                                add                  di,30
                                cmp                  di,240
                                jnz                  DrawGrid_row1
                                mov                  di,0
                                add                  RowVar,46
                                cmp                  RowVar,207
                                jnz                  DrawGrid_col1
                                ret
DrawGrid endp

Draw proc far
                                mov                  ax,0A000H
                                mov                  es,ax
                                mov                  si, piece
                                mov                  ax,startRow
                                mov                  bx,320
                                mul                  bx
                                add                  ax,startCol
                                mov                  di,ax
                                mov                  cx,pieceWidth
   ;  mov   PieceHeight,height
   ;  mov   color,c
   Draw_drawPiece:              
                                call                 far ptr   DrawRow
                                add                  di,320
                                dec                  cx
                                jnz                  Draw_drawPiece
                                ret
Draw ENDP
DrawRow proc far
                                push                 di
                                push                 cx
                                mov                  cx,pieceHeight
   DrawRow_draw1:               
                                mov                  al,[si]
                                cmp                  al,00H
                                je                   DrawRow_background
                                cmp                  al,02H
                                je                   DrawRow_background
                                mov                  dx,pieceColor
                                mov                  es:[di],dx
   DrawRow_background:          
                                inc                  di
                                inc                  si
                                dec                  cx
                                jnz                  DrawRow_draw1
                                pop                  cx
                                pop                  di
                                ret
DrawRow endp
startpieces proc far
   ; row,col,piece,width.height,color
                                mov                  startRow,0
                                mov                  startCol,96
                                lea                  bx,king
                                mov                  piece,bx
                                mov                  pieceWidth,16
                                mov                  pieceHeight,16
                                mov                  pieceColor,3
                                call                 far ptr Draw


                                mov                  startRow,161
                                mov                  startCol,96
                                lea                  bx,king
                                mov                  piece,bx
                                mov                  pieceWidth,16
                                mov                  pieceHeight,16
                                mov                  pieceColor,0
                                call                 far ptr Draw

                      
                                mov                  startRow,0
                                mov                  startCol,126
                                lea                  bx,queen
                                mov                  piece,bx
                                mov                  pieceWidth,13
                                mov                  pieceHeight,16
                                mov                  pieceColor,3
                                call                 far ptr Draw
   ;  Draw         0,96,king,16,16,3
   ;  Draw         161,96,king,16,16,0
   ;  Draw         0,126,queen,13,16,3
   ;  Draw         161,126,queen,13,16,0

                      
                                mov                  startRow,161
                                mov                  startCol,126
                                lea                  bx,queen
                                mov                  piece,bx
                                mov                  pieceWidth,13
                                mov                  pieceHeight,16
                                mov                  pieceColor,0
                                call                 far ptr Draw

                                mov                  cx,6
   startpieces_label:           
                                push                 cx


   ;  Draw         23,cx,pawn,16,16,3
                                mov                  startRow,23
                                mov                  startCol,cx
                                lea                  bx,pawn
                                mov                  piece,bx
                                mov                  pieceWidth,16
                                mov                  pieceHeight,16
                                mov                  pieceColor,3
                                call                 far ptr Draw


                                pop                  cx
                                push                 cx


   ;  Draw         138,cx,pawn,16,16,0
                                mov                  startRow,138
                                mov                  startCol,cx
                                lea                  bx,pawn
                                mov                  piece,bx
                                mov                  pieceWidth,16
                                mov                  pieceHeight,16
                                mov                  pieceColor,0
                                call                 far ptr Draw

                                pop                  cx
                                add                  cx,30
                                cmp                  cx,240+6
                                jne                  far ptr       startpieces_label
                      
   ;  Draw         0,66,Bishop,17,16,3
                                mov                  startRow,0
                                mov                  startCol,66
                                lea                  bx,Bishop
                                mov                  piece,bx
                                mov                  pieceWidth,17
                                mov                  pieceHeight,16
                                mov                  pieceColor,3
                                call                 far ptr Draw

   ;  Draw         0,156,Bishop,17,16,3
                                mov                  startRow,0
                                mov                  startCol,156
                                lea                  bx,Bishop
                                mov                  piece,bx
                                mov                  pieceWidth,17
                                mov                  pieceHeight,16
                                mov                  pieceColor,3
                                call                 far ptr Draw
   ;  Draw         161,66,Bishop,17,16,0
                                mov                  startRow,161
                                mov                  startCol,66
                                lea                  bx,Bishop
                                mov                  piece,bx
                                mov                  pieceWidth,17
                                mov                  pieceHeight,16
                                mov                  pieceColor,0
                                call                 far ptr Draw
   ;  Draw         161,156,Bishop,17,16,0
                                mov                  startRow,161
                                mov                  startCol,156
                                lea                  bx,Bishop
                                mov                  piece,bx
                                mov                  pieceWidth,17
                                mov                  pieceHeight,16
                                mov                  pieceColor,0
                                call                 far ptr Draw
   ;  Draw         0,36,knight,20,20,3
                                mov                  startRow,0
                                mov                  startCol,36
                                lea                  bx,knight
                                mov                  piece,bx
                                mov                  pieceWidth,20
                                mov                  pieceHeight,20
                                mov                  pieceColor,3
                                call                 far ptr Draw
   ;  Draw         0,186,knight,20,20,3
                                mov                  startRow,0
                                mov                  startCol,186
                                lea                  bx,knight
                                mov                  piece,bx
                                mov                  pieceWidth,20
                                mov                  pieceHeight,20
                                mov                  pieceColor,3
                                call                 far ptr Draw
   ;  Draw         161,36,knight,20,20,0
                                mov                  startRow,161
                                mov                  startCol,36
                                lea                  bx,knight
                                mov                  piece,bx
                                mov                  pieceWidth,20
                                mov                  pieceHeight,20
                                mov                  pieceColor,0
                                call                 far ptr Draw
   ;  Draw         161,186,knight,20,20,0
                                mov                  startRow,161
                                mov                  startCol,186
                                lea                  bx,knight
                                mov                  piece,bx
                                mov                  pieceWidth,20
                                mov                  pieceHeight,20
                                mov                  pieceColor,0
                                call                 far ptr Draw
   ;  Draw         0,6,rook,16,16,3
                                mov                  startRow,0
                                mov                  startCol,6
                                lea                  bx,rook
                                mov                  piece,bx
                                mov                  pieceWidth,16
                                mov                  pieceHeight,16
                                mov                  pieceColor,3
                                call                 far ptr Draw
   ;  Draw         0,216,rook,16,16,3
                                mov                  startRow,0
                                mov                  startCol,216
                                lea                  bx,rook
                                mov                  piece,bx
                                mov                  pieceWidth,16
                                mov                  pieceHeight,16
                                mov                  pieceColor,3
                                call                 far ptr Draw
   ;  Draw         161,6,rook,16,16,0
                                mov                  startRow,161
                                mov                  startCol,6
                                lea                  bx,rook
                                mov                  piece,bx
                                mov                  pieceWidth,16
                                mov                  pieceHeight,16
                                mov                  pieceColor,0
                                call                 far ptr Draw
   ;  Draw         161,216,rook,16,16,0
                                mov                  startRow,161
                                mov                  startCol,216
                                lea                  bx,rook
                                mov                  piece,bx
                                mov                  pieceWidth,16
                                mov                  pieceHeight,16
                                mov                  pieceColor,0
                                call                 far ptr Draw
                                ret
startpieces endp

   ;;;;;; uncomment move_current_cell_or_select   //////   move_goto_cell_or_select
   ;;;;;;///////////////////////////HIGHLIGHT_selected;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;VIP



move_pawn proc far
             
                                mov                  al,selected_col_grid
                                dec                  al
                                mov                  bl,3
                                mul                  bl
                                mov                  cx,ax
                                mov                  al,selected_row_grid
                                dec                  al
                                mov                  ah,0
                                mov                  bl,24
                                mul                  bl
                                add                  ax,offset grid_row1
                                mov                  di,ax
                                add                  di,cx
                                inc                  di
                                mov                  al,[di]
                                mov                  ah,0
                                mov                  team,al
                                cmp                  al ,'1'
                                je                   move_pawn_team1
                                cmp                  al ,'2'
                                je                   move_pawn_team2
                                jmp far ptr                  move_pawn_exit

   move_pawn_team1:             
                                mov                  dl,1                                               ;;;;;;;;;row
                                mov                  dh,0                                               ;;;;;;;;;column
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bx,23
                                add                  highlight_row,bx
                                jmp far ptr                  move_pawn_change

   move_pawn_team2:             
                                mov                  dl,-1                                              ;;;;;;;;;row
                                mov                  dh,0                                               ;;;;;;;;;column
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bx,23
                                sub                  highlight_row,23
                                jmp far ptr                  move_pawn_change

   move_pawn_change:            
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                add                  highlight_row_grid,dl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
                                add                  highlight_col_grid,dh
                                call                 far ptr highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   move_pawn_exit
                                call                 far ptr                     set_highlighled_true
                                jmp far ptr                  move_pawn_exit
   move_pawn_exit:              
                                ret
move_pawn endp
move_bishop proc   far
                                mov                  al,selected_col_grid
                                dec                  al
                                mov                  bl,3
                                mul                  bl
                                mov                  cx,ax
                                mov                  al,selected_row_grid
                                dec                  al
                                mov                  ah,0
                                mov                  bl,24
                                mul                  bl
                                add                  ax,offset grid_row1
                                mov                  di,ax
                                add                  di,cx
                                inc                  di
                                mov                  al,[di]
                                mov                  team,al
                                cmp                  al ,'1'
                                je                   move_bishop_team1
                                cmp                  al ,'2'
                                je                   move_bishop_team2
                                jmp far ptr                  move_bishop_exit

   move_bishop_team1:           
   move_bishop_team2:           
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   move_bishop_compare1:        
                                add                  highlight_row,23
                                add                  highlight_col,30
                                cmp                  highlight_col,240
                                je                   move_bishop_level2
                                cmp                  highlight_row,184
                                je                   move_bishop_level2
                                add                  highlight_row_grid,1
                                add                  highlight_col_grid,1
                                call                 far ptr  highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   move_bishop_level2
                                call                 far ptr                     set_highlighled_true
                                jmp far ptr                  move_bishop_compare1

                
   move_bishop_level2:          
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   move_bishop_compare2:        
                                add                  highlight_row,23
                                sub                  highlight_col,30
                                cmp                  highlight_col,-30
                                je                   move_bishop_level3
                                cmp                  highlight_row,184
                                je                   move_bishop_level3
                                add                  highlight_row_grid,1
                         
                                sub                  highlight_col_grid,1
                                call                 far ptr   highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   move_bishop_level3
                                call                 far ptr                     set_highlighled_true
                                jmp far ptr                  move_bishop_compare2


   move_bishop_level3:          
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   move_bishop_compare3:        
                                sub                  highlight_row,23
                                add                  highlight_col,30
                                cmp                  highlight_col,240
                                je                   move_bishop_level4
                                cmp                  highlight_row,-23
                                je                   move_bishop_level4
                                sub                  highlight_row_grid,1
                         
                                add                  highlight_col_grid,1
                                call                 far ptr  highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   move_bishop_level4
                                call                 far ptr                     set_highlighled_true
                                jmp far ptr                  move_bishop_compare3

   move_bishop_level4:          
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   move_bishop_compare4:        
                                sub                  highlight_row,23
                                sub                  highlight_col,30
                                cmp                  highlight_col,-30
                                je                   move_bishop_exit
                                cmp                  highlight_row,-23
                                je                   move_bishop_exit
                                sub                  highlight_row_grid,1
                         
                                sub                  highlight_col_grid,1
                                call                 far ptr  highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   move_bishop_exit
                                call                 far ptr                     set_highlighled_true
                                jmp far ptr                  move_bishop_compare4



   move_bishop_exit:            
                                ret
move_bishop endp
move_king proc far
                                mov                  al,selected_col_grid
                                dec                  al
                                mov                  bl,3
                                mul                  bl
                                mov                  cx,ax
                                mov                  al,selected_row_grid
                                dec                  al
                                mov                  ah,0
                                mov                  bl,24
                                mul                  bl
                                add                  ax,offset grid_row1
                                mov                  di,ax
                                add                  di,cx
                                inc                  di
                                mov                  al,[di]
                                mov                  ah,0
                                mov                  team,al
                                cmp                  al ,'1'
                                je                   jteam1
                                cmp                  al ,'2'
                                je                   jteam2
                                jmp far ptr                  jexit

   jteam1:                      
   jteam2:                      
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m1:                                                                                                  ;;;;;;;;;;;-1r
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   jcompare1:                   
                                sub                  highlight_row,23
                                cmp                  highlight_row,-23
                                je                   m2
                                sub                  highlight_row_grid,1
                                call                 far ptr highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   m2
                                call                 far ptr                     set_highlighled_true
                        
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m2:                                                                                                  ;;;;;;;;;;;;;-1r  +1c
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   jcompare2:                   
                                sub                  highlight_row,23
                                add                  highlight_col,30
                                cmp                  highlight_row,-23
                                je                   m3
                                cmp                  highlight_col,240
                                je                   m3
                                sub                  highlight_row_grid,1
                                add                  highlight_col_grid,1
                                call                 far ptr highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   m3
                                call                 far ptr                     set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m3:                                                                                                  ;;;;;;;;;;;;;  +1c
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   jcompare3:                   
                                add                  highlight_col,30
                                cmp                  highlight_col,240
                                je                   m4
                                add                  highlight_col_grid,1
                                call                 far ptr highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   m4
                                call                 far ptr                     set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m4:                                                                                                  ;;;;;;;;;;;;;+1r  +1c
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   jcompare4:                   
                                add                  highlight_row,23
                                add                  highlight_col,30
                                cmp                  highlight_row,184
                                je                   m5
                                cmp                  highlight_col,240
                                je                   m5
                                add                  highlight_row_grid,1
                                add                  highlight_col_grid,1
                                call                 far ptr highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   m5
                                call                 far ptr                     set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m5:                                                                                                  ;;;;;;;;;;;;;+1r
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   jcompare5:                   
                                add                  highlight_row,23
                                cmp                  highlight_row,184
                                je                   m6
                                add                  highlight_row_grid,1
                                call                 far ptr highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   m6
                                call                 far ptr                     set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m6:                                                                                                  ;;;;;;;;;;;;;+1r  -1c
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   jcompare6:                   
                                add                  highlight_row,23
                                sub                  highlight_col,30
                                cmp                  highlight_row,184
                                je                   m7
                                cmp                  highlight_col,-30
                                je                   m7
                                add                  highlight_row_grid,1
                                sub                  highlight_col_grid,1
                                call                 far ptr highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   m7
                                call                 far ptr                     set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m7:                                                                                                  ;;;;;;;;;;;;;-1c
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   jcompare7:                   
                                sub                  highlight_col,30
                                cmp                  highlight_col,-30
                                je                   m8
                                sub                  highlight_col_grid,1
                                call                 far ptr highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   m8
                                call                 far ptr                     set_highlighled_true
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   m8:                                                                                                  ;;;;;;;;;;;;;-1r  -1c
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   jcompare8:                   
                                sub                  highlight_col,30
                                sub                  highlight_row,23
                                cmp                  highlight_col,-30
                                je                   jexit
                                cmp                  highlight_row,-23
                                je                   jexit
                                sub                  highlight_col_grid,1
                                sub                  highlight_row_grid,1
                                call                 far ptr  highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   jexit
                                call                 far ptr          set_highlighled_true


   jexit:                       ret
move_king endp
move_rook proc  far

                                mov                  al,selected_col_grid
                                dec                  al
                                mov                  bl,3
                                mul                  bl
                                mov                  cx,ax
                                mov                  al,selected_row_grid
                                dec                  al
                                mov                  ah,0
                                mov                  bl,24
                                mul                  bl
                                add                  ax,offset grid_row1
                                mov                  di,ax
                                add                  di,cx
                                inc                  di
                                mov                  al,[di]
                                mov                  team,al
                                cmp                  al ,'1'
                                je                   rteam1
                                cmp                  al ,'2'
                                je                   rteam2
                                jmp far ptr                  rexit

   rteam1:                      
   rteam2:                      
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   rcompare1:                   
                                add                  highlight_row,23
                                cmp                  highlight_row,184
                                je                   rlevel2
                                add                  highlight_row_grid,1
                                call                 far ptr   highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   rlevel2
                                call                 far ptr                     set_highlighled_true
                                jmp far ptr                  rcompare1
               
                


                
   rlevel2:                     
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   rcompare2:                   
                                sub                  highlight_row,23
                                cmp                  highlight_row,-23
                                je                   rlevel3
                                sub                  highlight_row_grid,1
                                call                 far ptr  highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   rlevel3
                                call                 far ptr                     set_highlighled_true
                                jmp far ptr                  rcompare2


   rlevel3:                     
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   rcompare3:                   
                
                                add                  highlight_col,30
                                cmp                  highlight_col,240
                                je                   rlevel4
                                add                  highlight_col_grid,1
                                call                 far ptr   highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   rlevel4
                                call                 far ptr                     set_highlighled_true
                                jmp far ptr                  rcompare3

   rlevel4:                     
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   rcompare4:                   
               
                                sub                  highlight_col,30
                                cmp                  highlight_col,-30
                                je                   rexit
                                sub                  highlight_col_grid,1
                                call                 far ptr   highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   rexit
                                call                 far ptr                     set_highlighled_true
                                jmp far ptr                  rcompare4



   rexit:                       
                                ret
move_rook endp
move_knight proc  far
                                mov                  al,selected_col_grid
                                dec                  al
                                mov                  bl,3
                                mul                  bl
                                mov                  cx,ax
                                mov                  al,selected_row_grid
                                dec                  al
                                mov                  ah,0
                                mov                  bl,24
                                mul                  bl
                                add                  ax,offset grid_row1
                                mov                  di,ax
                                add                  di,cx
                                inc                  di
                                mov                  al,[di]
                                mov                  ah,0
                                mov                  team,al
                                cmp                  al ,'1'
                                je                   kteam1
                                cmp                  al ,'2'
                                je                   kteam2
                                jmp far ptr                  kexit
 
   kteam1:                      
   kteam2:                      
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise1:                     
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
       
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  +2c   +1r
                                add                  highlight_col,60
                                add                  highlight_row,23
                                cmp                  highlight_col,210
                                ja                   choise2
                                cmp                  highlight_row,161
                                ja                   choise2
                                add                  highlight_col_grid,2
                                add                  highlight_row_grid,1
                         
                                call                 far ptr   highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   choise2
                                call                 far ptr                     set_highlighled_true
                        
                
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise2:                     
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;+2c -1r
                                add                  highlight_col,60
                                sub                  highlight_row,23
                                cmp                  highlight_col,210
                                ja                   choise3
                                cmp                  highlight_row,0
                                jl                   choise3
                                add                  highlight_col_grid,2
                                sub                  highlight_row_grid,1
                                call                 far ptr   highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   choise3
                                call                 far ptr                     set_highlighled_true
   ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise3:                     
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-2c +1r
                                sub                  highlight_col,60
                                add                  highlight_row,23
                                cmp                  highlight_col,0
                                jl                   choise4
                                cmp                  highlight_row,161
                                ja                   choise4
                                sub                  highlight_col_grid,2
                                add                  highlight_row_grid,1
                                call                 far ptr   highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   choise4
                                call                 far ptr                     set_highlighled_true
               
   ;     ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise4:                     
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-2c -1r
                                sub                  highlight_col,60
                                sub                  highlight_row,23
                                cmp                  highlight_col,0
                                jl                   choise5
                                cmp                  highlight_row,0
                                jl                   choise5
                                sub                  highlight_col_grid,2
                                sub                  highlight_row_grid,1
                                call                 far ptr   highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   choise5
                                call                 far ptr                     set_highlighled_true
               
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise5:                     
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;+2r +1c
                                add                  highlight_col,30
                                add                  highlight_row,46
                                cmp                  highlight_col,210
                                ja                   choise6
                                cmp                  highlight_row,161
                                ja                   choise6
                                add                  highlight_col_grid,1
                                add                  highlight_row_grid,2
                                call                 far ptr   highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   choise6
                                call                 far ptr                     set_highlighled_true
               
   ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise6:                     
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;+2r   -1c
                                sub                  highlight_col,30
                                add                  highlight_row,46
                                cmp                  highlight_col,0
                                jl                   choise7
                                cmp                  highlight_row,161
                                ja                   choise7
                                sub                  highlight_col_grid,1
                                add                  highlight_row_grid,2
                                call                 far ptr   highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   choise7
                                call                 far ptr                     set_highlighled_true
               
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise7:                     
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-2r +1c
                                add                  highlight_col,30
                                sub                  highlight_row,46
                                cmp                  highlight_col,210
                                ja                   choise8
                                cmp                  highlight_row,0
                                jl                   choise8
                                add                  highlight_col_grid,1
                                sub                  highlight_row_grid,2
                                call                 far ptr   highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   choise8
                                call                 far ptr                     set_highlighled_true
               
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   choise8:                     
                                mov                  bx,selected_col
                                mov                  highlight_col,bx
                                mov                  cx,selected_row
                                mov                  highlight_row,cx
                                mov                  bl, selected_row_grid
                                mov                  highlight_row_grid,bl
                                mov                  bh, selected_col_grid
                                mov                  highlight_col_grid,bh
   ;;;;;;;;;;;;;;;;;;;;;;;-2r   -1c
                                sub                  highlight_col,30
                                sub                  highlight_row,46
                                cmp                  highlight_col,0
                                jl                   kexit
                                cmp                  highlight_row,0
                                jl                   kexit
                                sub                  highlight_col_grid,1
                                sub                  highlight_row_grid,2
                                call                 far ptr   highlight_goto
                                cmp                  highlight_flag,'f'
                                je                   kexit
                                call                 far ptr                     set_highlighled_true
    
   kexit:                       ret
                        
move_knight endp

highlight_goto proc far
                  
                                mov                  highlight_flag,'t'
                                mov                  al,highlight_col_grid
                                dec                  al
                                mov                  bl,3
                                mul                  bl
                                mov                  cx,ax
                                mov                  al,highlight_row_grid
                                dec                  al
                                mov                  ah,0
                                mov                  bl,24
                                mul                  bl
                                add                  ax,offset grid_row1
                                mov                  di,ax
                                add                  di,cx
                                inc                  di
                                mov                  al,[di]
   ; means that cell is empty
                                cmp                  al,'0'
                                je                   highlight_goto_exit22
   ; team is my team
   ; team2 is not my team

   ;one of my team
                                cmp                  team,al
                                je                   highlight_goto_exit11
   ;not one of my team
                                cmp                  team,al
                                jnz                  highlight_goto_exit33
                                jmp far ptr                  highlight_goto_back
   highlight_goto_exit22:       
                                call                 far ptr  highlight_option
                                jmp far ptr                  highlight_goto_back
   highlight_goto_exit33:       
                                call                 far ptr  highlight_option
   ;highlight flag is = false to break the loop of highlight
                                mov                  highlight_flag,'0'
                                jmp far ptr                  highlight_goto_back
   highlight_goto_exit11:       
   ;highlight flag is = false to break the loop of highlight
                                mov                  highlight_flag,'f'
                                jmp far ptr                  highlight_goto_back
   highlight_goto_back:         
                                ret
highlight_goto endp
highlight_option proc far
                       
                                MY_red_HIGHLIGHT_Rec highlight_row,highlight_col
                                mov                  al,highlight_col_grid
                                dec                  al
                                mov                  bl,3
                                mul                  bl
                                mov                  cx,ax


                                mov                  al,highlight_row_grid
                                dec                  al
                                mov                  ah,0
                                mov                  bl,24
                                mul                  bl
                                add                  ax,offset grid_row1
                                mov                  di,ax
                                add                  di,cx
                                mov                  al,[di]+1
                                cmp                  al ,'1'
                                je                   highlight_option_team1
                                cmp                  al,'2'
                                je                   highlight_option_team2
                                jmp far ptr                  highlight_option_exit

   highlight_option_team1:      mov                  check_color,3h
                                jmp far ptr                  highlight_option_to_piece
   highlight_option_team2:      mov                  check_color,0h
                                jmp far ptr                  highlight_option_to_piece

   highlight_option_to_piece:   
                     

                                mov                  al,highlight_col_grid
                                dec                  al
                                mov                  bl,3
                                mul                  bl
                                mov                  cx,ax


                                mov                  al,highlight_row_grid
                                dec                  al
                                mov                  ah,0
                                mov                  bl,24
                                mul                  bl
                                add                  ax,offset grid_row1
                                mov                  di,ax
                                add                  di,cx
                                mov                  al,[di]
                                cmp                  al,'h'
                                je                   highlight_option_horse_draw
                                cmp                  al,'q'
                                je                   highlight_option_queen_draw
                                cmp                  al,'p'
                                je                   highlight_option_breakpoint1
                                cmp                  al,'k'
                                je                   highlight_option_breakpoint2
                                cmp                  al,'b'
                                je                   highlight_option_breakpoint3
                                cmp                  al,'r'
                                je                   highlight_option_breakpoint4
                                jmp far ptr                  highlight_option_exit

   highlight_option_horse_draw: 
                                mov                  cx,highlight_col
   ; mov          column,cx
                                mov                  startCol,cx
                                mov                  cx,highlight_row
   ; mov          row,cx
                                mov                  startRow,cx
                                add                  startCol,6
                                mov                  dl,check_color
                                mov                  dh,0
                                mov                  pieceColor,dx
   ; Draw         row,column,knight,20,20,dl
                                mov                  pieceWidth,20
                                mov                  pieceHeight,20
                                lea                  bx,knight
                                mov                  piece,bx
                                call                 far ptr Draw
   ; sub          column,6
                                jmp far ptr                  highlight_option_exit
   highlight_option_breakpoint1:jmp far ptr                  highlight_option_pwan_draw
   highlight_option_breakpoint2:jmp far ptr                  highlight_option_king_draw
   highlight_option_breakpoint3:jmp far ptr                  highlight_option_Bishop_draw
   highlight_option_breakpoint4:jmp far ptr                  highlight_option_rook_draw
   highlight_option_queen_draw: 
                                mov                  cx,highlight_col
   ; mov          column,cx
                                mov                  startCol,cx
                                mov                  cx,highlight_row
   ; mov          row,cx
                                mov                  startRow,cx
                                add                  startCol,6
                                mov                  dl,check_color
                                mov                  dh,0
                                mov                  pieceColor,dx
   ; Draw         row,column,queen,13,16,dl
                                mov                  pieceWidth,13
                                mov                  pieceHeight,16
                                lea                  bx,queen
                                mov                  piece,bx
                                call                 far ptr Draw
   ; sub          column,6
                                jmp far ptr                  highlight_option_exit


   highlight_option_pwan_draw:  
                                mov                  cx,highlight_col
   ; mov          column,cx
                                mov                  startCol,cx
                                mov                  cx,highlight_row
   ; mov          row,cx
                                mov                  startRow,cx
                                add                  startCol,6
                                mov                  dl,check_color
                                mov                  dh,0
                                mov                  pieceColor,dx
   ; Draw         row,column,pawn,16,16,dl
                                mov                  pieceWidth,16
                                mov                  pieceHeight,16
                                lea                  bx,pawn
                                mov                  piece,bx
                                call                 far ptr Draw
   ; sub          column,6
                                jmp far ptr                  highlight_option_exit

   highlight_option_king_draw:  
                                mov                  cx,highlight_col
   ; mov          column,cx
                                mov                  startCol,cx
                                mov                  cx,highlight_row
   ; mov          row,cx
                                mov                  startRow,cx
                                add                  startCol,6
                                mov                  dl,check_color
                                mov                  dh,0
                                mov                  pieceColor,dx
   ; Draw         row,column,king,16,16,dl
                                mov                  pieceWidth,16
                                mov                  pieceHeight,16
                                lea                  bx,king
                                mov                  piece,bx
                                call                 far ptr Draw
   ; sub          column,6
                                jmp far ptr                  highlight_option_exit


   highlight_option_Bishop_draw:
                                mov                  cx,highlight_col
   ; mov          column,cx
                                mov                  startCol,cx
                                mov                  cx,highlight_row
   ; mov          row,cx
                                mov                  startRow,cx
                                add                  startCol,6
                                mov                  dl,check_color
                                mov                  dh,0
                                mov                  pieceColor,dx
   ; Draw         row,column,Bishop,17,16,dl
                                mov                  pieceWidth,17
                                mov                  pieceHeight,16
                                lea                  bx,Bishop
                                mov                  piece,bx
                                call                 far ptr Draw
   ; sub          column,6
                                jmp far ptr                  highlight_option_exit


   highlight_option_rook_draw:  
                                mov                  cx,highlight_col
   ; mov          column,cx
                                mov                  startCol,cx
                                mov                  cx,highlight_row
   ; mov          row,cx
                                mov                  startRow,cx
                                add                  startCol,6
                                mov                  dl,check_color
                                mov                  dh,0
                                mov                  pieceColor,dx
   ; Draw         row,column,rook,16,16,dl
                                mov                  pieceWidth,16
                                mov                  pieceHeight,16
                                lea                  bx,rook
                                mov                  piece,bx
                                call                 far ptr Draw
   ; sub          column,6
                                jmp far ptr                  highlight_option_exit
   highlight_option_exit:       
                                ret
highlight_option endp
set_highlighled_true proc far
                                mov                  bl,highlight_row_grid
                                dec                  bl
                                mov                  bh,highlight_col_grid
                                dec                  bh
                                mov                  di,offset highlight_row1
                                mov                  al,bl
                                mov                  ah,0
                                mov                  cl,8
                                mul                  cl
                                add                  di,ax
                                mov                  bl,bh
                                mov                  bh,0
                                add                  di,bx
                                mov                  al,'t'
                                mov                  [di],al
                                ret
set_highlighled_true endp
 mov_until_select proc far
                                pusha
   mov_until_select_check:      
                                mov                  ah,01H
                                int                  16h
                                jz                   mov_until_select_check
                                mov                  ah,00
                                int                  16h
                                mov clicked,ah
                                call far ptr  move_current_cell_or_select 
                                jmp far ptr                  mov_until_select_check
   mov_until_select_exit:       
                                popa
                                ret
mov_until_select endp
loop_until_goto proc far
                    
                            pusha
    loop_until_goto_check:                       
                                 mov                      ax,goto_col
                                 cmp                      ax,-1
                                 jne                      loop_until_goto_exit
                                 mov                      ah,01H
                                 int                      16h
                                 jz                       loop_until_goto_check
                                 mov                      ah,00
                                 int                      16h
                                 mov clicked,ah
                                 call far ptr move_goto_cell_or_select 
                                 jmp far ptr                      loop_until_goto_check
    loop_until_goto_exit:                       
                                 mov                      goto_col,-1
                                 mov                      goto_row,-1
                                 mov                      goto_row_grid,-1
                                 mov                      goto_col_grid,-1
                                 popa
                                 ret
loop_until_goto endp
move_piece proc far

                                 mov                      al,goto_row_grid
                                 dec                      al
                                 mov                      bl,8
                                 mul                      bl
                                 mov                      bl,goto_col_grid
                                 mov                      bh,0
                                 dec                      bl
                                 add                      ax,bx
                                 mov                      di ,offset highlight_row1
                                 add                      di,ax
                                 mov                      cl,[di]
                                 mov                      al,'f'
                                 cmp                      cl,al
                                 je                       move_piece_breakpoint1

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

                                 mov                      cl,[di]                                              ;;;;;piece

                                 mov                      ch,[di]+1                                            ;;;team color
                                 push                     cx
                                 mov                      al,'0'
                                 mov                      [di],al
                                 inc                      di
                                 mov                      al,'0'
                                 mov                      [di],al
             
                                 move_piece_breakpoint1: jmp far ptr move_piece_breakpoint2

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
                                 mov al,0
                                 call far ptr HIGHLIGHT_selected       

                             
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

                                 move_piece_breakpoint2: jmp far ptr move_piece_exit

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
                                 mov al,0
                                 call far ptr HIGHLIGHT_selected 


                                 mov                      selected_col,-1
                                 mov                      selected_row,-1
                                 mov                      selected_row_grid,-1
                                 mov                      selected_col_grid,-1

    move_piece_exit:                    
                                 ret
move_piece endp
HIGHLIGHT_selected proc far
                     ;   mov              cl,flag ;;;;;;;;;;;;;;;;;;flag should be in al
                       mov              cl,al
                       cmp              cl,0
                       jne              HIGHLIGHT_selected_break_point5
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
                       je               HIGHLIGHT_selected_draw_w
                       cmp              al ,'b'
                       je               HIGHLIGHT_selected_draw_b
                       jmp far ptr              HIGHLIGHT_selected_exit

    HIGHLIGHT_selected_break_point5: jmp far ptr HIGHLIGHT_selected_draw_highlight

    HIGHLIGHT_selected_draw_b:            

                       MYBrownRec       row,column

                       jmp far ptr              HIGHLIGHT_selected_to_team_color
    HIGHLIGHT_selected_draw_w:            

                       MYWhiteRec       row,column
                       jmp far ptr              HIGHLIGHT_selected_to_team_color

    HIGHLIGHT_selected_draw_highlight:                                                   ; will be deleted soon (Nesma)


                       MY_HIGHLIGHT_Rec  current_row,current_col
                       jmp far ptr              HIGHLIGHT_selected_to_team_color



    HIGHLIGHT_selected_to_team_color:     
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
                       je               HIGHLIGHT_selected_team1
                       cmp              al,'2'
                       je               HIGHLIGHT_selected_team2
                       jmp far ptr              HIGHLIGHT_selected_exit

    HIGHLIGHT_selected_team1:             mov              check_color,3h
                       jmp far ptr              HIGHLIGHT_selected_to_piece
    HIGHLIGHT_selected_team2:             mov              check_color,0h
                       jmp far ptr              HIGHLIGHT_selected_to_piece

    HIGHLIGHT_selected_to_piece:          
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
                       je               HIGHLIGHT_selected_horse_draw
                       cmp              al,'q'
                       je               HIGHLIGHT_selected_queen_draw
                       cmp              al,'p'
                       je               HIGHLIGHT_selected_break_point1
                       cmp              al,'k'
                       je               HIGHLIGHT_selected_break_point2
                       cmp              al,'b'
                       je               HIGHLIGHT_selected_break_point3
                       cmp              al,'r'
                       je               HIGHLIGHT_selected_break_point4
                       jmp far ptr              HIGHLIGHT_selected_exit

    HIGHLIGHT_selected_horse_draw:        
                       mov              cx,column
                      mov                  startCol,cx
                      add                startCol,6
                       mov              dl,check_color
                       mov dh,0
                       mov  pieceColor,dx
                       mov              cx,row
                     mov                  startRow,cx
                     lea                  bx,knight
                     mov                  piece,bx
                     mov                  pieceWidth,20
                      mov                  pieceHeight,20
                       call                 far ptr Draw
                     ;   Draw             row,column,knight,20,20,dl
                     ;   sub              column,6
                       jmp far ptr              HIGHLIGHT_selected_exit
                    
                    
       HIGHLIGHT_selected_break_point1: jmp far ptr   HIGHLIGHT_selected_pwan_draw         
       HIGHLIGHT_selected_break_point2: jmp far ptr   HIGHLIGHT_selected_king_draw
       HIGHLIGHT_selected_break_point3: jmp far ptr   HIGHLIGHT_selected_Bishop_draw
       HIGHLIGHT_selected_break_point4: jmp far ptr   HIGHLIGHT_selected_rook_draw
                     

    HIGHLIGHT_selected_queen_draw:        

                       mov              cx,column
                      mov                  startCol,cx
                      add                startCol,6
                        mov              dl,check_color
                       mov dh,0
                       mov  pieceColor,dx
                       mov              cx,row
                     mov                  startRow,cx
                     lea                  bx,queen
                     mov                  piece,bx
                     mov                  pieceWidth,13
                      mov                  pieceHeight,16
                       call                 far ptr Draw

                     ;   Draw             row,column,queen,13,16,dl
                     ;   sub              column,6
                       jmp far ptr              HIGHLIGHT_selected_exit


    HIGHLIGHT_selected_pwan_draw:         

                        mov              cx,column
                      mov                  startCol,cx
                      add                startCol,6
                        mov              dl,check_color
                       mov dh,0
                       mov  pieceColor,dx
                       mov              cx,row
                     mov                  startRow,cx
                     lea                  bx,pawn
                     mov                  piece,bx
                     mov                  pieceWidth,16
                      mov                  pieceHeight,16
                       call                 far ptr Draw
                     ;   Draw             row,column,pawn,16,16,dl
                     ;   sub              column,6
                       jmp far ptr              HIGHLIGHT_selected_exit

    HIGHLIGHT_selected_king_draw:         

                        mov              cx,column
                      mov                  startCol,cx
                      add                startCol,6
                       mov              dl,check_color
                       mov dh,0
                       mov  pieceColor,dx
                       mov              cx,row
                     mov                  startRow,cx
                     lea                  bx,king
                     mov                  piece,bx
                     mov                  pieceWidth,16
                      mov                  pieceHeight,16
                       call                 far ptr Draw
                     ;   Draw             row,column,king,16,16,dl
                     ;   sub              column,6
                       jmp far ptr              HIGHLIGHT_selected_exit


    HIGHLIGHT_selected_Bishop_draw:       

                        mov              cx,column
                      mov                  startCol,cx
                      add                startCol,6
                       mov              dl,check_color
                       mov dh,0
                       mov  pieceColor,dx
                       mov              cx,row
                     mov                  startRow,cx
                     lea                  bx,Bishop
                     mov                  piece,bx
                     mov                  pieceWidth,17
                      mov                  pieceHeight,16
                       call                 far ptr Draw
                     ;   Draw             row,column,Bishop,17,16,dl
                     ;   sub              column,6
                       jmp far ptr              HIGHLIGHT_selected_exit


    HIGHLIGHT_selected_rook_draw:         
                        mov              cx,column
                      mov                  startCol,cx
                      add                startCol,6
                      mov              dl,check_color
                       mov dh,0
                       mov  pieceColor,dx
                       mov              cx,row
                     mov                  startRow,cx
                     lea                  bx,rook
                     mov                  piece,bx
                     mov                  pieceWidth,16
                      mov                  pieceHeight,16
                       call                 far ptr Draw
                     ;   Draw             row,column,rook,16,16,dl
                     ;   sub              column,6
                       jmp far ptr              HIGHLIGHT_selected_exit

    HIGHLIGHT_selected_exit:              
ret

HIGHLIGHT_selected endp
move_current_cell_or_select proc far
                                
                              
                                 pusha

                                cmp                clicked,75                               ;;;left
                                jne                 next_cur1
                                jmp far ptr                 move_current_cell_or_select_left
                                next_cur1:
                                cmp                clicked,72                               ;;;up
                                jne                 next_cur2
                                jmp far ptr                 move_current_cell_or_select_up
                                next_cur2:
                                cmp                clicked,80                               ;;;down
                                jne                 next_cur3
                                jmp far ptr                 move_current_cell_or_select_down
                                next_cur3:
                                cmp                clicked,77                               ;;;right
                                jne                 next_cur4
                                jmp far ptr                 move_current_cell_or_select_right
                                next_cur4:
                                cmp                clicked,28                               ;;;enter
                                jne                 next_cur5
                                jmp far ptr                 move_current_cell_or_select_enter
                                next_cur5:
                                jmp far ptr                move_current_cell_or_select_exit

    move_current_cell_or_select_left:                       
                                cmp                current_col,00
                                jne                 next_cur6
                               jmp far ptr                move_current_cell_or_select_exit
                                next_cur6:
                                sub                current_col,30
                                 push               dx
                                mov                dx,current_row
                                mov                row,dx

                                mov                dx,current_col
                                mov                column,dx
                                add                column,30
                                mov al,0
                                call far ptr HIGHLIGHT_selected 
                                dec                current_col_grid
  
                                mov                dx,current_row
                                mov                row,dx
                                mov                dx,current_col
                                mov                column,dx
                                pop                dx
                                mov al,1
                                call far ptr HIGHLIGHT_selected 
                                jmp far ptr                 move_current_cell_or_select_exit



     move_current_cell_or_select_down:                       
                                cmp                current_row,161
                                jne                 next_cur7
                               jmp far ptr                move_current_cell_or_select_exit
                                next_cur7:

                                add                current_row,23
                                 push               dx
                                mov                dx,current_row
                                mov                row,dx

                                mov                dx,current_col
                                mov                column,dx
                                sub                row,23
                                mov al,0
                                call far ptr HIGHLIGHT_selected 
                                inc                current_row_grid
                                mov                dx,current_row
                                mov                row,dx

                                mov                dx,current_col
                                mov                column,dx
                                pop                dx
                                mov al,1
                                call far ptr HIGHLIGHT_selected 
                                jmp far ptr                 move_current_cell_or_select_exit

     move_current_cell_or_select_up:                         
                                cmp                current_row,0
                               jne                 next_cur8
                               jmp far ptr                move_current_cell_or_select_exit
                                next_cur8:

                                sub                current_row,23
                                push               dx
                                mov                dx,current_row
                                mov                row,dx

                                mov                dx,current_col
                                mov                column,dx
                                add                row,23
                                mov al,0
                                call far ptr HIGHLIGHT_selected 
                                dec                current_row_grid
                                mov                dx,current_row
                                mov                row,dx

                                mov                dx,current_col
                                mov                column,dx
                                pop                dx
                                mov al,1
                                call far ptr HIGHLIGHT_selected 
                                jmp far ptr                 move_current_cell_or_select_exit

     move_current_cell_or_select_right:                      
                                cmp                current_col,210
                                jne                 next_cur9
                               jmp far ptr                move_current_cell_or_select_exit
                                next_cur9:

                                add                current_col,30
                                push               dx
                                mov                dx,current_row
                                mov                row,dx

                                mov                dx,current_col
                                mov                column,dx
                                sub                column,30
                                mov al,0
                                call far ptr HIGHLIGHT_selected 
                                inc                current_col_grid
                                mov                dx,current_row
                                mov                row,dx
                                mov                dx,current_col
                                mov                column,dx
                                pop                dx
                                mov al,1
                                call far ptr HIGHLIGHT_selected 
                                jmp far ptr                 move_current_cell_or_select_exit

     move_current_cell_or_select_enter:                      
   
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
                                jne                 next_cur10
                               jmp far ptr                move_current_cell_or_select_exit
                                next_cur10:

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
                                je                  move_current_cell_or_select_kh
                                cmp                al,'p'
                                je                  move_current_cell_or_select_p
                                cmp                al,'b'
                                je                  move_current_cell_or_select_b
                                cmp                al,'r'
                                je                  move_current_cell_or_select_r
                                cmp                al,'q'
                                je                  move_current_cell_or_select_q
                                cmp                al,'k'
                                je                  move_current_cell_or_select_kg
                                jmp far ptr                 move_current_cell_or_select_exit
     move_current_cell_or_select_kh:                         
                                call               far ptr      move_knight
                                jmp far ptr                 move_exit
   
     move_current_cell_or_select_p:                          
                                call               far ptr               move_pawn
                                jmp far ptr                 move_exit
     move_current_cell_or_select_r:                          
                                call               far ptr               move_rook
                                jmp far ptr                 move_exit
     move_current_cell_or_select_b:                          
                                call               far ptr               move_bishop
                                jmp far ptr                 move_exit
     move_current_cell_or_select_kg:                         
                                call               far ptr               move_king
                                jmp far ptr                 move_exit
     move_current_cell_or_select_q:                          
                                call               far ptr               move_bishop
                                call               far ptr               move_rook
                                jmp far ptr                 move_exit

     move_exit:                      
                                 call               far ptr   loop_until_goto
                                ; call               far ptr               Dehighlight_Grid
                               
                                jmp far ptr                 move_current_cell_or_select_exit
     move_current_cell_or_select_exit:
     popa  
    ret                     
move_current_cell_or_select endp
move_goto_cell_or_select proc far 
                             pusha

                               cmp                clicked,75                               ;;;left
                                jne                 next_com1
                                jmp far ptr                 move_goto_cell_or_select_left
                                next_com1:
                                cmp                clicked,72                               ;;;up
                                jne                 next_com2
                                jmp far ptr                 move_goto_cell_or_select_up
                                next_com2:
                                cmp                clicked,80                               ;;;down
                                jne                 next_com3
                                jmp far ptr                 move_goto_cell_or_select_down
                                next_com3:
                                cmp                clicked,77                               ;;;right
                                jne                 next_com4
                                jmp far ptr                 move_goto_cell_or_select_right
                                next_com4:
                                cmp                clicked,28                               ;;;enter
                                jne                 next_com5
                                jmp far ptr                 move_goto_cell_or_select_enter
                                next_com5:
                                jmp far ptr                move_goto_cell_or_select_exit

    move_goto_cell_or_select_left:                    
                             cmp                current_col,00
                             jne              next_com6  
                             jmp far ptr             move_goto_cell_or_select_exit
                              next_com6:
                             sub                current_col,30
                             push               dx
                             mov                dx,current_row
                             mov                row,dx

                             mov                dx,current_col
                             mov                column,dx
                             add                column,30
                             mov al,0
                             call far ptr  HIGHLIGHT_selected 
                             dec                current_col_grid
  
                             mov                dx,current_row
                             mov                row,dx
                             mov                dx,current_col
                             mov                column,dx
                             pop                dx
                              mov al,1
                            call far ptr  HIGHLIGHT_selected 
                             jmp far ptr                move_goto_cell_or_select_exit



    move_goto_cell_or_select_down:                    
                             cmp                current_row,161
                             jne              next_com7  
                             jmp far ptr             move_goto_cell_or_select_exit
                              next_com7:
                             add                current_row,23
                             push               dx
                             mov                dx,current_row
                             mov                row,dx

                             mov                dx,current_col
                             mov                column,dx
                             sub                row,23
                              mov al,0
                            call far ptr  HIGHLIGHT_selected 
                             inc                current_row_grid
                             mov                dx,current_row
                             mov                row,dx

                             mov                dx,current_col
                             mov                column,dx
                             pop                dx
                              mov al,1
                            call far ptr  HIGHLIGHT_selected 
                             jmp far ptr                move_goto_cell_or_select_exit

    move_goto_cell_or_select_up:                      
                             cmp                current_row,0
                             jne              next_com8  
                             jmp far ptr             move_goto_cell_or_select_exit
                              next_com8:

                             sub                current_row,23
                             push               dx
                             mov                dx,current_row
                             mov                row,dx

                             mov                dx,current_col
                             mov                column,dx
                             add                row,23
                              mov al,0
                            call far ptr  HIGHLIGHT_selected 
                            dec                current_row_grid
                             mov                dx,current_row
                             mov                row,dx

                             mov                dx,current_col
                             mov                column,dx
                             pop                dx
                             mov al,1
                            call far ptr  HIGHLIGHT_selected 
                             jmp far ptr                move_goto_cell_or_select_exit

    move_goto_cell_or_select_right:                   
                             cmp                current_col,210
                             jne              next_com9  
                             jmp far ptr             move_goto_cell_or_select_exit
                              next_com9:

                             add                current_col,30
                             push               dx
                             mov                dx,current_row
                             mov                row,dx

                             mov                dx,current_col
                             mov                column,dx
                             sub                column,30
                             mov al,0
                            call far ptr  HIGHLIGHT_selected 
                             inc                current_col_grid
                             mov                dx,current_row
                             mov                row,dx
                             mov                dx,current_col
                             mov                column,dx
                             pop                dx
                              mov al,1
                            call far ptr  HIGHLIGHT_selected 
                             jmp far ptr                move_goto_cell_or_select_exit

    move_goto_cell_or_select_enter:                   
                             mov                ax,current_col
                             mov                goto_col,ax

                             mov                ax,current_row
                             mov                goto_row,ax

                             mov                al,current_col_grid
                             mov                goto_col_grid,al

                             mov                al,current_row_grid
                             mov                goto_row_grid,al

                               call    far ptr  move_piece

                             jmp far ptr                move_goto_cell_or_select_exit
    move_goto_cell_or_select_exit:                    
                             popa
                             ret
move_goto_cell_or_select endp


main proc far
                                mov                  ax,@data
                                mov                  ds,ax
                                ChgVideoMode
                                mov                  ax,0A000H
                                mov                  es,ax
                                call                 far ptr DrawGrid
                                call                 far ptr startpieces
                                MY_HIGHLIGHT_Rec     00,0090
                                 mov                  startRow,0
                                mov                  startCol,96
                                lea                  bx,king
                                mov                  piece,bx
                                mov                  pieceWidth,16
                                mov                  pieceHeight,16
                                mov                  pieceColor,3
                                call                 far ptr Draw
                              ; Draw                 0,96,king,16,16,3
                              call far ptr  mov_until_select
   both:                        
   ;  mov          ah,2
   ;  mov          dl,24
   ;  mov          dh,0
   ;  mov          bh,0
   ;  int          10h
                                mov                  ah,4ch
                                int                  21h
main endp
end main