% Material and Geometry Properties
E = 30e6;  % Young's Modulus in psi
A = 2;     % Cross-sectional Area in square inches
L = 12;    % Length of each segment in inches

% Force Values for Each Node
F = [1440; 2880; 4320; 5760; 3360];  
% Global Stiffness Matrix
K = (A * E / L) * [2 -1  0  0  0;
                  -1  2 -1  0  0;
                   0 -1  2 -1  0;
                   0  0 -1  2 -1;
                   0  0  0 -1  1];

% Deflection Calculations
d = K \ F;            % Solve for deflections
d_total = [0; d];     % Include the boundary condition d_1 = 0

% Stress Calculations for Each Segment
stress = zeros(5, 1);  % Preallocate stress array

for i = 1:5
    stress(i) = E * ([-1/L 1/L] * [d_total(i); d_total(i + 1)]);
end

% Display Results
disp('Node Deflections (inches):');
disp(d_total);

disp('Stresses in Each Segment (psi):');
disp(stress);

% Material and Geometry Properties
E = 30e6;  % Young's Modulus in psi
A = 2;     % Cross-sectional Area in square inches
L = 20;    % Length of each segment in inches

% Force Values for Each Node
F = [4000; 8000; 5333.33];  % Force values in pounds

% Global Stiffness Matrix
K = (A * E / L) * [2 -1  0;
                  -1  2 -1;
                   0 -1  1];

% Deflection Calculations
d = K \ F;            % Solve for deflections
d_total = [0; d];     % Include the boundary condition d_1 = 0

% Stress Calculations for Each Segment
stress = zeros(3, 1);  % Preallocate stress array

for i = 1:3
    stress(i) = E * ([-1/L 1/L] * [d_total(i); d_total(i + 1)]);
end

% Display Results
disp('Node Deflections (inches):');
disp(d_total);

disp('Stresses in Each Segment (psi):');
disp(stress);
