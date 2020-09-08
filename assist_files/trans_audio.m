%初始化
close all;
clear;
clc;

%文件清单
file_list=cell(1,7);
file_list{1}='do';
file_list{2}='do高八度';
file_list{3}='la';
file_list{4}='la升半音';
file_list{5}='mi低八度';
file_list{6}='rui';
file_list{7}='so';

%读入文件，合并声道并进行转换和保存
for audio_index=1:7
    chdir('D:\学习与工作\学习\学校的课\大二下\微机系统与接口课程设计\辅助程序\音乐实录数据\原始录音');
    [x,fs]=audioread([file_list{audio_index} '.wav']);
    merge_sound=sum(x,2);
    pole_value=max([max(merge_sound) min(abs(merge_sound))]);
    normalized_merge_sound=merge_sound./pole_value;
    audiowrite([file_list{audio_index} '_合并声道.wav'],normalized_merge_sound,fs);
    chdir('D:\学习与工作\学习\学校的课\大二下\微机系统与接口课程设计\辅助程序\音乐实录数据\mat录音');
    file_name=[file_list{audio_index} '.mat'];
    clear x pole_value merge_sound;
    save (file_name);
end

%回到原来的路径
chdir('D:\学习与工作\学习\学校的课\大二下\微机系统与接口课程设计\辅助程序');