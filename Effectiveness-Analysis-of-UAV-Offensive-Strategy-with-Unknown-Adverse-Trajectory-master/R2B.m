function [x, y, a, b] = R2B(p_r, p_b)
global R
global V
theta = V/R;

p_b(1:2) = p_b(1:2) - p_r(1:2);
[p_b(1), p_b(2)] = Rotate(p_b(1:2), [0, 0], [p_r(3),p_r(4)].*[1,-1]);
k2 = sign(p_b(1));

if p_b(1) == 0 
    k = sign(p_b(2))*k2;
    if k==0
        k=k2;
    end
    [x, y] = Rotate(p_r(1:2) + [R*sin(theta), k*(R-R*cos(theta))], p_r(1:2), p_r(3:4));
    [a, b] = Rotate(p_r(3:4), [0, 0], [cos(k*theta), sin(k*theta)]);
elseif  abs(p_b(2)/p_b(1))< 0.001 && k2>0
    x = p_r(1) + V*p_r(3);
    y = p_r(2) + V*p_r(4);
    a = p_r(3);
    b = p_r(4);
elseif abs(p_b(2)/p_b(1)) <= ((R-R*cos(theta))/(R*sin(theta))) && k2>0
    [x,y,a,b] = GetPoint(p_b, p_r, sign(p_b(2)/p_b(1)));
else
    k = sign(p_b(2)/p_b(1))*k2;
    if k==0
        k=1*k2;
    end
    [x, y] = Rotate(p_r(1:2) + [R*sin(theta), k*(R-R*cos(theta))], p_r(1:2), p_r(3:4));
    [a, b] = Rotate(p_r(3:4), [0, 0], [cos(k*theta), sin(k*theta)]);
end

end