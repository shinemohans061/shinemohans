syms t tau;

x_t = sin(2 * pi * tau) * (tau >= 0 & tau <= 5);
h_t = exp(-2*tau);

y_t = int(x_t * subs(h_t, tau, t - tau), tau, 0, t);
y_t_func = matlabFunction(y_t, 'Vars', t);

x_t_func = matlabFunction(x_t, 'Vars', tau);

t_vals = linspace(0, 10, 1000);

x_vals = arrayfun(@(tau) x_t_func(tau), t_vals);
h_vals = exp(-2*t_vals);

y_vals = zeros(size(t_vals));

for i = 1:length(t_vals)
    t_val = t_vals(i);
    y_vals(i) = double(y_t_func(t_val));
end

figure;
subplot(3,1,1);
plot(t_vals, x_vals, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('x(t)');
title('Signal x(t)');
grid on;

subplot(3,1,2);
plot(t_vals, h_vals, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('h(t)');
title('Impulse Response h(t)');
grid on;

subplot(3,1,3);
plot(t_vals, y_vals, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('y(t)');
title('Convolution y(t) = x(t) * h(t)');
grid on;
