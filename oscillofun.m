[data,fs]=audioread('E:\MATLAB\MATLAB\bin\wenjian\oscillofun\oscillofun-wave.wav'); %������Ƶ

high=size(data);
high(2)=[];     %����Ƶ����������
FBS=30;         %����֡��
ans_=0;         %��ʼֵ
count=0;        %֡��
d=0.7;
d_=[-d,d,-d,d]; %��ʾ��Χ
clear y;        %Ԥ�����y�Է���ͻ����û������Ҳ��֪�����ţ�
K=[-1,-1];       %����ϵ��oscillofun->[-1,0],Badapple->[-1��-1]��ò�ƣ�
data(:,1)=K(1)*data(:,1);
data(:,2)=K(2)*data(:,2);   %����K��һ�·���
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
    fprintf('%g%%\n',ans_/high*100);    %��������
%     print(gcf,'-dpng',['E:\MATLAB\MATLAB\bin\wenjian\oscillofun\jpg\',num2str(count),'.jpg']);
    %���jpg�ļ���������Ҫ��ȡ��ע�ͣ�
    count=count+1;
    pause(0.01)        %ͣ��
end