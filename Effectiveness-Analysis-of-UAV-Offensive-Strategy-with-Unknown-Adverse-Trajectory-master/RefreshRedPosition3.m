%% 红方无人机策略，ABC换为曲线，飞行路径为圆弧
function [x, y, a, b] = RefreshRedPosition3(p_b, p_r, t)

if abs(p_r(1)-p_b(t,1))>10000 %距离大于10000预测飞行，小于10000径直拦截
    p_b(t,1) = 50000;
end

[x, y, a, b] = R2B(p_r, p_b(t,:));

end