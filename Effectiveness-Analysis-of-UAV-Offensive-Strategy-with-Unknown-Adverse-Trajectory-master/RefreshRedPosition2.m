%% �췽���˻����ԣ�ABC��Ϊ���ߣ�����·��ΪԲ��
function [x, y, a, b] = RefreshRedPosition2(p_b, p_r, t)

p_b(t,1) = 50000;

[x, y, a, b] = R2B(p_r, p_b(t,:));

end