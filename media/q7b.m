T = 2 * pi;
t = linspace(0, 2*T, 1000);

a0 = (1/T) * integral(@(t) (1 * (mod(t, T) < pi)) + (-1 * (mod(t, T) >= pi)), 0, T);

num_terms_list = [5, 10, 20];
x = @(t) (1 * (mod(t, T) < pi)) + (-1 * (mod(t, T) >= pi));

colors = {[0.3, 0.6, 0.9], [0.9, 0.4, 0.4], [0.4, 0.8, 0.4]};
input_color = [0.6, 0.6, 0.6];

for idx = 1:length(num_terms_list)
    num_terms = num_terms_list(idx);
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

    figure;
    plot(t, x(t), 'Color', input_color, 'LineWidth', 1, 'DisplayName', 'Square Wave');
    hold on;
    plot(t, x_approx, 'Color', colors{idx}, 'LineWidth', 2, 'DisplayName', sprintf('Fourier Approx. (%d terms)', num_terms));
    title(sprintf('Fourier Series Approximation with %d Terms', num_terms));
    xlabel('Time (t)');
    ylabel('Amplitude');
    legend show;
    grid on;
    hold off;
end
