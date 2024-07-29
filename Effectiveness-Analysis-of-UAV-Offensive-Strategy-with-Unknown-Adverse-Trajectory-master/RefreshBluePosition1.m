%% 蓝方无人机策略,直飞
function [x, y, x1, y1] = RefreshBluePosition1(p_b, p_r1, p_r2, t)
global V;
x = p_b(1) + V;
y = p_b(2);
x1 = x - p_b(1);
y1 = y - p_b(2);
x1 = x1/norm([x1,y1]);
y1 = y1/norm([x1,y1]);
end