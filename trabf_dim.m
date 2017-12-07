clc
close all

vin = 1.6;
err_c = 0.01;
vout = (1-err_c)*0.8;

Ro = 200:100:2e3;           %De 200 a 2e3ohm
C1 = 0.1e-9:0.01e-9:0.8e-9;   %De 0.1 a 0.8nF

[s,size_r] = size(Ro);
[s,size_c] = size(C1);

for i=1:size_r
    for j=1:size_c  
        Fclk(j) = (vout)/(2*Ro(i)*C1(j)*(vin-2*vout));
     
    end
     plot(C1.*10^9, Fclk*10^-6, 'DisplayName', num2str(C1(i)))
     title('Frequency vs Ro and C1')
     xlabel('C1 (nF)')
     ylabel('Frequency (MHz)')
     %legend(sprintf('%s', num2str(Ro(i))))
     hold on
    
    %plot(C1.*10^-9, eficiency)
    %hold on
end

%%

Ro = 600;
C1 = 0.2e-9;
Fclk = 1e4:1000:0.5*1e9;

figure
n_eficiency = (4*C1*Ro)./(4*C1*Ro+(1./Fclk));
semilogx(Fclk, n_eficiency);
grid on
title('Efficiency of the converter')
xlabel('F_c_l_k (H_z)')
ylabel('Efficiency')

%%

vin = 1.6;

Ro = 200:100:2e3;
C1 = 0.7e-9;
Fclk = 10e4:1e6:1e9;

vout = 1/(2+(1/(2*Fclk*Ro*C1)))


