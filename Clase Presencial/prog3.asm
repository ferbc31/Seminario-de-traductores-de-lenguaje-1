    name "p3"   ; 
    
;   Este programa realiza la suma de dos datos
;   el primero es un dato de 16 bits almacenado en
;   la dirección de memoria 210H y 211H, la dirección
;   210H tendra los 8 bits mas significativos, la direccion
;   212H tendra el dato 2. la suma se realiza usando solo
;   registros de 8 bits.
    
    org  100h	; 

;Configuracion de la pantalla
    mov ax, 1003h  
    mov bx, 0        
    int 10h
;mensaje 1
    mov dx, 0705h     
    mov bx, 0         
    mov bl, 10011111b 
    mov cx, msg1_size  
    mov al, 01b       
    mov bp, msg1
    mov ah, 13h       
    int 10h  
;mensaje 2    
    mov dx, 0905h     
    mov bx, 0         
    mov bl, 10011111b 
    mov cx, msg2_size  
    mov al, 01b       
    mov bp, msg2
    mov ah, 13h       
    int 10h           
;mensaje 3         
    mov dx, 0B05h     
    mov bx, 0         
    mov bl, 10011111b 
    mov cx, msg3_size  
    mov al, 01b       
    mov bp, msg3
    mov ah, 13h       
    int 10h           
;mensaje 4
    mov dx, 0C05h     
    mov bx, 0         
    mov bl, 10011111b 
    mov cx, msg4_size  
    mov al, 01b       
    mov bp, msg4
    mov ah, 13h       
    int 10h           
;*******************
;espera la pulsacion d euna tecla para continuar
    mov ah, 0          
    int 10110b
                                                
                                                
;******************
;operacion de suma                                                
    mov ax,0
    mov al,[0x211]
    add al,[0x212]
    adc ah,[0x210]
    mov [0213h],ah
    mov [0214h],al
    mov [0215h],ax       

    int 20h  
    
msg1:         db "Seccion D08"
msg2:         db "Introduce tus datos en la memoria:"
msg3:         db "Dato1 de 16 bits en direcciones 0x0210 y 0x0211"
msg4:         db "Dato2 de 8 bits en direcciones 0x0212"
msg_tail:
msg1_size = msg2 - msg1
msg2_size = msg3 - msg2
msg3_size = msg4 - msg3
msg4_size = msg_tail - msg4                  