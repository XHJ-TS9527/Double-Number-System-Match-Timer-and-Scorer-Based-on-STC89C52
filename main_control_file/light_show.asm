PUBLIC DISPLAY_NUM_TUBE
EXTRN CODE (DELAY_FOR_DIGIT_SHOW)
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
END