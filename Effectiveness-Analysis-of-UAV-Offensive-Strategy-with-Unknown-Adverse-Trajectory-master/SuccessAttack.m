%% ·ÂÕæ
function result = SuccessAttack(x_s, y_s, BlueFunction, RedFunction, DrawPicture)
global V;
global R;
global BTemp
p_b = zeros(360,4);
p_r1 = zeros(360,4);
p_r2 = zeros(360,4);
p_b(1, 1 : end) = [x_s, y_s, 1, 0];
p_r1(1, 1 : end) = [50000. 50000, -1, 0];
p_r2(1, 1 : end) = [50000. 20000, -1, 0];
result = 0;
BTemp = [0, 0];
for t = 1:359
    
    if(InterceptSuccess(p_b(t,:), p_r1(t,:),  p_r2(t,:)))
        break;
    elseif(BreakthroughSuccess(p_b(t,:)))
        result = 1;
        break;
    end
    
    R = 350;
    V = 200;
    switch RedFunction
        case 1
            [p_r1(t+1,1), p_r1(t+1,2), p_r1(t+1,3), p_r1(t+1,4)] = RefreshRedPosition1(p_b, p_r1(t,:), t);
            [p_r2(t+1,1), p_r2(t+1,2), p_r2(t+1,3), p_r2(t+1,4)] = RefreshRedPosition1(p_b, p_r2(t,:), t);
        case 2
            [p_r1(t+1,1), p_r1(t+1,2), p_r1(t+1,3), p_r1(t+1,4)] = RefreshRedPosition2(p_b, p_r1(t,:), t);
            [p_r2(t+1,1), p_r2(t+1,2), p_r2(t+1,3), p_r2(t+1,4)] = RefreshRedPosition2(p_b, p_r2(t,:), t);
        case 3
            [p_r1(t+1,1), p_r1(t+1,2), p_r1(t+1,3), p_r1(t+1,4)] = RefreshRedPosition3(p_b, p_r1(t,:), t);
            [p_r2(t+1,1), p_r2(t+1,2), p_r2(t+1,3), p_r2(t+1,4)] = RefreshRedPosition3(p_b, p_r2(t,:), t);
        otherwise
            msgbox('No such Function.', 'Error','error');
    end
    R = 500;
    V = 250;
    switch BlueFunction
        case 1
            [p_b(t+1,1), p_b(t+1,2), p_b(t+1,3), p_b(t+1,4)]= RefreshBluePosition1(p_b(t,:), p_r1, p_r2, t);
        case 2
            [p_b(t+1,1), p_b(t+1,2), p_b(t+1,3), p_b(t+1,4)]= RefreshBluePosition2(p_b(t,:), p_r1, p_r2, t);
        otherwise
            msgbox('No such Function.', 'Error','error');
    end
    
%     if DrawPicture == 1
%         hold on
%         figure(1)
%         plot(p_r1(t+1,1),p_r1(t+1,2),'rs');
%         quiver(p_r1(t+1,1),p_r1(t+1,2),p_r1(t+1,3),p_r1(t+1,4));
%         plot(p_r2(t+1,1),p_r2(t+1,2),'gp');
%         quiver(p_r2(t+1,1),p_r2(t+1,2),p_r2(t+1,3),p_r2(t+1,4));
%         plot(p_b(t+1,1),p_b(t+1,2),'bd');
%         quiver(p_b(t+1,1),p_b(t+1,2),p_b(t+1,3),p_b(t+1,4));
%     end
    %    fortest(p_r1,p_b,t)
end

if DrawPicture == 1
    hold on
    plot(p_r1(1:t,1), p_r1(1:t,2), 'r.', 'MarkerIndices', 1:5:t, 'linewidth',1.5)
    plot(p_r2(1:t,1), p_r2(1:t,2), 'g-', 'MarkerIndices', 1:5:t, 'linewidth',1.5)
    plot(p_b(1:t,1), p_b(1:t,2), 'b-.', 'MarkerIndices', 1:5:t, 'linewidth',1.5)
end
end