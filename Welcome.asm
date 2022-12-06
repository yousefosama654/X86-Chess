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
    enter   db "Plaese press enter to continue ",'$'
    name1   db 30 ,?, 30 dup(?)
    mf1     db "To start chatting press F1 ",10,13,'$'
    mf2     db "To start Game press F2 ",10,13,'$'
    mesc    db "To end the program press ESC",10,13,'$'
.Code
main PROC FAR
               mov         ax,@data
               mov         ds,ax
               ClearScreen
    ;set curser 1st column and first row
               mov         ah,2
               mov         dx,0101h
               int         10h
    ;display welcome
               mov         ah, 9
               mov         dx, offset welcome
               int         21h
    ;set curser
               mov         ah,2
               mov         dx,0202h
               int         10h
    ;read from user
               mov         ah,0AH
               mov         dx,offset name1-2
               int         21h
    ;display enter
               mov         ah,2
               mov         dh,20
               mov         dl,2
               int         10h
               mov         ah, 9
               mov         dx, offset enter
               int         21h
    ;wait for enter
    CHECK:     mov         ah,1
               int         16h
               JZ          CHECK
               mov         ah,0
               int         16h
               JZ          CHECK
               cmp         al,13
               jnz         CHECK
    ;clear the screen
               ClearScreen
    ;set the curser
               mov         ah,2
               mov         dx,051ah
               mov         bh,0
               int         10h
    ;display home
               mov         ah, 9
               mov         dx, offset mf1
               int         21h

    ;set the curser
               mov         ah,2
               mov         dx,071ah
               mov         bh,0
               int         10h
    ;display home
               mov         ah, 9
               mov         dx, offset mf2
               int         21h

    ;set the curser
               mov         ah,2
               mov         dx,091ah
               mov         bh,0
               int         10h
    ;display home
               mov         ah, 9
               mov         dx, offset mesc
               int         21h
        
    ;draw the line
               mov         ah,2
               mov         dx,1500h
               mov         bh,0
               int         10h
               mov         cx,80
    loop:      
               mov         ah,2
               mov         dl,'-'
               int         21h
               dec         cx
               jnz         loop
    waitForKey:mov         ah,0
               int         16h
               cmp         ah,59
               jz          F1Key
               cmp         ah,60
               jz          F2Key
               cmp         ah,1
               jz          ESCKey
               jnz         waitForKey
               ClearScreen
    F1Key:     
               PrintMsg    mf1
               jmp         rest
    F2Key:     
               PrintMsg    mf2
               jmp         rest
    ESCKey:    
               PrintMsg    mesc
    rest:      
               
main endp
end main