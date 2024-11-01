numerator = [7];
denominator = [1, 3, 2];
H = tf(numerator, denominator);
figure;
impulse(H);
title('Impulse Response of H(s) = 7 / (s^2 + 3s + 2)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;
