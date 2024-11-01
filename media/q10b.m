T = 2*pi;              
t = linspace(0, T, 1000); 
N_terms = [5, 10, 20]; 

x = zeros(size(t));
for i = 1:length(t)
    if t(i) >= 0 && t(i) <= pi
        x(i) = sin(t(i));
    elseif t(i) > pi && t(i) <= T
        x(i) = 0;
    end
end

figure;
plot(t, x, 'LineWidth', 1.5);
title('Half-Wave Rectified Sine Wave x(t)');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;

for N = N_terms
    a0 = 0; 
    an = zeros(1, N); 
    bn = zeros(1, N); 
    
    for n = 1:N
        an(n) = (1/pi) * integral(@(t) half_wave_rectified_sine_wave(t) .* cos(n*t), 0, T);
        bn(n) = (1/pi) * integral(@(t) half_wave_rectified_sine_wave(t) .* sin(n*t), 0, T);
    end
    
    x_approx = a0/2; 
    for n = 1:N
        x_approx = x_approx + an(n) * cos(n*t) + bn(n) * sin(n*t);
    end
    
    figure;
    plot(t, x_approx, 'LineWidth', 1.5);
    hold on;
    plot(t, x, 'r--', 'LineWidth', 1); 
    title(['Fourier Series Approximation with ', num2str(N), ' Terms']);
    xlabel('Time (t)');
    ylabel('Amplitude');
    legend('Approximation', 'Original Half-Wave Rectified Sine Wave');
    grid on;
end

function y = half_wave_rectified_sine_wave(t)
    T = 2*pi; 
    y = zeros(size(t));
    for i = 1:length(t)
        if mod(t(i), T) >= 0 && mod(t(i), T) <= pi
            y(i) = sin(mod(t(i), T));
        else
            y(i) = 0;
        end
    end
end
