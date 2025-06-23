// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe3.S"
	.text			@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2		@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
				@ unteren 2 Bit sind 0
	.global	main		@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:
	ldr r0, =Total
  	ldr r1, Total           @ r1 = aktuelle Summe

    	ldr r6, One          @ r6 = 1

    	ldr r4, Count          @ r4 = Count-Wert

    	ldr r5, =Table1         @ r5 = Adresse der Tabelle
    	ldr r7, =Add_instr     @ r7 = Adresse des zu zum Befehl der verändert wird
	
loop:
Add_instr:
	ldr r8, [r5]           @ wird verändert

    	add r1, r1, r8             @ Summe += Wert
    	str r1, [r0]               @ speichere neue Summe

    	ldr r9, [r7]               @ lade Maschinenbefehl an Add_instr
    	mov r10, r6, LSL#2	       	 @ 4 Byte Offset mal One, das Imkrementiert wird
	
    	ldr r11, =0xFFFFF000    @ Maske: nur obere 20 Bit bleiben (Offset = 0)
	and r9, r9, r11		@ offset wird auf 0 gesetzt
	add r9, r9, r10		@ neuer Offset wird aus r10 gezogen
	str r9, [r7]		@ speichert den modefizierten Befehl an der Stelle Add_instr
	

    	subs r4, r4, #1            @ Count--
	add r6, #1		@ One ++
    	
	bne loop                   @ falls noch nicht 0 
    




halt:
    B halt                @ Halt

//; Data definitions
//Total 	DEFW 0 ; Total - initially zero
Total:	.word	0
//One 	DEFW 1 ; The number one
//Count 	DEFW 4 ; Loop counter (loop 5x)

One:	.word 1

Count:	.word	4
//Table 	DEFW 39 ; The numbers to total ...
//	DEFW 25 ;
//	DEFW 4 ;
//	DEFW 98 ;
//	DEFW 17 ;
Table1:	.word	39, 25, 4, 98, 17


.Lfe1:
	.size	main,.Lfe1-main

// End of File
