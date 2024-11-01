syms t tau;

x_t = sin(2 * pi * tau) * (tau >= 0 & tau < 2);
h_t = tau * (tau >= 0 & tau < 1);

y_t = int(x_t * subs(h_t, tau, t - tau), tau, 0, t);

y_t_func = matlabFunction(y_t, 'Vars', t);

t_vals = linspace(0, 3, 1000);
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
plot(t_vals, y_vals, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('y(t)');
title('Exact Convolution y(t)');
grid on;
