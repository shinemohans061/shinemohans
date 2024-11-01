t=0:0.0001:10;
x_t=(t>=0)&(t<5);
figure;
plot(t,x_t,'LineWidth',2);
xlabel('Time (S)');
ylabel('Amplitude');
title('x(t)');
grid on;