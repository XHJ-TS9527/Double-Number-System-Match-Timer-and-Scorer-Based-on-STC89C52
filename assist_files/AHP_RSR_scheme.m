%��ʼ��
close all;
clear;
clc;

%����
R=[2 3 1 1 1 1 3 3 1 1;...
       3 1.5 3 2 2.5 3 2 2 3 2.5;...
       1 1.5 2 3 2.5 2 1 1 2 2.5]; %�Ⱦ���
A=[1 4 1/7 4 4 1/5 4 4 1/9 4;...
       1/4 1 1/7 1 1/2 1/5 1/2 1/3 1/9 2;...
       7 7 1 7 7 3 7 7 1/5 7;...
       1/4 1 1/7 1 1/2 1/5 1 1/3 1/9 2;...
       1/4 2 1/7 2 1 1/5 2 1/3 1/9 2;...
       5 5 1/3 5 5 1 5 5 1/7 5;...
       1/4 2 1/7 1 1/2 1/5 1 1/3 1/9 2;...
       1/4 3 1/7 3 3 1/5 3 1 1/9 3;...
       9 9 5 9 9 7 9 9 1 9;...
       1/4 1/2 1/7 1/2 1/2 1/5 1/2 1/3 1/9 1]; %�жϾ���
[samples,paras]=size(R); %�Ⱦ����С
   
%���жϾ������һ���Լ���
[eig_vectors,eigs]=eig(A);
eigs=abs(diag(eigs));
max_eig=max(eigs);
CI=(max_eig-10)/9;
RI=1.49;
CR=CI/RI;
if CR>=0.1
    error('��ͨ������һ���Լ��飡');
end

%����Ȩ������
index=find(eigs==max_eig);
correspond_vector=real(eig_vectors(:,index));
weight_vector=correspond_vector/sum(correspond_vector);

%�����Ȩ�Ⱥͱ�
RSRW=R*weight_vector/(samples*paras);