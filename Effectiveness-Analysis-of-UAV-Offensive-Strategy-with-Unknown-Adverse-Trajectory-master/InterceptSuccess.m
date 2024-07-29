%% À¹½ØÌõ¼þ
function result = InterceptSuccess(p_b, p_r1, p_r2)
p_b = p_b(:);
p_r(1,1:2) = [p_r1(1), p_r1(2) + 100/sin(pi/5)]; 
p_r(2,1:2) = [p_r1(1)-100, p_r1(2)-100/tan(pi/5)]; 
p_r(3,1:2) = [p_r1(1)+100, p_r1(2)-100/tan(pi/5)]; 
p_r(4,1:2) = [p_r1(1)-200*sin(2*pi/5), p_r1(2)+100/sin(pi/5)-100*cos(2*pi/5)]; 
p_r(5,1:2) = [p_r1(1)+200*sin(2*pi/5), p_r1(2)+100/sin(pi/5)-100*cos(2*pi/5)]; 
p_r(6,1:2) = [p_r2(1), p_r2(2) + 100/sin(pi/5)]; 
p_r(7,1:2) = [p_r2(1)-100, p_r2(2)-100/tan(pi/5)]; 
p_r(8,1:2) = [p_r2(1)+100, p_r2(2)-100/tan(pi/5)]; 
p_r(9,1:2) = [p_r2(1)-200*sin(2*pi/5), p_r2(2)+100/sin(pi/5)-100*cos(2*pi/5)]; 
p_r(10,1:2) = [p_r2(1)+200*sin(2*pi/5), p_r2(2)+100/sin(pi/5)-100*cos(2*pi/5)]; 
count = 0;
global L;

for i = 1:10
    count = count + (dist(p_r(i,1:2),p_b(1:2))<=300);
end

if (count<2 || p_b(1)>L || p_b(2)<0 || p_b(1)<0)
    result = 0;
else
    result = 1;
end

end