function [x,C]=korigovanje_polozaja(x,C,Q,map)

N = [];
e = 1;

for k = 1 : size(map,1)
%     na ovom mestu (umesto predict_measurements_with_lihgt_sensors() ) 
% stavite vasu funkciju koja predvidja merenja
    [xs,ys,Hp] = predvidjanje_merenja(x(1), x(2), x(3));
    zp=[xs;ys];
    z = map(k,:)';
    S= Hp*C*Hp' + Q;
    %     very very very simple association....
    nis= (z-zp)'*inv(S)*(z-zp);
    N = [N;nis];
%     if nis<=e
%         nbest=nis
%     else
%         nbest=[];
   % end
end
nbest=min(N)
if nbest<=e
% if ~isempty(nbest)
% 
j = find(nbest==N);

    Z = map(j,:)';
    [x, C] = EKF_update_light_sensors(x, C, Z, zp, Hp, Q);
    disp('uradio sam korekciju')
end
return
