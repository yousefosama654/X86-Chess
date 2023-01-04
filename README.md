<h1 align='center'>Real Time Chess</h1>
<div align='center'>
   <img  src="/Images/logo.jpeg"  >
 </div>
 <h2 align='center'> 🕮 Introduction & Background 🕮 </h2>
<p align='justify'>
This section presents an overview of the project requirements and constraints. Specific details are
discussed later.The Real-time Chess Game
In this part, the users should be able to play a two-player real-time chess game. 
The final target for
each player is to win the chess game. The game is a popular Android game titled "Chezz: Play Fast
Chess". In this project,Each player can move his pieces to win
the game. The goal is to kill your opponent's king.
The game is like any standard chess, each piece moves exactly like standard chess. The main
difference is that there are no turns, which means one player can move multiple pieces while the other
player didn't move any pieces. There is a countdown for each piece to be moved again, for example, if
I moved the queen now, I can't move the same queen again for 2 seconds although I can move any
other piece at this time.It is required to connect 2 PCs through a Simple network, using serial communication. Two functions are to be implemented: chatting, and a two-player real-time chess game.
  </p>
<h2 align='center'>💻 Technologies used 💻 </h2>
<div align='center'>
    <p> It's a microprocessors course project, so...</p>
   <img  src="/Images/image.jpg" title="All rights resrved. " >
 </div>
 
 <h2 align='center'>☑️ Structure & How to Run ☑️ </h2>
<div align='center'>
 </div>
   <p> <h4> Inside Modular Code you should find: </h4>
   🔵 <b>macros.inc</b> which has all the Macros that we've used (X86-Macro Library).
  <br> 🟡 <b>Graphics.inc</b> which includes all the graphics (assets) used in the game.
  <br> 🔴 <b>Game.asm</b> which is the game itself, it uses all two other files.
  <br>
  If you're using DOSBOX through VSCODE then simply copy the content of this folder to the extensions workspace (as in the .txt) and that should then run by default, otherwise   you might just use the normal incantation of masm-ing each file then linking all. Regardless, you need a virtual port simulator for this (to simulate playing/chatting on two different computers)
  <br> 
  
  <h2 align='center'>🎮 Gameplay 🎮 </h2>
  <br>
  
  
  <div align='center'>
   <h3>**First U Enter Your Own Names**</h3>
   <br>
   <img  src="/Images/EnterName.png" title="All rights resrved.">
</div>
  
<div align='center'>
   <h3>**Then U Send A Chat Inviation and Waith For Acceptance**</h3>
   <br>
   <img  src="/Images/ChatInvitation.png" title="All rights resrved.">
</div>
    <div align='center'>
   <h3>**Get Into Chat Mode Of The Game**</h3>
   <br>
   <img  src="/Images/ChatModule.png" title="All rights resrved.">
</div>
 
 <div align='center'>
   <h3>**Then U Send A Game Inviation and Waith For Acceptance**</h3>
   <br>
   <img  src="/Images/GameInvitation.png" title="All rights resrved.">
</div>

<div align='center'>
   <h3>**Get Into Game Mode Of The Game with Inline Chat **</h3>
   <br>
   <img  src="/Images/KilledPiece.png" title="All rights resrved.">
</div>
 
  
  
 ### Installation Guide
1. Download all files in this Repository. ( Make sure it has the same location format like in this repository )
2. Download `TASM` that integrated with `DOSBox`. ( Not the GUI TASM )
3. Copy all files and folder that have been downloaded in this Repository to `TASM` folders.
4. Mount the `Phase3` Folder in the `DOSBox`.
5. Assemble the `Game.asm`in the `DOSBox` using `TASM`.
6. TLINK the `Game.obj`.
7. Type `Game.exe` and Enjoy the Game!!!

### Playing Guide For Both Teams
1. Use `UP`, `DOWN`, `LEFT`, `RIGHT` buttons to move your marker / unit.
2. Use `ENTER` to confirms the move.
3. Use `F4` to Immediate Exit from Game.

 <h2 align='center'>⭐ Collaborators ⭐ </h2>
<!-- readme: collaborators -start -->
<table  align='center'> 
<tr>
    <td align="center">
        <a href="https://github.com/yousefosama654">
            <img src="https://avatars.githubusercontent.com/u/93356614?v=4" width="100;" alt="yousefosama654"/>
            <br />
            <sub><b>Yousef</b></sub>
        </a>
    </td>
    <td align="center">
        <a href="https://github.com/nesma-shafie">
            <img src="https://avatars.githubusercontent.com/u/120175134?v=4" width="100;" alt="nesma-shafie"/>
            <br />
            <sub><b>Nesma</b></sub>
        </a>
    </td>
    <td align="center">
        <a href="https://github.com/Sara-Gamal1">
            <img src="https://avatars.githubusercontent.com/u/106556638?v=4" width="100;" alt="Sara-Gamal1"/>
            <br />
            <sub><b>Sara</b></sub>
        </a>
    </td></tr>
</table>
<!-- readme: collaborators -end -->
<h2 align='center'>Thank You. 💖 </h2>
