PUBLIC DISPLAY_NUMBER_CONTENT
EXTRN CODE (DISPLAY_NUM_TUBE)
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
MOV R1,0AH
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
LCALL DISPLAY_NUM_TUBE
RET
END