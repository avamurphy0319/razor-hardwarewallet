%% 蓝方无人机策略，判断CG1、DG2
function [x, y, x1, y1] = RefreshBluePosition2(p_b, p_r1, p_r2, t)
global M;
global L;
global BTemp;

if  min(dist(p_b(1:2), p_r1(t,1:2)'), dist(p_b(1:2), p_r2(t,1:2)'))>10000 
    p_r = (p_r1(t,1:2) + p_r2(t,1:2))./2;
    [x, y, x1, y1] = R2B(p_b, p_r);
    return
end

if  p_b(1)>p_r1(t,1)&&p_b(1)>p_r2(t,1)
    [x, y, x1, y1] = RefreshBluePosition1(p_b, p_r1, p_r2, t);
    return
end

if BTemp(1) == 0
    d1 = dist(p_r1(t,1:2), [L, M]');
    d2 = dist(p_r2(t,1:2), [L, 0]');
    if d1<d2
        BTemp = [L, 0];
    elseif d1>d2
        BTemp = [L, M];
    else
        if abs(p_b(2)-p_r1(t, 2)) > abs(p_b(2)-p_r2(t, 2))
            BTemp = [L, 0];
        else
            BTemp = [L, M];
        end
    end
end
[x, y, x1, y1] = R2B(p_b, BTemp);

end