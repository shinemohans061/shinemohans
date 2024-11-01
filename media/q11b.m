% Define the system parameters
a = 4; 
b = 8; 
c = 5; 

% Define the time span for the simulation
tspan = [0 10]; 

% Define the initial conditions
initial_conditions = [0; 0];  % [y(0), dy/dt(0)]

% Define the input function u(t)
u = @(t) 1 * (t >= 0);  % Step input

% Define the differential equation
ode = @(t, y) [y(2); (c * u(t) - a * y(2) - b * y(1))];

% Solve the differential equation using ode45
[t, y] = ode45(ode, tspan, initial_conditions);

% Plot the step response
figure;
plot(t, y(:,1), 'LineWidth', 1.5);
title('Step Response of the System');
xlabel('Time (t)');
ylabel('Output y(t)');
grid on;
