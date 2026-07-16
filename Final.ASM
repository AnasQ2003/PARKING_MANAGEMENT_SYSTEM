.model small
.stack 100h
.data
menu db '*****************MENU*********************$'   
menuu db '**************DELETE MENU******************$'

menu1 db 'Press 1 for Bike$'
menu1a db 'Slot available for Bikes are: $'
menu1b db 'Press 1 to delete Bike$'
menuall db 'Charges: $'
menu2 db 'Press 2 for Car$'
menu2a  db 'Slot available for Cars are: $'
menu2b  db 'Press 2 to delete Car$'
menu3 db 'Press 3 for Bus$'
menu3a db 'Slot available for Buses are: $'
menu3b db 'Press 3 to delete Bus$'
menu4 db 'Press 4 to show the record$'
menu5 db 'Press 5 to delete the record$'
menu6 db 'Press 6 to exit$'
msg1 db 'Parking Is Full$'
msg2 db 'Wrong input$'
msg3 db 'car$'
msg4 db 'bus$'
msg5 db 'record$'
msg6 db 'there is more space$'
msg7 db 'the total amount is=$'
msg8 db 'the total numbers of vehicles parked=$'
msg9 db 'the total number of Bikes parked=$'
msg10 db 'the total number of cars parked=$'
msg11 db 'the total number of buses parked=$'
msg12 db '***Record deleted successfully***$'
amount dw 0
count dw  '0'
am1 dw ?
am2 dw ?
am3 dw ?


r dw '0'
c db '0'
b db '0'

rleft dw '8'
cleft dw '6'
bleft dw '7'
.code
main proc
mov ax,@data
mov ds,ax

;mov cx,count

;mov cx,0

while_:   
             ;Menu
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu1
mov ah,9
int 21h



                        




mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h 




mov dx,offset menu2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu3
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu4
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,offset menu5
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu6
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h




  ;userinput

mov ah,1
int 21h
mov bl,al
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

  ;now compare
mov al,bl
cmp al,'1'
je bike
cmp al,'2'
je car
cmp al,'3'
je bus
cmp al,'4'
je rec
cmp al,'5'
je del
cmp al,'6'
je end_


mov dx,offset msg2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp while_

bike:
call bikee


car:
call caar


rec:
call recrd


del:
call delt


bus:
call buss



end_:
mov ah,4ch
int 21h

main endp





bikee proc
cmp count,'21'
jle bike1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

bike1:

cmp r,'7'
jle bike2
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_



bike2:
mov dx,10               ;charges 
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   

mov dx,offset menuall
mov ah,9
int 21h                          ;



mov ax,200
add amount, ax
mov dx,0 ; remainder is 0
mov bx,10 
mov cx,0
l2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
        jne l2
   
l3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l3
;mov am1,dx
inc count
;mov dx,count
inc r
sub rleft,1
  

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   

mov dx,offset menu1a
mov ah,9
int 21h

mov dx,rleft
mov ah,2
int 21h    


jmp while_
jmp end_


caar proc
cmp count,'21'
jle car1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

car1:      
cmp c,'5'
jle car2
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

car2:
mov dx,10               ;charges 
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   

mov dx,offset menuall
mov ah,9
int 21h                          ;

mov ax,300
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l22:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l22
   
l33:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l33



;mov am2,amount

inc count
inc c 
dec cleft

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   

mov dx,offset menu2a
mov ah,9
int 21h

mov dx,cleft
mov ah,2
int 21h    

jmp while_
jmp end_




buss proc
cmp count,'21'
jle bus1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

bus1:
cmp b,'6'
jle bus2
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

bus2:

mov dx,10               ;charges 
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   

mov dx,offset menuall
mov ah,9
int 21h                          ;

mov ax,400
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l222:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l222
   
l333:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l333
;mov am3,amount

inc count
inc b

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   

mov dx,offset menu3a
mov ah,9
int 21h

mov dx,bleft
mov ah,2
int 21h    

jmp while_
jmp end_





delt proc

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menuu
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu1b
mov ah,9
int 21h



                        




mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h 




mov dx,offset menu2b
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu3b
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov ah,1 ; user input
int 21h
mov bl,al
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h  


mov al,bl  ;compare
cmp al,'1'
je bikedel
cmp al,'2'
je cardel
cmp al,'3'
je busdel 

mov dx,offset msg2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp while_


bikedel:    
inc rleft
dec r
mov dx,offset msg12
mov ah,9
int 21h
mov ax,amount
sub ax,200
mov amount,ax      
dec count    

jmp while_
jmp end_

cardel:
inc cleft
dec c  
mov dx,offset msg12
mov ah,9
int 21h
mov ax,amount
sub ax,300
mov amount,ax
dec count

jmp while_
jmp end_

busdel:
inc bleft
dec b
mov dx,offset msg12
mov ah,9
int 21h
mov ax,amount
sub ax,400
mov amount,ax
dec count

jmp while_
jmp end_

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

recrd proc
mov dx,offset msg7
mov ah,9
int 21h


; print here the whole amount
mov ax, amount

mov dx,0
mov bx,10
mov cx,0
totalpush:
        div bx
        push dx
        mov dx,0
      ;  mov ah,0
        inc cx
        cmp ax,0
       jne totalpush
   
totalprint:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop totalprint




mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h







mov dx,offset msg8
mov ah,9
int 21h

mov dx,count
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset msg9
mov ah,9
int 21h

mov dx,r
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,offset msg10
mov ah,9
int 21h


mov dl,c
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,offset msg11
mov ah,9
int 21h

mov dl,b
mov ah,2
int 21h

jmp while_
jmp end_


jmp while_
jmp end_










end main
