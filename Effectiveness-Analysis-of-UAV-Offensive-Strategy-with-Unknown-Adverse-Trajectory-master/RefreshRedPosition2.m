%% 红方无人机策略，ABC换为曲线，飞行路径为圆弧
function [x, y, a, b] = RefreshRedPosition2(p_b, p_r, t)

p_b(t,1) = 50000;

[x, y, a, b] = R2B(p_r, p_b(t,:));

end