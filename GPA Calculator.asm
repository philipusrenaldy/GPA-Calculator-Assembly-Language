;@2020                                                                                                                      ;
;AUTHOR         :   - DIMAS WIRA NUGRAHA                < TEKNIK KOMPUTER - 1806200021 - >                                  ; 
;               :   - PHILIPUS REYNALDI KRISTIAN        < TEKNIK KOMPUTER - 1806200053 - >                                  ;
;               :   - NATALIA KRISTIAN                  < TEKNIK KOMPUTER - 1806200103 - >                                  ;
;               :   - RIFQI HARI PUTRA                  < TEKNIK KOMPUTER - 1806200103 - >                                  ;
;KELOMPOK       :   6A                                                                                                      ;
;TEMA           : GPA CALCULATOR                                                                                            ;
;---------------------------------------------------------------------------------------------------------------------------;
;SKENARIO       :   1. USER LOGIN DENGAN AKUN YANG SUDAH DIBUAT, JIKA TIDAK ADA AKUN MAKA USER MEMBUAT AKUN BARU            ;
;                   2. USER MEMASUKKAN NAMA DAN NPM MAHASISWA                                                               ;
;                   3. USER MEMASUKKAN MATA KULIAH YANG AKAN DIHITUNG                                                       ;
;                   4. USER MEMASUKKAN JUMLAH SKS DARI SETIAP MATA KULIAH YANG TELAH DIINPUTKAN                             ;
;                   5. USER MEMASUKKAN NILAI TUGAS,KUIS,UTS, DAN UAS DARI SETIAP MATA KULAH YANG TELAH DIINPUTKAN           ;
;                   6. HASIL PENGHITUNGAN DITAMPILKAN DAN HASIL DAPAT DALAM BENTUK SEBUAH FILE BARU                         ;
;                   7. PROGRAM MENGENERATE FILE TXT YANG BERISIKAN INFORMASI DAN HASIL PENGHITUNGAN                         ;
;---------------------------------------------------------------------------------------------------------------------------;
;                                                                                                                           ;
;                   GPA CALCULATOR is a program that calculate GPA that user must input the enrolled courses dan grades.    ;
;                                                                                                                           ;
;                                                                                                                           ;
;                   Copyright (C) 2020 Dimas Wira Nugraha, Philipus Reynaldi Kristian, Natalia Kristian, Rifqi Hari Putra   ;
;                                                                                                                           ;
;                                                                                                                           ;
;                      This program is free software: you can redistribute it and/or modify                                 ;
;                      it under the terms of the GNU General Public License as published by                                 ;
;                      the Free Software Foundation: either version 3 of the License, or                                    ;
;                      (at your option) any later version.                                                                  ;
;                                                                                                                           ;
;                                                                                                                           ;
;                      This program is distributed in the hope that it will be useful,                                      ;
;                      but WITHOUT ANY WARRANTY: without even the implied warranty of                                       ;
;                      MERCHANTABILITY or FITNESS FOR A  PARTICULAR PURPOSE. See the                                        ;
;                      GNU General Public License for more details.                                                         ;
;                                                                                                                           ;
;---------------------------------------------------------------------------------------------------------------------------;
;REFERENCE  :   1. https://stackoverflow.com/questions/47252660/what-is-meaning-of-model-small-in-8086-programs             ;
;               2. https://stackoverflow.com/questions/30995792/creating-and-save-text-file-in-assembly                     ;
;               3. https://www.daniweb.com/programming/software-development/threads/488361/grading-program-in-nasm          ;
;               4. https://youtu.be/hNZcXiFe7XE                                                                             ;
;               5. https://www.youtube.com/watch?v=MZSqvqMuUvw&feature=youtu.be                                             ;
;               6. https://www.daniweb.com/programming/software-development/threads/264646/help-read-text-from-txt-file-    ;
;               and-store-in-array                                                                                          ;
;---------------------------------------------------------------------------------------------------------------------------;
.MODEL SMALL
.DATA
    JUDUL    DB "********************** SELAMAT DATANG DI GPA CALCULATOR ************************",13,10,"$"
    WELC1    DB 13,10,"PERHATIKAN SETIAP PERINTAH PADA GPA CALCULATOR INI",13,10,"$"
    WELC2    DB 13,10,13,10,"LOGIN :$"
    WELC3    DB 13,10,13,10,"1. DAFTAR",13,10, "$"
    WELC4    DB 13,10,"2. MASUK",13,10, "$"
    USER1    DB 13,10,"MASUKKAN USERNAME :$"  
    PASS1    DB 13,10,"MASUKKAN PASSWORD :$"
    USERNAME DB "USERNAME.txt",0
    PASSWORD DB "PASSWORD.txt",0
    NAMA     DB 13,10,13,10,"MASUKKAN NAMA MAHASISWA : $"
    NPM      DB 13,10,13,10,"NPM MAHASISWA : $"
    MATKUL1  DB 13,10,13,10,"MATA KULIAH 1 : $"
    MATKUL2  DB 13,10,13,10,"MATA KULIAH 2 : $"
    MATKUL3  DB 13,10,13,10,"MATA KULIAH 3 : $"
    MATKUL4  DB 13,10,13,10,"MATA KULIAH 4 : $"
    MATKUL5  DB 13,10,13,10,"MATA KULIAH 5 : $" 
    MATKUL11 DB 13,10,13,10,"NILAI MATA KULIAH 1 : $"
    MATKUL21 DB 13,10,13,10,"NILAI MATA KULIAH 2 : $"
    MATKUL31 DB 13,10,13,10,"NILAI MATA KULIAH 3 : $"
    MATKUL41 DB 13,10,13,10,"NILAI MATA KULIAH 4 : $"
    MATKUL51 DB 13,10,13,10,"NILAI MATA KULIAH 5 : $"
    BBTNILAI DB 13,10,13,10,"MASUKKAN BOBOT NILAI : $"
    NOTE1    DB 13,10,13,10,"HARAP UNTUK MEMASUKKAN NILAI YANG VALID DAN TIDAK MELEBIHI 100, DAN INPUT HARUS 2 BIT$"
    NOTE2    DB 13,10,13,10,"MASUKKAN NILAI UNTUK MATKUL 1 :$" 
    NOTE3    DB 13,10,13,10,"MASUKKAN NILAI UNTUK MATKUL 2 :$"
    NOTE4    DB 13,10,13,10,"MASUKKAN NILAI UNTUK MATKUL 3 :$"
    NOTE5    DB 13,10,13,10,"MASUKKAN NILAI UNTUK MATKUL 4 :$"
    NOTE6    DB 13,10,13,10,"MASUKKAN NILAI UNTUK MATKUL 5 :$"
    SALAH    DB 13,10,13,10,"USERNAME/PASSWORD SALAH SILAHKAN INPUT KEMBALI"
    TUGAS    DB 13,10,13,10,"TUGAS :$"
    KUIS     DB 13,10,13,10,"KUIS :$"
    UTS      DB 13,10,13,10,"UTS :$"
    UAS      DB 13,10,13,10,"UAS :$"
    TOTAL    DB 13,10,13,10,"TOTAL :$"
    
    INPUTUSER   DB 7, 21 DUP(?), '$'
    INPUTPASS   DB 7, 21 DUP(?), '$'
    BUF      DB 5, 21 DUP(?), '$'
    
    NAMA1    DB 50 DUP (?),'$'
    NPM1     DB 10 DUP (?),'$'
    MATKUL_1 DB 50 DUP (?),'$'
    MATKUL_2 DB 50 DUP (?),'$'
    MATKUL_3 DB 50 DUP (?),'$'
    MATKUL_4 DB 50 DUP (?),'$'
    MATKUL_5 DB 50 DUP (?),'$'
    TUGAS1   DB 5   DUP (?)
    KUIS1    DB 5   DUP (?)
    UTS1     DB 5   DUP (?)
    UAS1     DB 5   DUP (?)
    TOTAL1   DB 5   DUP (?)
    TOTAL2   DB 5   DUP (?)
    TOTAL3   DB 5   DUP (?)
    TOTAL4   DB 5   DUP (?)
    TOTAL5   DB 5   DUP (?)  
.CODE   

OPEN MACRO MSG,MODE                         
        MOV DX, OFFSET MSG
        MOV AL,MODE
        MOV AH,3DH
        INT 21H
ENDM
    
WRITE MACRO MSG                             
        MOV BX,AX          
        MOV AH,40H
        MOV CX,5
        LEA DX,MSG
        INT 21H
        MOV AH,3EH
        INT 21H
ENDM
    
READ MACRO MSG            
        MOV BX,AX                                                    
        MOV CX,99
        MOV DX,OFFSET MSG
        MOV AH,3FH
        INT 21H
ENDM 

NEEDINPUT MACRO MSG, MODE
    MOV AH, MODE
    LEA DX, MSG
    INT 21H
    MOV AH, 09H
    INT 21H
    CLEAR
ENDM

DISP MACRO MSG
    LEA DX, MSG
    MOV AH, 09H
    INT 21H 
ENDM  

CLEAR MACRO                                               
    MOV AH, 0
    MOV AL, 3
    INT 10H
ENDM

PROC INPUT
    MOV AH, 01H
    INT 21H
    RET
ENDP INPUT   

PROC CEK
    CMP AL, 34H
    JE A
    CMP AL, 33H
    JE B
    CMP AL, 32H
    JE C
    CMP AL, 31H
    JE E
    CMP AL, 30H
    JE E
A:  
    MOV AL, 'A'
    JMP SELESAI
B:  
    MOV AL, 'B'
    JMP SELESAI
C:  
    MOV AL, 'C'
    JMP SELESAI
E:     
    MOV AL, 'E'
    JMP SELESAI
SELESAI:
    RET
ENDP CEK
       
PROC CALCULATE
    MOV AL, TUGAS1[1]
    MOV AH, TUGAS1[0]
    MOV BL, KUIS1[1]
    MOV BH, KUIS1[0]
    SUB AL, 30H
    SUB AH, 30H
    SUB BL, 30H
    SUB BH, 30H
    ADD AX, BX     
    MOV BX, AX
    MOV AL, UTS1[1]
    MOV AH, UTS1[0]  
    SUB AL, 30H
    SUB AH, 30H
    ADD AX, BX
    MOV BX, AX
    MOV AL, UAS1[1]
    MOV AH, UAS1[0]
    SUB AL, 30H
    SUB AH, 30H
    MOV CL, 25
    ADD AX, BX  
    AAD     
    DIV CL   
    OR  AX, 3030H
    RET
ENDP CALCULATE

.STARTUP

MULAI:
    CLEAR
    DISP JUDUL 
    DISP WELC1
    DISP WELC2
    DISP WELC3
    DISP WELC4
    MOV AH, 0H
    INT 16H
    CMP AL, 31H
    JNE LOGIN
    JMP SIGNUP
SIGNUP:
    CLEAR
    DISP USER1 
    NEEDINPUT INPUTUSER,0AH
    
    OPEN USERNAME,02H
    WRITE INPUTUSER+2
    
    DISP PASS1
    NEEDINPUT INPUTPASS,0AH
    
    OPEN PASSWORD,02H
    WRITE INPUTPASS+2
    CLEAR
    JMP MULAI 

LOGIN:
    CLEAR
    DISP USER1
    NEEDINPUT INPUTUSER,0AH
    
    OPEN USERNAME,0
    READ BUF
    MOV SI, 2
    MOV DI, 0
    MOV CX, 5
    
ULANG:
    MOV BL, INPUTUSER[SI]
    MOV DL, BUF[DI]
    INC SI
    INC DI
    CMP BL, DL
    JNE NOT_EQUAL
    LOOP ULANG
    
    DISP PASS1
    NEEDINPUT INPUTPASS,0AH
    
    OPEN PASSWORD,0
    READ BUF
    MOV SI, 2
    MOV DI, 0 
    MOV CX, 5
    
ULANG1:
    MOV BL, INPUTPASS[SI]
    MOV DL, BUF[DI] 
    INC SI
    INC DI
    CMP BL, DL
    JNE NOT_EQUAL
    LOOP ULANG1
    
    CLEAR
    JMP EQUAL

NOT_EQUAL:
    DISP SALAH
    JMP LOGIN
   
EQUAL:
    CLEAR
    DISP JUDUL    
    DISP NAMA 
SATU:
    CALL INPUT 
    MOV NAMA1[SI],AL
    CMP AL,0DH
    JE  NEXT1
    INC SI   
    JMP SATU

NEXT1:    
    DISP NPM
    MOV SI,00H
DUA:
    CALL INPUT
    MOV NPM1[SI],AL
    CMP AL,0DH
    JE  NEXT2
    INC SI   
    JMP DUA

NEXT2:        
    DISP MATKUL1
    MOV SI,00H
TIGA:
    CALL INPUT
    MOV MATKUL_1[SI],AL
    CMP AL,0DH
    JE  NEXT3
    INC SI   
    JMP TIGA

NEXT3:    
    DISP MATKUL2
    MOV SI,00H
EMPAT:
    CALL INPUT
    MOV MATKUL_2[SI],AL
    CMP AL,0DH
    JE  NEXT4
    INC SI   
    JMP EMPAT

NEXT4:    
    DISP MATKUL3
    MOV SI,00H
LIMA:
    CALL INPUT
    MOV MATKUL_3[SI],AL
    CMP AL,0DH
    JE  NEXT5
    INC SI   
    JMP LIMA

NEXT5:    
    DISP MATKUL4
    MOV SI,00H
ENAM:
    CALL INPUT
    MOV MATKUL_4[SI],AL
    CMP AL,0DH
    JE  NEXT6
    INC SI   
    JMP ENAM

NEXT6:    
    DISP MATKUL5
    MOV SI,00H
TUJUH:
    CALL INPUT
    MOV MATKUL_5[SI],AL
    CMP AL,0DH
    JE  NEXT7
    INC SI   
    JMP TUJUH

NEXT7:
    DISP BBTNILAI
    DISP NOTE1
    DISP NOTE2
    DISP TUGAS
    MOV SI,00H
DELAPAN:
    CALL INPUT
    MOV TUGAS1[SI],AL
    CMP AL,0DH
    JE  NEXT8
    INC SI   
    JMP DELAPAN
    
NEXT8:
    DISP KUIS 
    MOV SI,00H
SEMBILAN:
    CALL INPUT
    MOV KUIS1[SI],AL
    CMP AL,0DH
    JE  NEXT9
    INC SI   
    JMP SEMBILAN
    
NEXT9:
    DISP UTS    
    MOV SI,00H
SEPULUH:
    CALL INPUT
    MOV UTS1[SI],AL
    CMP AL,0DH
    JE  NEXT10
    INC SI   
    JMP SEPULUH
    
NEXT10:
    DISP UAS    
    MOV SI,00H
SEBELAS:
    CALL INPUT
    MOV UAS1[SI],AL
    CMP AL,0DH
    JE  NEXT11
    INC SI   
    JMP SEBELAS
    
NEXT11:            
    CALL CALCULATE
    MOV SI,00H 
    CALL CEK
    MOV TOTAL1[SI], AL
    MOV AL,"$"      
    INC SI
    MOV TOTAL1[SI], AL 
    DISP NOTE1
    DISP NOTE3
    DISP TUGAS
    MOV SI,00H
DUABELAS:    
    CALL INPUT
    MOV TUGAS1[SI],AL
    CMP AL,0DH
    JE  NEXT12
    INC SI   
    JMP DUABELAS
    
NEXT12:
    DISP KUIS 
    MOV SI,00H
TIGABELAS:
    CALL INPUT
    MOV KUIS1[SI],AL
    CMP AL,0DH
    JE  NEXT13
    INC SI   
    JMP TIGABELAS
    
NEXT13:
    DISP UTS    
    MOV SI,00H
EMPATBELAS:
    CALL INPUT
    MOV UTS1[SI],AL
    CMP AL,0DH
    JE  NEXT14
    INC SI   
    JMP EMPATBELAS
    
NEXT14:
    DISP UAS    
    MOV SI,00H
LIMABELAS:
    CALL INPUT
    MOV UAS1[SI],AL
    CMP AL,0DH
    JE  NEXT15
    INC SI   
    JMP LIMABELAS  
    
NEXT15:
    CALL CALCULATE
    MOV SI,00H
    CALL CEK
    MOV TOTAL2[SI], AL
    MOV AL,"$"      
    INC SI
    MOV TOTAL2[SI], AL 
    DISP BBTNILAI
    DISP NOTE1
    DISP NOTE4
    DISP TUGAS
    MOV SI,00H
ENAMBELAS:
    CALL INPUT
    MOV TUGAS1[SI],AL
    CMP AL,0DH
    JE  NEXT16
    INC SI   
    JMP ENAMBELAS
    
NEXT16:
    DISP KUIS 
    MOV SI,00H
TUJUHBELAS:
    CALL INPUT
    MOV KUIS1[SI],AL
    CMP AL,0DH
    JE  NEXT17
    INC SI   
    JMP TUJUHBELAS
    
NEXT17:
    DISP UTS    
    MOV SI,00H
DELAPANBELAS:
    CALL INPUT
    MOV UTS1[SI],AL
    CMP AL,0DH
    JE  NEXT18
    INC SI   
    JMP DELAPANBELAS
    
NEXT18:
    DISP UAS    
    MOV SI,00H
SEMBILANBELAS:
    CALL INPUT
    MOV UAS1[SI],AL
    CMP AL,0DH
    JE  NEXT19
    INC SI   
    JMP SEMBILANBELAS
    
NEXT19:            
    CALL CALCULATE
    MOV SI,00H
    CALL CEK
    MOV TOTAL3[SI], AL
    MOV AL,"$"      
    INC SI
    MOV TOTAL3[SI], AL 
    DISP BBTNILAI
    DISP NOTE1
    DISP NOTE5
    DISP TUGAS
    MOV SI,00H
DUAPULUH:
    CALL INPUT
    MOV TUGAS1[SI],AL
    CMP AL,0DH
    JE  NEXT20
    INC SI   
    JMP DUAPULUH
    
NEXT20:
    DISP KUIS 
    MOV SI,00H
DUASATU:
    CALL INPUT
    MOV KUIS1[SI],AL
    CMP AL,0DH
    JE  NEXT21
    INC SI   
    JMP DUASATU
    
NEXT21:
    DISP UTS    
    MOV SI,00H
DUADUA:
    CALL INPUT
    MOV UTS1[SI],AL
    CMP AL,0DH
    JE  NEXT22
    INC SI   
    JMP DUADUA
    
NEXT22:
    DISP UAS    
    MOV SI,00H
DUATIGA:
    CALL INPUT
    MOV UAS1[SI],AL
    CMP AL,0DH
    JE  NEXT23
    INC SI   
    JMP DUATIGA
    
NEXT23:           
    CALL CALCULATE
    MOV SI,00H
    CALL CEK
    MOV TOTAL4[SI], AL
    MOV AL,"$"      
    INC SI
    MOV TOTAL4[SI], AL 
    DISP BBTNILAI
    DISP NOTE1
    DISP NOTE6
    DISP TUGAS
    MOV SI,00H
DUAEMPAT:
    CALL INPUT
    MOV TUGAS1[SI],AL
    CMP AL,0DH
    JE  NEXT24
    INC SI   
    JMP DUAEMPAT
    
NEXT24:
    DISP KUIS 
    MOV SI,00H
DUALIMA:
    CALL INPUT
    MOV KUIS1[SI],AL
    CMP AL,0DH
    JE  NEXT25
    INC SI   
    JMP DUALIMA
    
NEXT25:
    DISP UTS    
    MOV SI,00H
DUAENAM:
    CALL INPUT
    MOV UTS1[SI],AL
    CMP AL,0DH
    JE  NEXT26
    INC SI   
    JMP DUAENAM
    
NEXT26:
    DISP UAS    
    MOV SI,00H
DUATUJUH:
    CALL INPUT
    MOV UAS1[SI],AL
    CMP AL,0DH
    JE  NEXT27
    INC SI   
    JMP DUATUJUH
    
NEXT27:           
    CALL CALCULATE
    MOV SI,00H
    CALL CEK
    MOV TOTAL5[SI], AL
    MOV AL,"$"      
    INC SI
    MOV TOTAL5[SI], AL 
    CLEAR 
    
    DISP MATKUL11
    DISP TOTAL1
    DISP MATKUL21
    DISP TOTAL2
    DISP MATKUL31
    DISP TOTAL3
    DISP MATKUL41
    DISP TOTAL4
    DISP MATKUL51
    DISP TOTAL5        
.EXIT    
END