clc
close all

vin = 1.6;
vout = 0.79; 
err_c = (0.8-vout)/vout;

Ro = 200:100:2e3;           %De 200 a 2e3ohm
C1 = 0.1e-9:0.01e-9:0.8e-9;   %De 0.1 a 0.8nF

[s,size_r] = size(Ro);
[s,size_c] = size(C1);

for i=1:size_r
    for j=1:size_c  
        Fclk(j) = (vout)/(2*Ro(i)*C1(j)*(vin-2*vout));
    end
%     plot(C1.*10^9, Fclk*10^-6)
%     title('Frequency vs Ro and C1')
%     xlabel('C1 (nF)')
%     ylabel('Frequency (MHz)')
%     %legend(sprintf('%s', num2str(Ro(i))))
%     hold on
    
    plot(C1.*10^-9, eficiency)
    hold on
end


