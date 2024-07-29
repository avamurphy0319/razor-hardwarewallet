function result = AvaliableArea(BlueFunction, RedFunction, DrawPicture)
%% 遍历每一种情况
global M
global L
global Gird

result = zeros(L/Gird,M/Gird);
f = waitbar(0,'1','Name','Calculating Avaliable Areas ...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

for x_s = Gird:Gird:L
    for y_s = Gird:Gird:M
        if(SuccessAttack(x_s-0.5*Gird, y_s-0.5*Gird, BlueFunction, RedFunction, 0))
            result(x_s/Gird, y_s/Gird) = 1;
        end
        waitbar((M*(x_s-Gird)+y_s*Gird)/(L*M),f,sprintf('%12.2f',(M*(x_s-Gird)+y_s*Gird)/(L*M)))
    end
    %fprintf('仿真进度：%.2f%%.\n', (M*(x_s-Gird)+y_s*Gird)*100/(L*M));
end

delete(f)

if DrawPicture == 1
    DrawAreaPicture(result)
end

end