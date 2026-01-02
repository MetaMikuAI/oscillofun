[data,fs]=audioread('oscillofun-wave.wav'); %导入音频

high=size(data);
high(2)=[];     %求音频数据量长度
FBS=30;         %设置帧率
ans_=0;         %起始值
count=0;        %帧数
d=0.7;
d_=[-d,d,-d,d]; %显示范围
clear y;        %预先清除y以防冲突（有没有用咱也不知道来着）
K=[-1,-1];       %方向系数oscillofun->[-1,0],Badapple->[-1，-1]（貌似）
data(:,1)=K(1)*data(:,1);
data(:,2)=K(2)*data(:,2);   %根据K改一下方向
while (ans_<high)
    for n=1:fs/FBS
        y(n,:)=data(n+ans_,:);
    end
    pause(0.02);
    clf;
    plot(y(:,1),y(:,2),'g.');
    axis(d_);
    title('Oscillofun');
    ans_=ans_+n;
    fprintf('%g%%\n',ans_/high*100);    %输出完成率
%     print(gcf,'-dpng',['E:\MATLAB\MATLAB\bin\wenjian\oscillofun\jpg\',num2str(count),'.jpg']);
    %输出jpg文件（根据需要可取消注释）
    count=count+1;
    pause(0.01)        %停顿

end
