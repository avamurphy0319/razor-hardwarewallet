clear all,clc
global L
global M
global B
global A
global R
global V
global BTemp
global Gird
L = 50000;%攻击纵深
M = 70000;%通道宽度
Gird = 500;

% SuccessAttack(x_s, y_s, 3, 2, 1)
% 当蓝色从(x_s, y_s) 出发时，蓝色策略三，红色策略二的仿真图
result1 = AvaliableArea(1, 3, 0);
result2 = AvaliableArea(3, 3, 0);%蓝色策略三，红色策略二的可通过区域图
result = result1 + result2;

figure(1)
hold on
rectangle('Position', [0,0,L,M], 'EdgeColor', 'b', 'FaceColor','b');
for x_s = Gird:Gird:L
    for y_s = Gird:Gird:M
        if result(x_s/Gird, y_s/Gird) == 0
            figure(1)
            hold on
            rectangle('Position', [x_s-Gird,y_s-Gird,Gird,Gird], 'EdgeColor', 'r', 'FaceColor','r');
        elseif result(x_s/Gird, y_s/Gird) == 2
            figure(1)
            hold on
            rectangle('Position', [x_s-Gird,y_s-Gird,Gird,Gird], 'EdgeColor', 'g', 'FaceColor','g');
        end
    end
end

