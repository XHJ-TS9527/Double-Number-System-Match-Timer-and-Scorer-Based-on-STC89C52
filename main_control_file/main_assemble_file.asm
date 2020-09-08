ORG 0000H
AJMP MAIN
ORG 0003H
LJMP INT0INT ;A�ӵ÷��ж�
ORG 000BH
LJMP T0INT	;T0�ж�
ORG 0013H
LJMP INT1INT ;B�ӵ÷��ж�
ORG 001BH
LJMP T1INT ;T1�ж�
ORG 002BH 
LJMP T2INT ;T2�ж�
ORG 0030H
MAIN:
MOV SP,#60H ;��ջ����
LCALL INITIALIZATION_PROG ;��ʼ��
LCALL ENTER_TIME ;���붨ʱʱ��,׼ȷ������8λ����R1����8λ����R2��R0-3�Ƕ���λ�ļ�ʱ����
LCALL START_RACE ;��ʼ����
LCALL SCAN_MATCH ;������;
LCALL END_RACE ;������������������ʾ���
AJMP MAIN

;;;;;;;;;;;;;;;;;;;;;;;;;��ʼ������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INITIALIZATION_PROG:
CLR RS0
CLR RS1 ;ѡ�����Ĵ�����Ϊ0��
TH2 EQU 0CDH
TL2 EQU 0CCH
RLDH EQU 0CBH
RLDL EQU 0CAH
T2MOD EQU 0C9H
T2CON EQU 0C8H
TF2 EQU 0CFH
ET2 EQU 0ADH
TR2 EQU 0CAH ;T2��ؿ��ƼĴ����ĵ�ַ
RCLK EQU P3.5
SRCLK EQU P3.6 ;����ʱ�ӿڵ�ַ
;��Ź��������
MOV R0,#80H
MOV @R0,#3FH ;0
INC R0
MOV @R0,#06H ;1
INC R0
MOV @R0,#5BH ;2
INC R0
MOV @R0,#4FH ;3
INC R0
MOV @R0,#66H ;4
INC R0
MOV @R0,#6DH ;5
INC R0
MOV @R0,#7DH ;6
INC R0
MOV @R0,#07H ;7
INC R0
MOV @R0,#7FH ;8
INC R0
MOV @R0,#6FH ;9
INC R0
MOV @R0,#77H ;A
INC R0
MOV @R0,#7CH ;B
INC R0
MOV @R0,#39H ;C
INC R0
MOV @R0,#5EH ;D
INC R0
MOV @R0,#79H ;E
INC R0
MOV @R0,#71H ;F
;��ŵ����ֿ�
MOV R0,#90H
MOV @R0,#00H ;AWIN 90H
INC R0
MOV @R0,#3FH
INC R0
MOV @R0,#48H
INC R0
MOV @R0,#88H
INC R0
MOV @R0,#88H
INC R0
MOV @R0,#48H
INC R0
MOV @R0,#3FH
INC R0
MOV @R0,#00H
INC R0
MOV @R0,#00H ;BWIN 98H
INC R0
MOV @R0,#0FFH
INC R0
MOV @R0,#91H
INC R0
MOV @R0,#91H
INC R0
MOV @R0,#91H
INC R0
MOV @R0,#99H
INC R0
MOV @R0,#66H
INC R0
MOV @R0,#00H
INC R0
MOV @R0,#88H ;ƽ�� A0H
INC R0
MOV @R0,#0A8H
INC R0
MOV @R0,#98H
INC R0
MOV @R0,#0FFH
INC R0
MOV @R0,#0FFH
INC R0
MOV @R0,#98H
INC R0
MOV @R0,#0A8H
INC R0
MOV @R0,#88H
INC R0
MOV @R0,#69H ;0 A8H
INC R0
MOV @R0,#96H
INC R0
MOV @R0,#59H ;1 AAH
INC R0
MOV @R0,#0F1H
INC R0
MOV @R0,#9BH ;2 ACH
INC R0
MOV @R0,#0D9H
INC R0
MOV @R0,#9DH ;3 AEH
INC R0
MOV @R0,#0BFH
INC R0
MOV @R0,#6AH ;4 B0H
INC R0
MOV @R0,#0F2H
INC R0
MOV @R0,#9DH ;5 B2H
INC R0
MOV @R0,#0B9H
INC R0
MOV @R0,#6DH ;6 B4H
INC R0
MOV @R0,#0DAH
INC R0
MOV @R0,#89H ;7 B6H
INC R0
MOV @R0,#0ACH
INC R0
MOV @R0,#0FDH ;8 B8H
INC R0
MOV @R0,#0DFH
INC R0
MOV @R0,#5BH ;9 BAH
INC R0
MOV @R0,#0B6H
INC R0
MOV @R0,#7AH ;A BCH
INC R0
MOV @R0,#0A7H
INC R0
MOV @R0,#0F5H ;B BDH
INC R0
MOV @R0,#57H
INC R0
MOV @R0,#0F9H ;C C0H
INC R0
MOV @R0,#99H
INC R0
MOV @R0,#75H ;D C2H
INC R0
MOV @R0,#5FH
INC R0
MOV @R0,#0FBH ;E C4H
INC R0
MOV @R0,#0DDH
INC R0
MOV @R0,#0FAH ;F C6H
INC R0
MOV @R0,#0AAH
;�����������
MOV R0,#0CAH
MOV @R0,#0FEH ;��DO CAH
INC R0
MOV @R0,#2AH
INC R0
MOV @R0,#0FDH ;��SO CCH
INC R0
MOV @R0,#8AH
INC R0
MOV @R0,#0FCH ;��DO CEH
INC R0
MOV @R0,#4CH
INC R0
MOV @R0,#0FCH ;��RUI D0H
INC R0
MOV @R0,#0B4H
INC R0
MOV @R0,#0FDH ;��LA������ D2H
INC R0
MOV @R0,#0EFH
INC R0
MOV @R0,#0FEH ;��DO D4H
INC R0
MOV @R0,#2AH
INC R0
MOV @R0,#0FCH ;��LA D6H
INC R0
MOV @R0,#0C2H
INC R0
MOV @R0,#0FDH ;��LA������ D8H
INC R0
MOV @R0,#0EFH
INC R0
MOV @R0,#0FCH ;��LA DAH
INC R0
MOV @R0,#0C2H
INC R0
MOV @R0,#0FAH ;��MI DCH
INC R0
MOV @R0,#1DH
INC R0
MOV @R0,#0FCH ;��DO DEH
INC R0
MOV @R0,#4CH
;���ö�ʱ������ģʽ
MOV TMOD,#21H ;T0������ģʽ1��T1������ģʽ2
MOV TCON,#00H ;�����ⲿ�жϵ͵�ƽ����
MOV T2MOD,#00H
MOV T2CON,#02H ;������T2����ģʽ��16λ�Զ���װ�� 
;����һЩ��־λ
CLR 00H	;������ʼλ
CLR 01H	;��������λ
CLR 02H	;������ͣλ
CLR 03H ;��������λ
CLR 04H ;���������ʾλ 
CLR REN
;��ʼ���������Ϊ0
MOV 30H,#00H
MOV 31H,#00H
;�ж����ȼ�
MOV IP,#2AH
;���ж�
MOV IE,#00H
;���붨ʱ����ֵ
MOV TH2,#0F0H
MOV TL2,#5FH
MOV RLDH,#0F0H
MOV RLDL,#5FH ;T2
MOV TL1,#06H
MOV TH1,#06H ;T1
MOV TL0,0CBH
MOV TH0,0CAH ;T0
MOV 53H,#0FEH ;T0��ֵ
MOV 54H,#22H
MOV 40H,#00H ;��ձ������
MOV 55H,#0CAH ;���ֲ���
MOV 51H,#00H
LCALL MATRIX_SENDBYTE
SETB RCLK
CLR RCLK ;��յ���ȷ������������ɼ�
RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;�����������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ENTER_TIME:	;������λ���ĸ�λֵ�����0��R3~R6��,�����λ����0��R0-3λ
MOV R0,#03H
MOV @R0,#0
KEYBOARD_INPUT:
LCALL KEYBOARD_SCAN
CJNE R7,#77H,SECOND
CJNE R0,#07H,INPUT1
AJMP ILLEAGLE_INPUT
INPUT1:
MOV @R0,#1 ;����1
AJMP NUM_INPUT
SECOND:
CJNE R7,#7BH,THIRD
CJNE R0,#07H,INPUT2
AJMP ILLEAGLE_INPUT
INPUT2:
MOV @R0,#2 ;����2
AJMP NUM_INPUT
THIRD:
CJNE R7,#7DH,FORTH
CJNE R0,#07H,INPUT3
AJMP ILLEAGLE_INPUT
INPUT3:
MOV @R0,#3 ;����3
AJMP NUM_INPUT
FORTH:
CJNE R7,#7EH,FIFTH
CJNE R0,#03H,BACKSPACE
AJMP ILLEAGLE_INPUT
BACKSPACE:
DEC R0 ;�����˸�
AJMP ILLEAGLE_INPUT
FIFTH:
CJNE R7,#0B7H,SIXTH
CJNE R0,#07H,INPUT4
AJMP ILLEAGLE_INPUT
INPUT4:
MOV @R0,#4 ;����4
AJMP NUM_INPUT
SIXTH:
CJNE R7,#0BBH,SEVENTH
CJNE R0,#07H,INPUT5
AJMP ILLEAGLE_INPUT
INPUT5:
MOV @R0,#5 ;����5
AJMP NUM_INPUT
SEVENTH:
CJNE R7,#0BDH,EIGHTH
CJNE R0,#07H,INPUT6
AJMP ILLEAGLE_INPUT
INPUT6:
MOV @R0,#6 ;����6
AJMP NUM_INPUT
EIGHTH:
CJNE R7,#0D7H,NINTH
CJNE R0,#07H,INPUT7
AJMP ILLEAGLE_INPUT
INPUT7:
MOV @R0,#7 ;����7
AJMP NUM_INPUT
NINTH:
CJNE R7,#0DBH,TENTH
CJNE R0,#07H,INPUT8
AJMP ILLEAGLE_INPUT
INPUT8:
MOV @R0,#8 ;����8
AJMP NUM_INPUT
TENTH:
CJNE R7,#0DDH,ELEVENTH
CJNE R7,#07H,INPUT9
AJMP ILLEAGLE_INPUT
INPUT9:
MOV @R0,#9 ;����9
AJMP NUM_INPUT
ELEVENTH:
CJNE R7,#0EBH,TWELVETH
CJNE R0,#07H,INPUT0
AJMP ILLEAGLE_INPUT
INPUT0:
MOV @R0,#0 ;����0
AJMP NUM_INPUT
THIRTEEN:
CJNE R7,#0BEH,NEAR_ILLEAGLE_INPUT
MOV R0,#03H ;���
NEAR_ILLEAGLE_INPUT:
AJMP ILLEAGLE_INPUT
TWELVETH:
CJNE R7,#0EEH,THIRTEEN
CLR 01H
MOV 16H,#00H
MOV 17H,#00H
;����ȷ��
;����Ϸ�����ô��������8λ������2��R7�У���8λ�����2��R6��
;��λ�����0��R3~R6�У�λ��+3����0��R0��
CJNE R0,#07H,MAX_THREE_NUM
;����λ:R3:ǧλ R4:��λ R5:ʮλ R6:��λ
MOV B,#10
MOV A,R5
MUL AB
ADD A,R6
MOV 15H,A ;10��ʮλ+��λ����2��R5
MOV B,#100
MOV A,R4
MUL AB
ADD A,15H
XCH A,B
ADDC A,#00H
MOV 16H,A ;100����λ+10��ʮλ+��λ��8λ����2��R6
MOV 17H,B ;100����λ+10��ʮλ+��λ��8λ����2��R7
MOV B,#4
MOV A,R3
MUL AB
MOV B,#250
MUL AB
ADD A,17H
XCH A,B
ADDC A,16H
MOV 16H,A ;�������ݸ�8λ����2��R6
MOV 17H,B ;�������ݵ�8λ����2��R2
;ȥǰ����
MOV A,R3
JNZ GO_TO_RETURN_4
MOV A,R4
MOV R3,A
MOV A,R5
MOV R4,A
MOV A,R6
MOV R5,A
DEC R0
MOV A,R3
JZ EXCLUDE_ZERO_3
GO_TO_RETURN_4:
RET
MAX_THREE_NUM:
CJNE R0,#06H,MAX_TWO_NUM
;����λ:R3:��λ R4:ʮλ R5:��λ
MOV A,R4
MOV B,#10H
MUL AB
ADD A,R5
MOV 17H,A ;10��ʮλ+��λ����2��R7
MOV A,R3
MOV B,#100
MUL AB
ADD A,17H
XCH A,B
ADDC A,#00H
MOV 16H,A ;�������ݸ�8λ����2��R6
MOV 17H,B ;�������ݵ�8λ����2��R7
;ȥǰ����
EXCLUDE_ZERO_3:
MOV A,R3
JNZ GO_TO_RETURN_3
MOV A,R4
MOV R3,A
MOV A,R5
MOV R4,A
DEC R0
MOV A,R3
JZ EXCLUDE_ZERO_2
GO_TO_RETURN_3:
RET
MAX_TWO_NUM:
CJNE R0,#05H,MAX_ONE_NUM
;����λ:R3:ʮλ R4:��λ
MOV A,R3
MOV B,#10
MUL AB
ADD A,R4
MOV 16H,#00H ;�������ݸ�8λ����2��R6
MOV 17H,A ;�������ݵ�8λ����2��R7
;ȥǰ����
EXCLUDE_ZERO_2:
MOV A,R3
JNZ GO_TO_RETURN_2
MOV A,R4
MOV R3,A
DEC R0
GO_TO_RETURN_2:
RET
MAX_ONE_NUM:
CJNE R0,#04H,NO_NUMBER_INPUT
;��һλ:R3:��λ
MOV 16H,#00H ;�������ݸ�8λ����2��R6
MOV 17H,R3 ;�������ݵ�8λ����2��R7                                                                                                                                                                         
RET
NO_NUMBER_INPUT: ;û�����룬��������
AJMP ENTER_TIME
NUM_INPUT:
INC R0
ILLEAGLE_INPUT: ;������Ч
CLR 01H	;������������־λ
AJMP KEYBOARD_INPUT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;����ɨ�����;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
KEYBOARD_SCAN:
JB 01H,KEYBOARD_RETURN ;��һλɨ���������Ϣ��ûȡ�ߣ��ȴ�ȡ��
SCAN:
LCALL DISPLAY_NUMBER_CONTENT
MOV P1,#0FH ;�������ȫ0���������ȫ1
MOV A,P1 ;��������ֵ
CJNE A,#0FH,BUTTON_DOWN
AJMP SCAN
BUTTON_DOWN: ;��⵽�а������£���������
MOV P1,#0FH
LCALL DELAY_KEYBOARD
MOV A,P1 ;�ٴμ����û�а���
CJNE A,#0FH, REAL_BUTTON_DOWN ;��������
AJMP SCAN ;û�а������£���������ɨ��
REAL_BUTTON_DOWN:
MOV R7,A ;����0���б�������
MOV P1,#0F0H ;�������ȫ1���������ȫ0
MOV A,P1 ;��������ֵ
ORL A,R7 ;��ֱ�Ӽ�ֵ������R7
XCH A,R7
BUTTON_NOT_UP:
LCALL DISPLAY_NUMBER_CONTENT
MOV P1,#0FH ;��ʼ��ⰴť�Ƿ��ɿ�������
MOV A,P1
CJNE A,#0FH,BUTTON_NOT_UP ;������û���ɿ�
LCALL DELAY_KEYBOARD
MOV P1,#0FH
MOV A,P1
CJNE A,#0FH,BUTTON_NOT_UP
SETB 01H
KEYBOARD_RETURN:
RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;����ɨ����ʱ����;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DELAY_KEYBOARD:	;12305���������ڣ���ʱ12.305����
SETB RS0
SETB RS1
MOV R7,#60
DELAY_LOOP1:
MOV R6,#100
DELAY_LOOP2:
DJNZ R6,DELAY_LOOP2
DJNZ R7,DELAY_LOOP1
CLR RS0
CLR RS1
RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;';�����������ʾ�������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISPLAY_NUMBER_CONTENT:
;��������ͼ�ʱ��ʼ��
SETB RS0 ;���õ�ǰ�����Ĵ�����Ϊ1��
MOV R0,#32H
MOV R1,#7
INI_DISPLAY:
MOV @R0,#00H
INC R0
DJNZ R1,INI_DISPLAY
;����ļ�ʱ����������ʾ
MOV A,00H
CLR C
SUBB A,#03H
;1��R0���ڼ�¼��ǰ���λ
;1��R1���ڴ��ָ��
MOV R2,#33H ;1��R2���ڼ�¼�����βַ
MOV R3,#03H ;1��R3���ڼ�¼��ǰ���ĵ�ַ
MOV R4,A ;1��R4���ڼ�¼��ǰ�ж��ٸ���
XCH A,R2
ADD A,R2
XCH A,R2
JZ DISP_END
CALC_AND_PUT:
MOV A,#80H
MOV R1,0BH ;����ǰ���ĵ�ַ����R1
ADD A,@R1 ;������ĸ�λ
MOV R0,A
MOV A,@R0 ;���
MOV R1,0AH ;��Ŀ���ַ����R1
MOV @R1,A ;��Ŷ���
DEC R2
INC R3
DJNZ R4,CALC_AND_PUT ;ѭ���ż�ʱֵ
DISP_END:
JB 03H,HEX_TRANSLATE ;ѡ�����
TRANSFER_DIGIT:
;A�ӷ�������
MOV A,31H
MOV B,#10
DIV AB
ADD A,#80H ;������ʮλ
MOV R0,A
MOV A,@R0 ;���
MOV 39H,A ;����ʮλ�Ķ���
MOV A,B
ADD A,#80H ;�����ĸ�λ
MOV R0,A
MOV A,@R0 ;���
MOV 38H,A ;�����λ�Ķ���
;B�ӷ�������
MOV A,30H
MOV B,#10
DIV AB
ADD A,#80H ;������ʮλ
MOV R0,A
MOV A,@R0 ;���
MOV 33H,A ;����ʮλ�Ķ���
MOV A,B
ADD A,#80H
MOV R0,A
MOV A,@R0
MOV 32H,A ;�����λ�Ķ���
AJMP CALL_DISPLAY_FUNC
HEX_TRANSLATE:
;A�ӷ�������
MOV A,31H
MOV B,#16
DIV AB
ADD A,#80H ;������ʮλ
MOV R0,A
MOV A,@R0 ;���
MOV 39H,A ;����ʮλ�Ķ���
MOV A,B
ADD A,#80H ;�����ĸ�λ
MOV R0,A
MOV A,@R0 ;���
MOV 38H,A ;�����λ�Ķ���
;B�ӷ�������
MOV A,30H
MOV B,#16
DIV AB
ADD A,#80H ;������ʮλ
MOV R0,A
MOV A,@R0 ;���
MOV 33H,A ;����ʮλ�Ķ���
MOV A,B
ADD A,#80H
MOV R0,A
MOV A,@R0
MOV 32H,A ;�����λ�Ķ���
CALL_DISPLAY_FUNC:
CLR RS0 ;����0��
LCALL DISPLAY_NUM_TUBE ;��ʾ
RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;����ܶ�̬��ʾ����;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISPLAY_NUM_TUBE:
MOV P0,#00H ;���
MOV P2,#00H ;λѡ��һ�����
MOV P0,32H ;��ʾ32H��Ԫ������
LCALL DELAY_FOR_DIGIT_SHOW ;����ʱ
MOV P0,#00H ;�������
MOV P2,#04H ;λѡ�ڶ������
MOV P0,33H ;��ʾ33H��Ԫ������
LCALL DELAY_FOR_DIGIT_SHOW
MOV P0,#00H	;�������
MOV P2,#08H ;λѡ��������� 
MOV P0,34H ;��ʾ34H��Ԫ������
LCALL DELAY_FOR_DIGIT_SHOW
MOV P0,#00H	;�������
MOV P2,#0CH ;λѡ���������
MOV P0,35H ;��ʾ35H��Ԫ������
LCALL DELAY_FOR_DIGIT_SHOW
MOV P0,#00H	;�������
MOV P2,#10H ;λѡ��������� 
MOV P0,36H ;��ʾ36H��Ԫ������
LCALL DELAY_FOR_DIGIT_SHOW
MOV P0,#00H	;�������
MOV P2,#14H ;λѡ���������
MOV P0,37H ;��ʾ37H��Ԫ������
LCALL DELAY_FOR_DIGIT_SHOW
MOV P0,#00H	;�������
MOV P2,#18H ;λѡ���������
MOV P0,38H ;��ʾ38H��Ԫ������
LCALL DELAY_FOR_DIGIT_SHOW
MOV P0,#00H	;�������
MOV P2,#1CH ;λѡ�ڰ������
MOV P0,39H ;��ʾ39H��Ԫ������
LCALL DELAY_FOR_DIGIT_SHOW
RET

;;;;;;;;;;;;;;;;;;;;;;;����ܶ�̬��ʾ��ʱ����;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DELAY_FOR_DIGIT_SHOW:
MOV 52H,#21H
DIGIT_LOOP:
DJNZ 52H,DIGIT_LOOP
RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;������ʼ����;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
START_RACE:
SETB EA
SETB ET0
LCALL DISPLAY_NUMBER_CONTENT
;����Ƿ�ת������ P3.0
SETB P3.0
JB P3.0,CHECK_WHETHER_START
LCALL DELAY_KEYBOARD ;����
SETB P3.0
JB P3.0,CHECK_WHETHER_START
CPL 03H ;ת������
CPL TR0 ;ת��T0����״̬
TRANSFER_NOT_RELEASE:
LCALL DISPLAY_NUMBER_CONTENT
SETB P3.0
JNB P3.0,TRANSFER_NOT_RELEASE
LCALL DELAY_KEYBOARD ;����
SETB P3.0
JNB P3.0,TRANSFER_NOT_RELEASE
CHECK_WHETHER_START:
;��⿪ʼ������ť P3.1
SETB P3.1
JB P3.1,START_RACE ;������ʼ��ťû�а���
LCALL DELAY_KEYBOARD ;����
SETB P3.1
JB P3.1,START_RACE
;��ʼ�����������£�����ʱ��1��2�жϣ�������Ӽ��֣������ⲿ�жϣ�
SETB ET2
SETB ET1
SETB P1.0 ;׼����������
SETB P3.2 ;׼���Ʒ��ж�
SETB P3.3
CLR TR0 ;�رս��Ʒ���
CHECK_START_BUTTON_UP: ;��鿪ʼ��ť�Ƿ��ɿ�
LCALL DISPLAY_NUMBER_CONTENT
SETB P3.1
JNB P3.1,CHECK_START_BUTTON_UP
LCALL DELAY_KEYBOARD ;����
SETB P3.1
JNB P3.1,CHECK_START_BUTTON_UP
;��ʼ��ť�ɿ���������ʼ
SETB 00H ;���±�����ʼ��־λ
SETB TR2 ;��������������
SETB TR1 ;������ʱ������ʱ
SETB P3.0
SETB EX0 ;�������ӼƷ�
SETB EX1
CLR 02H ;���±�����ͣ��־λ
CLR 10H	;����A�Ӽӷֱ�־λ
CLR 11H ;����B�Ӽӷֱ�־λ
RET

;;;;;;;;;;;;;;;;;;;;;;;;;������;����;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SCAN_MATCH:
LCALL DISPLAY_NUMBER_CONTENT
JB P3.0,CHECK_A_TEAM ;�����ͣ���Ƿ���
SETB P3.0
LCALL DELAY_KEYBOARD ;����
JB P3.0,CHECK_A_TEAM ;û�а��£�����
CPL 02H
JNB 02H,CANCEL_PAUSE
CLR TR2	;��ʼ��ͣ
PAUSE_WAIT:
LCALL DISPLAY_NUMBER_CONTENT
SETB P3.0
JNB P3.0,PAUSE_WAIT
SETB P3.0
LCALL DELAY_KEYBOARD ;����
JNB P3.0,PAUSE_WAIT
AJMP CHECK_A_TEAM
CANCEL_PAUSE: ;ȡ����ͣ
LCALL DISPLAY_NUMBER_CONTENT
SETB P3.0
JNB P3.0,CANCEL_PAUSE
SETB P3.0
LCALL DELAY_KEYBOARD ;����
JNB P3.0,CANCEL_PAUSE
SETB TR2
CHECK_A_TEAM:
JNB 10H,CHECK_B_TEAM
LCALL TEAM_A_SCORE ;A�Ӽӷ�
CHECK_B_TEAM:
JNB 11H,CHECK_MATCH_END
LCALL TEAM_B_SCORE ;B�Ӽӷ�
CHECK_MATCH_END: ;�������Ƿ����
JB 00H,SCAN_MATCH
RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;T2�жϷ������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
T2INT:
CLR TF2
PUSH 0E0H ;�����ۼ�������
PUSH 0D0H ;����״̬��
JNB 00H,AFTER_RACE_TIMER
CLR RS0
CLR RS1 ;����0��
CJNE R0,#07H,TIME_THREE_DIGIT
;Ŀǰ��Ȼ����λ��
MOV A,R6 ;�����λ
JZ MINUS1 ;��λΪ0����Ҫ��λ
DEC R6
AJMP RETURNABLE
MINUS1:
MOV R6,#09H
MOV A,R5 ;����ʮλ
JZ MINUS2 ;ʮλΪ0����Ҫ��λ
DEC R5
AJMP RETURNABLE
MINUS2:
MOV R5,#09H
MOV A,R4 ;�����λ
JZ MINUS3 ;��λΪ0����Ҫ��λ
DEC R4
AJMP RETURNABLE
MINUS3:
MOV R4,#09H
DEC R3 ;����ǧλ
MOV A,R3
JNZ RETURNABLE
DEC R0 ;�����ֻʣ��λ�ˣ����������ƶ�
MOV A,R4
MOV R3,A
MOV A,R5
MOV R4,A
MOV A,R6
MOV R5,A
AJMP RETURNABLE
TIME_THREE_DIGIT:
CJNE R0,#06H,TIME_TWO_DIGIT
;Ŀǰ����λ��
MOV A,R5 ;�����λ
JZ MINUS4 ;��λΪ0����Ҫ��λ
DEC R5
AJMP RETURNABLE
MINUS4:
MOV R5,#09H
MOV A,R4 ;����ʮλ
JZ MINUS5 ;ʮλΪ0����Ҫ��λ
DEC R4
AJMP RETURNABLE
MINUS5:
MOV R4,#09H
DEC R3 ;�����λ
MOV A,R3
JNZ RETURNABLE
DEC R0 ;�����ֻʣ��λ�ˣ����������ƶ�
MOV A,R4
MOV R3,A
MOV A,R5
MOV R4,A
AJMP RETURNABLE
TIME_TWO_DIGIT:
CJNE R0,#05H,TIME_ONE_DIGIT
;Ŀǰ����λ��
MOV A,R4 ;�����λ
JZ MINUS6 ;��λΪ0����Ҫ��λ
DEC R4
AJMP RETURNABLE
MINUS6:
MOV R4,#09H
DEC R3 ;����ʮλ
MOV A,R3 
JNZ RETURNABLE
DEC R0 ;�����ֻʣһλ�ˣ����������ƶ�
MOV A,R4
MOV R3,A
AJMP RETURNABLE
TIME_ONE_DIGIT:
;Ŀǰ��һλ��
MOV A,R3 ;�����λ
JZ TIME_UP ;ʱ�䵽����������0�������
DEC R3
MOV A,R3
JZ TIME_UP ;�����ʱ�䵽
AJMP RETURNABLE
TIME_UP: ;ʱ�䵽��
CLR TR1 ;�ض�ʱ��
CLR 00H ;�������ʼλ
CLR 02H ;�������ͣλ
DEC R0
AJMP RETURNABLE
AFTER_RACE_TIMER:
SETB RS0 ;��3�������Ĵ���
SETB RS1
CPL 04H ;��ʾ״̬�ı�
JNB TR0,RETURNABLE ;T0����������ԭ��������
MOV A,55H ;���ֲ���ı�
CJNE A,#0DEH,NEXT_MUSIC
MOV 55H,#0CAH
AJMP READ_MUSIC
NEXT_MUSIC:
ADD A,#2
MOV 55H,A
READ_MUSIC:
MOV R0,55H
MOV R1,55H
INC R1
MOV 53H,@R0	;������
MOV 54H,@R1
RETURNABLE:
POP 0D0H ;�ָ�״̬��
POP 0E0H ;�ָ��ۼ���
RETI

;;;;;;;;;;;;;;;;;;;;;;;;;;;;T1�жϷ������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
T1INT:
CLR P1.0
SETB P1.0 ;��T2һ���ⲿ���壬ʹ�����
RETI

;;;;;;;;;;;;;;;;;;;;;;;;;;;;T0�жϷ������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
T0INT:
CPL P1.5 ;��������
MOV TH0,53H
MOV TL0,54H
RETI ;�õ�8����������

;;;;;;;;;;;;;;;;;;;;;;�ⲿ�ж�0�жϷ������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INT0INT:
CLR IE0 ;���жϱ�־λ
SETB 10H ;A�Ӽӷ���λ
RETI

;;;;;;;;;;;;;;;;;;;;;;;;;;;;A���÷ֳ���;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TEAM_A_SCORE: ;���µ�����������A���÷�
JB 02H,DO_NOT_ADD_A ;������ͣ
CLR 10H
LCALL DELAY_KEYBOARD ;����
JNB 10H,DO_NOT_ADD_A ;û�а���
CLR 10H
PUSH 0E0H ;�����ۼ���
MOV A,31H
JB 03H,A_ADDABLE ;ʮ��������������
CJNE A,#99,A_ADDABLE
MOV 31H,#00H ;�Ʒֵ���99�֣�����
AJMP A_NOT_ADDABLE_TREATED
A_ADDABLE:
INC 31H
A_NOT_ADDABLE_TREATED:
POP 0E0H ;�ָ��ۼ�������
SCAN_A:
LCALL DISPLAY_NUMBER_CONTENT
CLR 10H
JB 10H,SCAN_A
LCALL DELAY_KEYBOARD ;����
CLR 10H
JB 10H,SCAN_A
DO_NOT_ADD_A:
RET

;;;;;;;;;;;;;;;;;;;;;;�ⲿ�ж�1�жϷ������;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INT1INT:
CLR IE1 ;���жϱ�־λ
SETB 11H ;A�Ӽӷ���λ
RETI

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;B���÷ֳ���;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TEAM_B_SCORE: ;���µ��ĸ�������B���÷�
JB 02H,DO_NOT_ADD_B ;������ͣ
CLR 11H
LCALL DELAY_KEYBOARD ;����
JNB 11H,DO_NOT_ADD_B ;û�а���
PUSH 0E0H ;�����ۼ���
MOV A,30H
JB 03H,B_ADDABLE ;ʮ��������������
CJNE A,#99,B_ADDABLE
MOV 30H,#00H ;�Ʒֵ���99�֣�����
AJMP B_NOT_ADDABLE_TREATED
B_ADDABLE:
INC 30H
B_NOT_ADDABLE_TREATED:
POP 0E0H ;�ָ��ۼ�������
SCAN_B:
LCALL DISPLAY_NUMBER_CONTENT
CLR 11H
JB 11H,SCAN_B
LCALL DELAY_KEYBOARD ;����
CLR 11H
JB 11H,SCAN_B
DO_NOT_ADD_B:
RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;������������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
END_RACE:
CLR EX0
CLR EX1 ;��ֹ����
SETB TR1 ;��ʼ��ʱ����������
SETB TR0 ;��������
;�ж�˭Ӯ
MOV A,30H
CJNE A,31H,NEED_JUDGEMENT
MOV 40H,#10H ;ƽ��
AJMP JUDGE_END
NEED_JUDGEMENT:
CLR C
SUBB A,31H
JC JUDGE_END
MOV 40H,#08H ;B��Ӯ
JUDGE_END:
;��������ַ�
;Ӯ�Ķ��� (����41H~48H)
MOV R2,#08H
MOV R1,#41H
MOV A,#90H
ADD A,40H
MOV R0,A
MOVE_MATRIX_CONTENT1:
MOV A,@R0
MOV @R1,A
INC R1
INC R0
DJNZ R2,MOVE_MATRIX_CONTENT1
;���ӷ���������49H~50H��
JB 03H,HEX_MATRIX
MOV A,31H
MOV B,#10
DIV AB
MOV R5,A
ADD A,R5
ADD A,#0A8H
MOV R0,A ;A��ʮλ�����ַ
XCH A,B
MOV R5,A
ADD A,R5
ADD A,#0A8H
MOV R2,A ;A�Ӹ�λ�����ַ
MOV A,30H
MOV B,#10
DIV AB
MOV R5,A
ADD A,R5
ADD A,#0A8H
MOV R1,A ;B��ʮλ�����ַ
XCH A,B
MOV R5,A
ADD A,R5
ADD A,#0A8H
MOV R3,A ;B�Ӹ�λ�����ַ
AJMP PREPARE_MATRIX_CONTENT_LOOP
HEX_MATRIX:
MOV A,31H
MOV B,#16
DIV AB
MOV R5,A
ADD A,R5
ADD A,#0A8H
MOV R0,A ;A��ʮ��λ�����ַ
XCH A,B
MOV R5,A
ADD A,R5
ADD A,#0A8H
MOV R2,A ;A�Ӹ�λ�����ַ
MOV A,30H
MOV B,#16
DIV AB
MOV R5,A
ADD A,R5
ADD A,#0A8H
MOV R1,A ;B��ʮ��λ�����ַ
XCH A,B
MOV R5,A
ADD A,R5
ADD A,#0A8H
MOV R3,A ;B�Ӹ�λ�����ַ
PREPARE_MATRIX_CONTENT_LOOP:
MOV 08H,#49H ;1��R0ָ��Ŀ���ַ��ǰ��
MOV 09H,#4AH ;1��R1ָ��Ŀ���ַ����
MOV 0AH,#2 ;1��R2��ΪСѭ��������
MOV 0BH,#2 ;1��R3��Ϊ��ѭ��������
MATRIX_CONTENT_LOOP:
MOV A,@R0 ;����λ
MOV B,@R1
ANL A,#0FH
SWAP A
ANL B,#0FH
ORL A,B
SETB RS0
MOV @R1,A
INC R1
INC R1
CLR RS0
MOV A,@R1 ;ǰ��λ
MOV B,@R0
ANL A,#0F0H
SWAP A
ANL B,#0F0H
ORL A,B
SETB RS0
MOV @R0,A
INC R0
INC R0
CLR RS0
INC R0
INC R1
DJNZ 0AH,MATRIX_CONTENT_LOOP
MOV R0,02H
MOV R1,03H
MOV 0AH,#02H
DJNZ 0BH,MATRIX_CONTENT_LOOP
DISPLAY_MATCH_RESULT:
SETB P3.0 ;����Ƿ�Ҫ��������
JB P3.0,DISPLAY_MATRIX_CONTENT
LCALL DELAY_KEYBOARD ;����
SETB P3.0
JB P3.0,DISPLAY_MATRIX_LED
CPL TR0
CHECK_CHANGE_MUSIC_UP:
LCALL DISPLAY_MATRIX_LED
SETB P3.0
JNB P3.0,CHECK_CHANGE_MUSIC_UP
LCALL DELAY_KEYBOARD ;����
SETB P3.0
JNB P3.0,CHECK_CHANGE_MUSIC_UP 
DISPLAY_MATRIX_CONTENT: 
LCALL DISPLAY_MATRIX_LED
SETB P3.1 ;����Ƿ���ͷ��ʼ
JB P3.1,DISPLAY_MATCH_RESULT
LCALL DELAY_KEYBOARD ;����
SETB P3.1
JB P3.1,DISPLAY_MATCH_RESULT
MOV 51H,#00H
LCALL MATRIX_SENDBYTE ;�رյ�����ʾ
SETB RCLK
NOP
NOP
CLR RCLK
SCAN_RELEASE_RESET:
SETB P3.1
JB P3.1,SCAN_RELEASE_RESET
LCALL DELAY_KEYBOARD ;����
SETB P3.1
JB P3.1,SCAN_RELEASE_RESET
RET

;;;;;;;;;;;;;;;;;;;;;;LED������ʾ����;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISPLAY_MATRIX_LED:
SETB RS0 ;����1�������Ĵ���
JB 04H,SECOND_CONDITION
MOV R0,#41H
AJMP MATRIX_DISP_FUNC
SECOND_CONDITION:
MOV R0,#49H
MATRIX_DISP_FUNC:
CLR SRCLK
CLR RCLK ;��յ���ʱ��
MOV R5,#08H
MOV 56H,#7FH
MATRIX_DISP_LOOP:
MOV 51H,@R0
LCALL MATRIX_SENDBYTE
INC R0
MOV A,56H
MOV P0,A ;����λ��
RR A
MOV 56H,A
SETB RCLK ;��һ��������ʹ595�������
NOP
NOP
CLR RCLK
LCALL DELAY_FOR_DIGIT_SHOW ;����ʱ
MOV 51H,#00H ;�������
LCALL MATRIX_SENDBYTE
SETB RCLK ;��һ��������ʹ595���00H
NOP
NOP
CLR RCLK
LCALL DELAY_FOR_DIGIT_SHOW
DJNZ R5,MATRIX_DISP_LOOP
CLR RS0 ;����0��
RET

;;;;;;;;;;;;;;;;;;;;;;;HC595�����ֽڳ���;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MATRIX_SENDBYTE:
MOV A,51H
MOV B,#08H
SEND_BYTE_LOOP:
RLC A
MOV P3.4,C
SETB SRCLK ;���ߵ�ƽ����������
NOP
NOP
CLR SRCLK
DJNZ B,SEND_BYTE_LOOP
RET
END