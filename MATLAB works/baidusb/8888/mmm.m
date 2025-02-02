% Meyervm

figure

[~,p,t]=wavefun('meyr',6);%mexh guas1 guas2 Morlet,

subplot(221)
[~,I]=max(p);
t=t(1:end-3);
p=p(1:end-3);
dt=t(31);
t=t-dt;

plot(t,p)

n=t(2)-t(1);
title(['2-norm:',num2str(p*p'*n,'%4.3f'),...
    '     sum(p)=',num2str(sum(p),'%4.3f')])
subplot(222)
fb=1/(t(2)-t(1))/2;
fs=1/(t(end)+t(2)-2*t(1));
f=-fb:fs:fb;
if length(f)~=length(p)
    f(end)=[];
end
% f(end)=[];
% m=length(p);
% chipz=czt(p,m,exp(-j*pi/m/2),1);
% plot(f/4,abs(chipz))
fmag=fftshift(abs(fft(p)));
[y,x]=max(fmag);
plot(f,fmag)
hold on
% plot(f(x),y,'ro')
% text(f(x)+.5,y+.8,['\psi(\omega)/\omega=',num2str(y/f(x),'%4.2f')]);
% text(f(x)+.5,y,['\psi(\omega)=',num2str(y,'%4.2f')]);
% text(f(x)+.5,y-.8,['\psi(\omega)*\omega=',num2str(y*f(x),'%4.2f')]);

tn=cumprod(repmat(t,4,1),1);
ptn=repmat(p,4,1).*tn;
subplot(425)
plotyy(t,ptn(1,:),f,fftshift(abs(fft(ptn(1,:))))/5)
title(['sum(f)=',num2str(sum(ptn(1,:)),'%4.3f')]);
subplot(426)
plotyy(t,ptn(2,:),f,fftshift(abs(fft(ptn(2,:))))/10)
title(['sum(f)=',num2str(sum(ptn(2,:)),'%4.3f')]);
subplot(427)
plotyy(t,ptn(3,:),f,fftshift(abs(fft(ptn(3,:))))/15)
title(['sum(f)=',num2str(sum(ptn(3,:)),'%4.3f')]);
subplot(428)
plotyy(t,ptn(4,:),f,fftshift(abs(fft(ptn(4,:))))/20)
title(['sum(f)=',num2str(sum(ptn(4,:)),'%4.3f')]);