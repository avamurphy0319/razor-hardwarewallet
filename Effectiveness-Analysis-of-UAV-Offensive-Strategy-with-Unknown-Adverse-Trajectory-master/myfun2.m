function f = myfun2(z)
global A
global B
global V
f = z.*sin(V./z)/A+(z-z.*cos(V./z))/B;

end