%初始化
close all;
clear;
clc;

%数据
R=[2 3 1 1 1 1 3 3 1 1;...
       3 1.5 3 2 2.5 3 2 2 3 2.5;...
       1 1.5 2 3 2.5 2 1 1 2 2.5]; %秩矩阵
A=[1 4 1/7 4 4 1/5 4 4 1/9 4;...
       1/4 1 1/7 1 1/2 1/5 1/2 1/3 1/9 2;...
       7 7 1 7 7 3 7 7 1/5 7;...
       1/4 1 1/7 1 1/2 1/5 1 1/3 1/9 2;...
       1/4 2 1/7 2 1 1/5 2 1/3 1/9 2;...
       5 5 1/3 5 5 1 5 5 1/7 5;...
       1/4 2 1/7 1 1/2 1/5 1 1/3 1/9 2;...
       1/4 3 1/7 3 3 1/5 3 1 1/9 3;...
       9 9 5 9 9 7 9 9 1 9;...
       1/4 1/2 1/7 1/2 1/2 1/5 1/2 1/3 1/9 1]; %判断矩阵
[samples,paras]=size(R); %秩矩阵大小
   
%对判断矩阵进行一致性检验
[eig_vectors,eigs]=eig(A);
eigs=abs(diag(eigs));
max_eig=max(eigs);
CI=(max_eig-10)/9;
RI=1.49;
CR=CI/RI;
if CR>=0.1
    error('不通过满意一致性检验！');
end

%计算权重向量
index=find(eigs==max_eig);
correspond_vector=real(eig_vectors(:,index));
weight_vector=correspond_vector/sum(correspond_vector);

%计算加权秩和比
RSRW=R*weight_vector/(samples*paras);