%% Ðý×ª
function [x, y] = Rotate(A, C, R)

x = (A(1) - C(1)).*R(1) - (A(2) - C(2)).*R(2) + C(1);
y = (A(1) - C(1)).*R(2) + (A(2) - C(2)).*R(1) + C(2);

end