% ��ͼ
figure
axis off
set(gcf,'menubar','none')
for n=1:100
text(rand,rand,'��',...
    'color',rand(1,3),...
    'Rotation',360*rand,...
    'fontsize',20+30*rand,...
    'fontname','����')
pause(.3)
end