%% 蓝方无人机策略，判断红方无人机飞行方向
function [x, y, x1, y1] = RefreshBluePosition2_notUseNow(p_b, p_r1, p_r2, t)

if (p_b(1)>p_r1(t,1) && p_b(1)>p_r2(t,1)) || t==1
    [x, y, x1, y1] = RefreshBluePosition1(p_b, p_r1, p_r2, t);
    return
end
global M;
global L;
d1 = abs(p_r1(t,2)-p_b(2));
d2 = abs(p_r2(t,2)-p_b(2));
if d1<=d2
    p_r = p_r1;
else
    p_r = p_r2;
end

k = (p_r(t, 2)-p_r(t-1, 2)) / (p_r(t, 1)-p_r(t-1, 1));
y_c = k*(L-p_r(t, 1))+p_r(t, 2);
if y_c<0
    y_c = 0;
elseif y_c>M
    y_c = M;
end
[x, y, x1, y1] = R2B(p_b, [L, y_c]);

end