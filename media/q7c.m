T = 2 * pi;
num_terms = 10;
t = linspace(0, 2*T, 1000);

a0 = (1/T) * integral(@(t) (1 * (mod(t, T) < pi)) + (-1 * (mod(t, T) >= pi)), 0, T);
n = 1:num_terms;

an = zeros(size(n));
bn = zeros(size(n));

for k = n
    an(k) = (1/T) * integral(@(t) ((1 * (mod(t, T) < pi)) + (-1 * (mod(t, T) >= pi))) .* cos(k * (2*pi/T) * t), 0, T);
    bn(k) = (1/T) * integral(@(t) ((1 * (mod(t, T) < pi)) + (-1 * (mod(t, T) >= pi))) .* sin(k * (2*pi/T) * t), 0, T);
end

x_approx = a0 / 2 * ones(size(t));

for k = n
    x_approx = x_approx + an(k) * cos(k * (2*pi/T) * t) + bn(k) * sin(k * (2*pi/T) * t);
end

x = @(t) (1 * (mod(t, T) < pi)) + (-1 * (mod(t, T) >= pi));

% Plot the original square wave
figure;
plot(t, x(t), 'k', 'LineWidth', 1.5);
title('Square Wave');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;

% Plot the cosine terms
figure;
hold on;
for k = 1:num_terms
    plot(t, an(k) * cos(k * (2*pi/T) * t), 'DisplayName', sprintf('a_%d(t)', k));
end
title('Cosine Terms');
xlabel('Time (t)');
ylabel('Amplitude');
legend show;
grid on;
hold off;

% Plot the sine terms
figure;
hold on;
for k = 1:num_terms
    plot(t, bn(k) * sin(k * (2*pi/T) * t), 'DisplayName', sprintf('b_%d(t)', k));
end
title('Sine Terms');
xlabel('Time (t)');
ylabel('Amplitude');
legend show;
grid on;
hold off;

% Plot the a_0/2 term
figure;
yline(a0/2, 'b--', 'DisplayName', 'a_0/2', 'LineWidth', 1.5);
title('Constant Term a_0/2');
xlabel('Time (t)');
ylabel('Amplitude');
legend show;
grid on;

% Plot the total Fourier series approximation
figure;
hold on;
plot(t, x_approx, 'r', 'DisplayName', 'Fourier Series Approximation', 'LineWidth', 1.5);
yline(a0/2, 'b--', 'DisplayName', 'a_0/2', 'LineWidth', 1.5);
title('Total Fourier Series Approximation');
xlabel('Time (t)');
ylabel('Amplitude');
legend show;
grid on;
hold off;
