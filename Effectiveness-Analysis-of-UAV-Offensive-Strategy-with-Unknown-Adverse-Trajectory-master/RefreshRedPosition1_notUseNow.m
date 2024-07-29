%% 红方无人机策略，ABC为折线
function [x, y, a, b] = RefreshRedPosition1_notUseNow(p_b, p_r, t)

[A(1), A(2)] = Rotate(p_r(1:2) + [350*sin(4/7), 350-350*cos(4/7)], p_r(1:2), p_r(3:4));
[B(1), B(2)] = Rotate(p_r(1:2) + [350*sin(4/7), -350+350*cos(4/7)], p_r(1:2), p_r(3:4));
[C(1), C(2)] = Rotate(p_r(1:2) + [200, 0], p_r(1:2), p_r(3:4));
[O1(1), O1(2)] =Rotate(p_r(1:2) + [0, 350], p_r(1:2), p_r(3:4));
[O2(1), O2(2)] =Rotate(p_r(1:2) + [0, -350], p_r(1:2), p_r(3:4));
if t == 1
    [x3, y3] = node( A, C, p_b(t, 1:2), p_r(1:2) + p_r(3:4));
    [x4, y4] = node( B, C, p_b(t, 1:2), p_r(1:2) + p_r(3:4));
else
    [x3, y3] = node( A, C, p_b(t, 1:2), p_r(1:2));
    [x4, y4] = node( B, C, p_b(t, 1:2), p_r(1:2));
end

if size(x3, 1) ~= 0 && (x3 < p_r(1))
        x = x3;
        y = y3;
        a = (A(2)-C(2))/dist(A,C');
        b = (C(1)-A(1))/dist(A,C');
elseif size(x4, 1) ~= 0 && (x4 < p_r(1))
        x = x4;
        y = y4;
        a = (C(2)-B(2))/dist(B,C');
        b = (B(1)-C(1))/dist(B,C');
else
    k = sign(dist(O2, p_b(t,1:2)') - dist(O1, p_b(t,1:2)'));
    [A(1), A(2)] = Rotate(p_r(1:2) + [350*sin(4/7), k*(350-350*cos(4/7))], p_r(1:2), p_r(3:4));
    x = A(1);
    y = A(2);
    [a, b] = Rotate(p_r(3:4), [0, 0], [cos(k*4/7), sin(k*4/7)]);
end

end