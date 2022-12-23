<h1 align='center'>Real Time Chess</h1>
<div align='center'>
   <img  src="/Images/logo.jpeg"  >
 </div>
 <h2 align='center'> 🕮 Introduction & Background 🕮 </h2>
<p align='justify'>
This section presents an overview of the project requirements and constraints. Specific details are
discussed later. It is required to connect 2 PCs through a Simple network, using serial communication.
Two functions are to be implemented: chatting, and a two-player real-time chess game.
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
  <br> 🔴 <b>Grid.asm</b> which is the game itself, it uses all two other files.
  <br>
  If you're using DOSBOX through VSCODE then simply copy the content of this folder to the extensions workspace (as in the .txt) and that should then run by default, otherwise   you might just use the normal incantation of masm-ing each file then linking all. Regardless, you need a virtual port simulator for this (to simulate playing/chatting on two different computers)
  <br> <h4> <b> That's why, alternatively </b> You can simply just run Grid.asm: (Both players on the same computer): <br> </h4>
  ♠️ Open the emulator and type <b>tasm Grid.asm</b><br>
  ♣️ Then type <b>link Grid.obj</b><br>
  ♥️ Now type <b>Grid</b>
</p> 

<!-- readme: collaborators -start -->
<table>
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
