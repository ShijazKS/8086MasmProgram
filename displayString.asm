; Assembly language program to display a String ending with $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.model small ; 64KB for code and 64KB for data	

.stack 100h   	

.data         	
msg DB 'Hello GECSKPM$'   

.code         	

.startup      	

MOV AH,09H		
MOV DX,OFFSET msg
INT 21H		

.exit		

end	


