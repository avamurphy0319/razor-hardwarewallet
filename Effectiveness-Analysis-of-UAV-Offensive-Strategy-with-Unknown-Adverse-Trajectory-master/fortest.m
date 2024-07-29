%% ≤‚ ‘
function fortest(p_r, p_b, t)
global R
global V
theta = V/R;

[A(1), A(2)] = Rotate(p_r(t,1:2) + [V*sin(theta), V-V*cos(theta)], p_r(t,1:2), p_r(t,3:4));
[B(1), B(2)] = Rotate(p_r(t,1:2) + [V*sin(theta), -V+V*cos(theta)], p_r(t,1:2), p_r(t,3:4));
[C(1), C(2)] = Rotate(p_r(t,1:2) + [R, 0], p_r(t,1:2), p_r(t,3:4));

figure(1)
hold on
line([A(1); C(1)], [A(2); C(2)])
line([B(1); C(1)], [B(2); C(2)])
line([p_b(t,1);p_r(t,1)], [p_b(t,2);p_r(t,2)])
rectangle('Position',[p_r(t,1)-R p_r(t,2)-R 2*R 2*R],'Curvature',[1,1])
plot(p_r(t+1,1),p_r(t+1,2))

end