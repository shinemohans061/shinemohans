numerator = [10 10];
denominator = [1 6 10];

zeros = roots(numerator);
poles = roots(denominator);

figure;
hold on;
plot(real(zeros), imag(zeros), 'go', 'MarkerSize', 10, 'DisplayName', 'Zeros');
plot(real(poles), imag(poles), 'rx', 'MarkerSize', 10, 'DisplayName', 'Poles');

text(real(zeros), imag(zeros), '  Zero (-1)', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', 'green');
text(real(poles(1)), imag(poles(1)), '  Pole (-3 + i)', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', 'red');
text(real(poles(2)), imag(poles(2)), '  Pole (-3 - i)', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', 'Color', 'red');

title('Pole-Zero Map of H(s) = 10(s + 1) / (s^2 + 6s + 10)');
xlabel('Real Part');
ylabel('Imaginary Part');
grid on;
axis equal;
legend show;
hold off;
