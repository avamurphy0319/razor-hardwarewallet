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


figure(3)
SuccessAttack(500, 25000, 2, 3, 1)
figure(4)
SuccessAttack(500, 25000, 2, 1, 1)
figure(5)
SuccessAttack(500, 25000, 1, 3, 1)
figure(6)
SuccessAttack(500, 500, 1, 3, 1)
