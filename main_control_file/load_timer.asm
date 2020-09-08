PUBLIC LOAD_IN_TIMER
LOAD_IN_TIMER: ;计时数据高8位放在R1，低8位放在R2
;进行乘法，计算方法参见报告书
;计算完毕后R3放高8位，R4放中高8位，R5放中低8位，R6放低8位
;计算定时器初值低8位
MOV A,R2
MOV B,#40H
MUL AB
MOV R6,A ;存放低8位
MOV 18H,B ;16^0次项计算高8位暂存3区R0
MOV A,R2
MOV B,#42H
MUL AB
MOV 19H,A ;16^2次项第一分项计算低8位暂存3区R1
MOV 1AH,B ;16^2次项第一分项计算高8位暂存3区R2
MOV A,R1
MOV B,#40H
MOV 1BH,A ;16^2次项第二分项计算低8位暂存3区R3
MOV 1CH,B ;16^2次项第二分项计算高8位暂存3区R4
MOV A,R2
MOV B,#0FH
MUL AB
MOV 11H,A ;16^4次项第一分项计算低8位暂存2区R1
MOV 12H,B ;16^4次项第一分项计算高8位暂存2区R2
MOV A,R1
MOV B,#42H
MUL AB
MOV 13H,A ;16^4次项第二分项计算低8位暂存2区R3
MOV 14H,B ;16^4次项第二分项计算高8位暂存2区R4
MOV A,R1
MOV B,#0FH
MUL AB
MOV 15H,A ;16^6次项低8位暂存2区R5
MOV 16H,B ;16^6次项高8位暂存2区R6(事实上这没用，因为一定是0)
;计算中低8位
MOV 17H,#00H ;进位辅助寄存器
MOV A,18H
ADD A,19H
XCH A,17H
ADDC A,#00H	;记进位
XCH A,17H
ADD A,1BH
XCH A,17H
ADDC A,#00H ;记进位
MOV R5,17H ;存放中低8位
MOV 17H,#00H
;计算中高8位
ADD A,1AH
XCH A,17H
ADDC A,#00H ;记进位
XCH A,17H
ADD A,1CH
XCH A,17H
ADDC A,#00H ;记进位
XCH A,17H
ADD A,11H
XCH A,17H
ADDC A,#00H ;记进位
XCH A,17H
ADD A,13H
XCH A,17H
ADDC A,#00H	;记进位
MOV R4,17H ;存放中高8位
MOV 17H,#00H
;计算高8位
ADD A,12H
ADD A,14H
ADD A,15H
MOV R3,A ;存放高8位
;计算定时器初值
CLR C
MOV A,#0FFH
SUBB A,R6
MOV TL0,A ;低8位初值
MOV A,#0FFH
SUBB A,R5
MOV TH0,A ;中低8位初值
MOV A,#0FFH
SUBB A,R4
MOV TL1,A ;中高8位初值
MOV A,#0FFH
SUBB A,R3
MOV TH1,A ;高8位初值
RET
END