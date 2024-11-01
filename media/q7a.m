% Parameters
T = 2 * pi;        % Period of the square wave
N = 10;            % Number of terms in the Fourier series
t = linspace(0, T, 1000); % Time vector for one period

% Define the square wave function
x_t = @(t) (t < pi) * 1 + (t >= pi & t < 2*pi) * -1;

% Fourier series approximation
x_approx = zeros(size(t));

% Compute Fourier series terms
for k = 1:2:N    % Only odd terms contribute
    bk = (4 / (k * pi)) * sin(k * pi / 2); % Fourier coefficient for square wave
    x_approx = x_approx + bk * sin(k * 2 * pi * t / T);
end

% Plot the original square wave and Fourier series approximation
figure;
plot(t, x_t(mod(t, T)), 'k', 'LineWidth', 1.5); % Original square wave
hold on;
plot(t, x_approx, 'r--', 'LineWidth', 1.5);     % Fourier series approximation
xlabel('t');
ylabel('x(t)');
legend('Original square wave', 'Fourier series approximation');
title(['Fourier Series Approximation with N = ' num2str(N) ' Terms']);
grid on;
