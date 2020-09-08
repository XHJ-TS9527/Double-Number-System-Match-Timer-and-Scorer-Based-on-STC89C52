%初始化
close all;
clear;
clc;

%数据
x=1:5;
STC89C51=[0.90909 0.90909 0.90909 0.454545 0.454545];
STC89C52=ones(1,5);
IntelP8031AH=[0.820513 0.25 0.820513 0 0];
ArduinoUnoRev3=[0.008474 0.065128 0.008474 0.0661 0.0661];
MSP430F135=[0.122 0.099 0.122 0.19756 0.19756];
MCU=[STC89C51;STC89C52;IntelP8031AH;ArduinoUnoRev3;MSP430F135];

%作图
figure;
hold on;
for MCU_index=1:5
    plot(x,MCU(MCU_index,:),'LineWidth',1.5);
end
hold off;
legend('STC89C51','STC89C52','Intel P8031AH','Arduino Uno Rev3','MSP430F135');
axis([0 6 -0.005 1.025]);
xlabel('基准单片机型号编号');
ylabel('DEA效率');
box on;