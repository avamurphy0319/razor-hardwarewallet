%% �췽���˻����ԣ�ABC��Ϊ���ߣ�����·��ΪԲ��
function [x, y, a, b] = RefreshRedPosition3(p_b, p_r, t)

if abs(p_r(1)-p_b(t,1))>10000 %�������10000Ԥ����У�С��10000��ֱ����
    p_b(t,1) = 50000;
end

[x, y, a, b] = R2B(p_r, p_b(t,:));

end