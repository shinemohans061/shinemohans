t=0:0.000001:3;
x_t=sin(2*pi*t);
x_t(t>2)=NaN;
h_t=t;
h_t(t>1)=NaN;
figure;
subplot(2,1,1);
plot(t,x_t,'r',"LineWidth",1.5);
xlabel('Time (s)');
ylabel('Sin(2*pi*t)');
title('x(t) = sin(2*pi*t)');
grid on;
subplot(2,1,2);
plot(t,h_t,'b',"LineWidth",1.5);
xlabel('Time (s)');
ylabel('t');
title('h(t) = t');
grid on;