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
	LDR     R0, =Table       ; R0 = Adresse der Tabelle (Pointer)
        LDR     R1, =Count       ; R1 = Adresse des ZÃ¤hlers
        LDR     R2, [R1]         ; Es wird der Tatsächliche Wert wert von R1 geladen
        MOV     R3, #0           ; R3 = Total (Summe)
	
Loop:
        LDR     R4, [R0]         ; R4 = aktueller Tabellenwert
        ADD     R3, R3, R4       ; R3 += R4 also der Wert von der Tabelle wird erhöht
        ADD     R0, R0, #4       ; Zeiger wird um 4 byte erhöht
        SUBS    R2, R2, #1       ; ZÃ¤hler verringern, setzt Flag
        BNE     Loop             ; Springt, wenn das Zero Flag nicht gesetzt ist

        LDR     R5, =Total
        STR     R3, [R5]         ; Summe in Total speichern


Halt:
	b	Halt

//; Data definitions
//Total 	DEFW 0 ; Total - initially zero
Total:	.word	0
//One 	DEFW 1 ; The number one
//Count 	DEFW 4 ; Loop counter (loop 5x)
Count:	.word	4
//Table 	DEFW 39 ; The numbers to total ...
//	DEFW 25 ;
//	DEFW 4 ;
//	DEFW 98 ;
//	DEFW 17 ;
Table:	.word	39, 25, 4, 98, 17


.Lfe1:
	.size	main,.Lfe1-main

// End of File
