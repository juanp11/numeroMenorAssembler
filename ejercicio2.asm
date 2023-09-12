.data
	num1: .asciiz "Introduce un entero: "
	num2: .asciiz "Introduce segundo un entero: "
	num3: .asciiz "Introduce tercer un entero: "
	msg1: .asciiz "El primer numero es menor!"
	msg2: .asciiz "El segundo numero es menor!"
	msg3: .asciiz "El tercer numero es menor!"
.text
main: 
	li $v0, 4 # código de imprimir cadena
	la $a0, num1 # dirección de la cadena
	syscall # Llamada al sistema
	li $v0, 5 # código de leer entero
	syscall # Llamada al sistema 
	move $t0, $v0
	li $v0, 4 # código de imprimir cadena
	la $a0, num2 # dirección de la cadena
	syscall # Llamada al sistema
	li $v0, 5 # código de leer entero
	syscall # Llamada al sistema 
	move $t1, $v0
	li $v0, 4 # código de imprimir cadena
	la $a0, num3 # dirección de la cadena
	syscall # Llamada al sistema
	li $v0, 5 # código de leer entero
	syscall # Llamada al sistema 
	move $t2, $v0
	ble   $t0,$t1,menorNum1
	j menorNum2
menorNum1:
	ble  $t0,$t2,menorNum1Result
	j menorNum3
menorNum2:
	ble  $t1,$t2,menorNum2Result
	j menorNum3
menorNum1Result: 
	li $v0,4
	la $a0, msg1
	syscall 
	li $v0, 1
	move $a0, $t0
	syscall
	j fin
menorNum2Result:
	li $v0,4
	la $a0, msg2
	syscall 
	li $v0, 1
	move $a0, $t1
	syscall 
	j fin
menorNum3:
	li $v0,4
	la $a0, msg3
	syscall 
	li $v0, 1
	move $a0, $t2
	syscall 
fin:
	li $v0, 10
	syscall 
