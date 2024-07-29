%% 画可通过区域图
function DrawAreaPicture(result)
global M
global L
global Gird

f = waitbar(0,'1','Name','Calculating Avaliable Areas ...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
figure(1)
hold on
rectangle('Position', [0,0,L,M], 'EdgeColor', 'b', 'FaceColor','b');
for x_s = Gird:Gird:L
    for y_s = Gird:Gird:M
        %         if(result(x_s/Gird, y_s/Gird) == 1)
        %             figure(1)
        %             hold on
        %             rectangle('Position', [x_s-Gird,y_s-Gird,Gird,Gird], 'EdgeColor', 'b', 'FaceColor','b');
        if(result(x_s/Gird, y_s/Gird) == 0)
            figure(1)
            hold on
            rectangle('Position', [x_s-Gird,y_s-Gird,Gird,Gird], 'EdgeColor', 'r', 'FaceColor','r');
        end
        waitbar((M*(x_s-Gird)+y_s*Gird)*100/(L*M),f,sprintf('%12.2f',valueofpi))
    end
end
delete(f)

end