include macros.inc
.286
ClearScreen MACRO
                mov ax,0003h
                int 10h
ENDM
PrintMsg MACRO str
             mov ah, 9
             mov dx, offset str
             int 21h
ENDM
.Model huge
.Stack 64
.Data
    welcome db "Please enter your name :",'$'
    menter  db "Plaese press enter to continue ",'$'
    name1   db 30 ,?, 30 dup(?)
    mf1     db "To start chatting press F1 ",10,13,'$'
    mf2     db "To start Game press F2 ",10,13,'$'
    mesc    db "To end the program press ESC",10,13,'$'
    test1   db "f1 pressed",'$'
    test2   db "f2 pressed",'$'
.Code
main PROC FAR
               mov               ax,@data
               mov               ds,ax
               ClearScreen
    ;set curser 1st column and first row
    ;    mov         ah,2
    ;    mov         dx,0101h
    ;    int         10h
               MoveCursor        01h 01h
    ;display welcome
    ;    mov         ah, 9
    ;    mov         dx, offset welcome
    ;    int         21h
               PrintMsg          welcome
    ;set curser
    ;    mov         ah,2
    ;    mov         dx,0202h
    ;    int         10h
               MoveCursor        02h 02h
    ;read from user
    ;    mov         ah,0AH
    ;    mov         dx,offset name1
    ;    int         21h
               ReadMsg           name1
    ;display enter
    ;    mov         ah,2
    ;    mov         dh,20
    ;    mov         dl,2
    ;    int         10h
               MoveCursor        20 2
    ;    mov         ah, 9
    ;    mov         dx, offset menter
    ;    int         21h
               PrintMsg          menter
    ;wait for enter
    CHECK:     mov               ah,1
               int               16h
               JZ                CHECK
               mov               ah,0
               int               16h
               JZ                CHECK
               cmp               al,13
               jnz               CHECK
    ;clear the screen
               ClearScreen
    ;set the curser
    ;    mov         ah,2
    ;    mov         dx,051ah
    ;    mov         bh,0
    ;    int         10h
               mov               bh,0
               MoveCursor        05h 1ah

    ;display home
    ;    mov         ah, 9
    ;    mov         dx, offset mf1
    ;    int         21h
               PrintMsg          mf1
    ;set the curser
    ;    mov         ah,2
    ;    mov         dx,071ah
    ;    mov         bh,0
    ;    int         10h
               mov               bh,0
               MoveCursor        07h 1ah
    ;display home
    ;    mov         ah, 9
    ;    mov         dx, offset mf2
    ;    int         21h
               PrintMsg          mf2
    ;set the curser
    ;    mov         ah,2
    ;    mov         dx,091ah
    ;    mov         bh,0
    ;    int         10h
               
               mov               bh,0
               MoveCursor        09h 1ah

    ;display home
    ;    mov         ah, 9
    ;    mov         dx, offset mesc
    ;    int         21h
               PrintMsg          mesc
        
    ;draw the line
    ;    mov         ah,2
    ;    mov         dx,1500h
    ;    mov         bh,0
    ;    int         10h

               mov               bh,0
               MoveCursor        15h 00h

               mov               cx,80
    myloop:    
    ;    mov         ah,2
    ;    mov         dl,'-'
    ;    int         21h
               PrintChr          '-'
               dec               cx
               jnz               myloop

    waitForKey:mov               ah,0
    ;            int         16h
               GetKeyPressedWait
               cmp               ah,59
               jz                F1Key
               cmp               ah,60
               jz                F2Key
               cmp               ah,1
               jz                ESCKey
               jnz               waitForKey
               
    F1Key:     
               ClearScreen
               PrintMsg          mf1
               jmp far ptr               rest
    F2Key:     
               ClearScreen
               PrintMsg          mf2
               jmp far ptr               rest
    ESCKey:    
               ClearScreen
               PrintMsg          mesc
    rest:      
               CloseProgram
main endp
end main