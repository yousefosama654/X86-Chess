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

                                         
                                         call                    far ptr init_comm
                                         mov                     di,offset name1
                                         add di,2
                                         mov bl,2

                                        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;send_and_recive_names
                                       


    AGAIN_name1:                         mov                     dx , 3FDH                                                        ; Line Status Register
                                         In                      al , dx                                                          ;Read Line Status
                                         test                    al , 00100000b
                                         JZ                      AGAIN_name1                                                            ;Not empty
    ;If empty put the VALUE in Transmit data register
                                         mov                     dx , 3F8H                                                        ; Transmit data register
                                         mov                     al,[di]
                                         out                     dx , al
                                         inc                     di
                                         mov                     cl,'$'
                                         cmp                     [di],cl
                                         jne                     AGAIN_name1
                                         dec                      bl
                                         jnz                 AGAIN_name1


                                          
                                         mov                     di,offset name2
                                         add                      di,2

                                         ;Check                   that Data is Ready
     AGAIN_name2:                         
                                          mov                     dx , 3FDH                                                        ; Line Status Register
                                          in                      al , dx
                                         test                    al , 1
                                         JZ                      AGAIN_name2                                                              ;Not Ready
    ;If Ready read the VALUE in Receive data register
                                         mov                     dx , 03F8H
                                         in                      al , dx
                                         mov                     [di] , al
                                         inc                      di
                                         cmp                       al,'$'
                                         jne                       AGAIN_name2

                                         
                                         MoveCursor 12,40
                                         mov ah, 9
                                         mov dx, offset name1
                                         add dx,2
                                         int 21h

                                         
                                         MoveCursor 13,60
                                         mov ah, 9
                                        mov dx, offset name2
                                        add dx,2
                                         int 21h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

 