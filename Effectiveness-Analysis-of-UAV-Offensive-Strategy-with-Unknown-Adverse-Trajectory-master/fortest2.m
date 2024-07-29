%% ≤‚ ‘
function fortest2(p_b)
global V;
global R;
V = 200;
R = 350;
theta = V/R;
figure(2)
z = R:0.01:200000;
x = z.*sin(V./z);
y = z-z.*cos(V./z);
plot(x,y)
xlim([0,V])
ylim([0,R-R*cos(theta)])
hold on
a = 0:1:V;
b = (p_b(2)/p_b(1)).*a;
plot(a,b);

end
