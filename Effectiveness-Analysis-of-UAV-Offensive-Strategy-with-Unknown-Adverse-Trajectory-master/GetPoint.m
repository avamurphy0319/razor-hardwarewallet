%% 获取ABC上的点
function [x, y, a, b] = GetPoint(p_b, p_r, t)
global R;
global V;
global A;
A = p_b(1);
global B;
B = p_b(2);
if t == 1
    z_r = fzero(@myfun1, [R, 200000]);
else
    z_r = fzero(@myfun2, [R, 200000]);
end
x = z_r*sin(V/z_r);
y = t * (z_r-z_r*cos(V/z_r));
a = (z_r - abs(y))/z_r;
b = t*x/z_r;
[x, y] = Rotate([x, y], [0, 0],p_r(3:4));
[a, b] = Rotate([a, b], [0, 0],p_r(3:4));
x = x + p_r(1);
y = y + p_r(2);
end