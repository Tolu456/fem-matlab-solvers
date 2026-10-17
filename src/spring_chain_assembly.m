kn = [1, 1, 1];
Fapp_2 = 10;

n = length(kn);
K = zeros(n + 1);

K(1, 1) = kn(1);
K(1, 2) = -kn(1);
K(2, 1) = -kn(1);
K(2, 2) = kn(1) + kn(2) + kn(3);
K(2, 3) = -kn(2);
K(2, 4) = -kn(3);
K(3, 2) = -kn(2);
K(3, 3) = kn(2);
K(4, 2) = -kn(3);
K(4, 4) = kn(3);

d = [0; nan; 0; 0];
F = [0; Fapp_2; 0; 0];

adof = find(isnan(d));
d(adof) = K(adof, adof) \ F(adof);
F = K * d;

disp('Displacements:');
disp(d);
disp('Forces:');
disp(F);
