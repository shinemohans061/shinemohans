t = 0:0.01:10;
dt = t(2) - t(1);
num = [1, 1];
den = [1, 4, 4];
response = zeros(1, length(t));
x1 = 0;
x2 = 0;

for i = 2:length(t)
    step_input = 1; 
    response(i) = (num(1) * step_input + num(2) * step_input - ...
                   den(2) * x1 - den(3) * x2) / den(1);
    x2 = x1;
    x1 = response(i);
end

figure;
plot(t, response);
title('Step Response of H(s) = (s + 1) / (s^2 + 4s + 4)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;
