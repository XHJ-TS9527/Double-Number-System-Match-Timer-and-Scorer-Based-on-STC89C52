%��ʼ��
close all;
clear;
clc;

%��������
left_time=0:9999;
error_time=zeros(size(left_time));

%����ʱ��
for index=1:1e4
    t=left_time(index);
    if t==0
        error_time(index)=22;
    elseif t==1
        error_time(index)=26;
    elseif t<9
        error_time(index)=21;
    elseif t==10
        error_time(index)=27;
    elseif t<1e2
        if mod(t,10)==0
            error_time(index)=22;
        else
            error_time(index)=21;
        end
    elseif t==100
        error_time(index)=28;
    elseif t<1e3
        if mod(t,100)==0
            error_time(index)=20;
        elseif mod(t,10)==0
            error_time(index)=18;
        else
            error_time(index)=14;
        end
    elseif t==1e3
        error_time(index)=41;
    else
        if mod(t,1e3)==0
            error_time(index)=26;
        elseif mod(t,1e2)==0
            error_time(index)=25;
        elseif mod(t,10)==0
            error_time(index)=21;
        else
            error_time(index)=17;
        end
    end
end

%����ƽ�����
mean_error=mean(error_time);
disp(['ƽ����' num2str(mean_error) '����������']);
median_error=median(error_time);
disp(['��ֵ��' num2str(median_error) '����������']);

%�����ۼ����
accumulate_error_time=zeros(size(error_time));
for index=1:1e4
    accumulate_error_time(index)=sum(error_time(1:index));
end

%��ͼ
scatter(left_time,error_time,'bo','MarkerFaceColor','b');
xlabel('ʣ��ʱ��/s','fontsize',13);
ylabel('����ʱ���/����������','fontsize',13);
hold on;
plot(left_time,mean_error*ones(size(left_time)),'g--','LineWidth',2.5);
plot(left_time,median_error*ones(size(left_time)),'y-.','LineWidth',1.9);
hold off;
le=legend('�������','ƽ�����','�����ֵ');
set(le,'fontsize',13);
grid on;
box on;
figure;
plot(left_time,accumulate_error_time/1e6,'b','LineWidth',1.5);
xlabel('ʣ��ʱ��/s','fontsize',13);
ylabel('�����ʱ��/s','fontsize',13);