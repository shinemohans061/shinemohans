syms t tau;

x_t = sin(2 * pi * tau) * (tau >= 0 & tau < 2);
h_t = tau * (tau >= 0 & tau < 1);

y_t = int(x_t * subs(h_t, tau, t - tau), tau, 0, t);
y_t_func = matlabFunction(y_t, 'Vars', t);

x_t_func = matlabFunction(x_t, 'Vars', tau);
h_t_func = matlabFunction(h_t, 'Vars', tau);

t_vals = linspace(0, 3, 1000);

x_vals = arrayfun(@(tau) x_t_func(tau), t_vals);
h_vals = arrayfun(@(tau) h_t_func(tau), t_vals);
y_vals = zeros(size(t_vals));

for i = 1:length(t_vals)
    t_val = t_vals(i);
    if t_val < 1
        y_vals(i) = double(int(sin(2 * pi * tau) * tau, tau, 0, t_val));
    elseif t_val < 2
        y_vals(i) = double(int(sin(2 * pi * tau) * tau, tau, 0, 1));
    else
        y_vals(i) = double(int(sin(2 * pi * tau) * tau, tau, 0, 1));
    end
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
