function f = myfun1(z)
global A
global B
global V
f = z.*sin(V./z)/A-(z-z.*cos(V./z))/B;

end