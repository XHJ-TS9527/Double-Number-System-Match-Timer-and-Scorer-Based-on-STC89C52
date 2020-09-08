%初始化
close all;
clear;
clc;

%音频清单
audio_list=cell(1,7);
audio_list{1}='do';
audio_list{2}='do高八度';
audio_list{3}='la';
audio_list{4}='la升半音';
audio_list{5}='mi低八度';
audio_list{6}='rui';
audio_list{7}='so';

%处理音频
chdir('D:\学习与工作\学习\学校的课\大二下\微机系统与接口课程设计\辅助程序\音乐实录数据\mat录音');
for fft_audio_index=1:7
    audio_name=[audio_list{fft_audio_index} '.mat'];
    load (audio_name);
    clear audio_index file_list file_name audio_name;
    sample_period=1/fs;
    sample_num=1e3;
    sample_time=0:sample_period:(sample_num-1)*sample_period;
    sample_audio=normalized_merge_sound(1:sample_num);
    om=0:sample_num/2;
    frequency=om*fs/sample_num;
    smaller_frequency=find(frequency<=1100);
    spectrum=fft(sample_audio,sample_num);
    magnitude=abs(spectrum(om+1));
    phase=angle(spectrum(om+1));
    figure;
    plot(frequency,magnitude,'b','LineWidth',1.5);
    xlabel('频率/Hz','fontsize',15);
    ylabel('频率分量模','fontsize',15);
    axis([0 1100 0 max(magnitude(smaller_frequency))]);
end

%转换回路径
chdir('D:\学习与工作\学习\学校的课\大二下\微机系统与接口课程设计\辅助程序');