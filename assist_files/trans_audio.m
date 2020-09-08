%��ʼ��
close all;
clear;
clc;

%�ļ��嵥
file_list=cell(1,7);
file_list{1}='do';
file_list{2}='do�߰˶�';
file_list{3}='la';
file_list{4}='la������';
file_list{5}='mi�Ͱ˶�';
file_list{6}='rui';
file_list{7}='so';

%�����ļ����ϲ�����������ת���ͱ���
for audio_index=1:7
    chdir('D:\ѧϰ�빤��\ѧϰ\ѧУ�Ŀ�\�����\΢��ϵͳ��ӿڿγ����\��������\����ʵ¼����\ԭʼ¼��');
    [x,fs]=audioread([file_list{audio_index} '.wav']);
    merge_sound=sum(x,2);
    pole_value=max([max(merge_sound) min(abs(merge_sound))]);
    normalized_merge_sound=merge_sound./pole_value;
    audiowrite([file_list{audio_index} '_�ϲ�����.wav'],normalized_merge_sound,fs);
    chdir('D:\ѧϰ�빤��\ѧϰ\ѧУ�Ŀ�\�����\΢��ϵͳ��ӿڿγ����\��������\����ʵ¼����\mat¼��');
    file_name=[file_list{audio_index} '.mat'];
    clear x pole_value merge_sound;
    save (file_name);
end

%�ص�ԭ����·��
chdir('D:\ѧϰ�빤��\ѧϰ\ѧУ�Ŀ�\�����\΢��ϵͳ��ӿڿγ����\��������');