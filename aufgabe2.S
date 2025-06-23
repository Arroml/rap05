bd// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe2.S"
	.text			@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2		@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
				@ unteren 2 Bit sind 0
	.global	main		@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:
	push	{lr}

	bl	up1	@brunch with link springt zur Zieladresse Speichert dei Rücksprungadresse im Link Register
	bl	up2	
	bl	up3
	
	pop		{pc}

// UP1 benutzt nur Scratchregister und stellt keine Blattroutine dar (ruft somit weitere
// Unterprogramme auf)	
up1:
	
	push {r4, lr}   
	mov r4, #42           @ Beispielhafte Nutzung von r4
	bl UP3               @ Aufruf weiterer Funktion
	pop {r4, lr}          @ Wiederherstellen
	bx lr

	



// UP2 benutzt nur Scratchregister und stellt eine Blattroutine dar (ruft somit keine weiteren
// Unterprogramme auf)
up2:
 	mov r0, #2
	mov r1, #3
   	add r0, r0, r1       
	bx lr		@Springt zur Adresse in einem Register


//UP3 benutzt Nicht-Scratchregister und stellt keine Blattroutine dar
up3:
	push {lr}            @ Muss lr sichern, weil sie UP1 aufruft
	mov r0, #1
	bl UP1
	pop {lr}
	bx lr



.Lfe1:
	.size	main,.Lfe1-main

// End of File
