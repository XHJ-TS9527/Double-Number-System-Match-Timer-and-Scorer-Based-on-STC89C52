PUBLIC LOAD_IN_TIMER
LOAD_IN_TIMER: ;��ʱ���ݸ�8λ����R1����8λ����R2
;���г˷������㷽���μ�������
;������Ϻ�R3�Ÿ�8λ��R4���и�8λ��R5���е�8λ��R6�ŵ�8λ
;���㶨ʱ����ֵ��8λ
MOV A,R2
MOV B,#40H
MUL AB
MOV R6,A ;��ŵ�8λ
MOV 18H,B ;16^0��������8λ�ݴ�3��R0
MOV A,R2
MOV B,#42H
MUL AB
MOV 19H,A ;16^2�����һ��������8λ�ݴ�3��R1
MOV 1AH,B ;16^2�����һ��������8λ�ݴ�3��R2
MOV A,R1
MOV B,#40H
MOV 1BH,A ;16^2����ڶ���������8λ�ݴ�3��R3
MOV 1CH,B ;16^2����ڶ���������8λ�ݴ�3��R4
MOV A,R2
MOV B,#0FH
MUL AB
MOV 11H,A ;16^4�����һ��������8λ�ݴ�2��R1
MOV 12H,B ;16^4�����һ��������8λ�ݴ�2��R2
MOV A,R1
MOV B,#42H
MUL AB
MOV 13H,A ;16^4����ڶ���������8λ�ݴ�2��R3
MOV 14H,B ;16^4����ڶ���������8λ�ݴ�2��R4
MOV A,R1
MOV B,#0FH
MUL AB
MOV 15H,A ;16^6�����8λ�ݴ�2��R5
MOV 16H,B ;16^6�����8λ�ݴ�2��R6(��ʵ����û�ã���Ϊһ����0)
;�����е�8λ
MOV 17H,#00H ;��λ�����Ĵ���
MOV A,18H
ADD A,19H
XCH A,17H
ADDC A,#00H	;�ǽ�λ
XCH A,17H
ADD A,1BH
XCH A,17H
ADDC A,#00H ;�ǽ�λ
MOV R5,17H ;����е�8λ
MOV 17H,#00H
;�����и�8λ
ADD A,1AH
XCH A,17H
ADDC A,#00H ;�ǽ�λ
XCH A,17H
ADD A,1CH
XCH A,17H
ADDC A,#00H ;�ǽ�λ
XCH A,17H
ADD A,11H
XCH A,17H
ADDC A,#00H ;�ǽ�λ
XCH A,17H
ADD A,13H
XCH A,17H
ADDC A,#00H	;�ǽ�λ
MOV R4,17H ;����и�8λ
MOV 17H,#00H
;�����8λ
ADD A,12H
ADD A,14H
ADD A,15H
MOV R3,A ;��Ÿ�8λ
;���㶨ʱ����ֵ
CLR C
MOV A,#0FFH
SUBB A,R6
MOV TL0,A ;��8λ��ֵ
MOV A,#0FFH
SUBB A,R5
MOV TH0,A ;�е�8λ��ֵ
MOV A,#0FFH
SUBB A,R4
MOV TL1,A ;�и�8λ��ֵ
MOV A,#0FFH
SUBB A,R3
MOV TH1,A ;��8λ��ֵ
RET
END