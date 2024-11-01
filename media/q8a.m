clear; clc;

T = 2 * pi; 
t = linspace(-2 * pi, 2 * pi, 1000); 
x_t = t / pi; 

N_terms = [5, 10, 20]; 

% Plot the original sawtooth wave
figure;
plot(t, mod(x_t + pi, T) - pi, 'k', 'LineWidth', 1.5);
xlabel('Time (t)');
ylabel('Amplitude');
title('Original Sawtooth Wave');
grid on;
axis([-2 * pi 2 * pi -1.5 1.5]);

for j = 1:length(N_terms)
    N = N_terms(j);
    fourier_approx = zeros(size(t));
    
    a0 = 0; 
    an = zeros(1, N);
    bn = zeros(1, N);

    for n = 1:N
        an(n) = (1/pi) * integral(@(t) (t/pi) .* cos(n * t), -pi, pi);
        bn(n) = (1/pi) * integral(@(t) (t/pi) .* sin(n * t), -pi, pi);
    end

    for n = 1:N
        fourier_approx = fourier_approx + an(n) * cos(n * t) + bn(n) * sin(n * t);
    end

    figure;
    plot(t, fourier_approx, 'b', 'LineWidth', 1.5);
    xlabel('Time (t)');
    ylabel('Amplitude');
    title(sprintf('Fourier Series Approximation (N=%d)', N));
    grid on;
    axis([-2 * pi 2 * pi -1.5 1.5]);
end
