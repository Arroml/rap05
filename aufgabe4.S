// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe4.S"
	.text			@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2		@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
				@ unteren 2 Bit sind 0
	.global	main		@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
    
main:
    ldr r0, =Total         @ Zieladresse Summe
    ldr r1, [r0]           @ r1 = aktuelle Summe (Startwert = 0)
	
	ldr r2, =Count		@ Adresse von count
    ldr r3, [r2]          @ r3 = Count-Wert

    ldr r4, =Table         @ r4 = Startadresse der Tabelle
    
    mov r5, #0             @ r5 = Index (i)

loop:
    	mov r6, r5, LSL #2     @ r6 = Offset = i * 4
    	add r7, r4, r6         @ r7 = Adresse von Table[i]
    	ldr r8, [r7]           @ r8 = Wert an Table[i]
    	add r1, r1, r8         @ Summe += Wert
	
    	add r5, r5, #1         @ Index++
    	subs r3, r3, #1        @ Count --
    	bne loop

    	str r1, [r0]           @ Speichere Ergebnis in Total

halt:
    b halt                 @ 


.Lfe1:
	.size	main,.Lfe1-main

	.data
//; Data definitions
//Total 	DEFW 0 ; Total - initially zero
Total:	.word	0
//One 	DEFW 1 ; The number one
//Count 	DEFW 4 ; Loop counter (loop 5x)
Count:	.word	5
//Table 	DEFW 39 ; The numbers to total ...
//	DEFW 25 ;
//	DEFW 4 ;
//	DEFW 98 ;
//	DEFW 17 ;
Table:	.word	39, 25, 4, 98, 17

	

// End of File

