include CommonMacros.inc
.Model huge
.Stack 64
.Data
    welcome db "Please enter your name :",'$'
    menter  db "Plaese press enter to continue ",'$'
    name1   db 30 ,?, 30 dup(?)
    mf1     db "To start chatting press F1 ",10,13,'$'
    mf2     db "To start Game press F2 ",10,13,'$'
    mesc    db "To end the program press ESC",10,13,'$'
.Code
main PROC FAR
         mov         ax,@data
         mov         ds,ax
         ClearScreen
         PrintMsg    menter
main endp
end main