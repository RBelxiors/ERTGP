clc 
close all
clear all
Lmin = 130e-9;
%PMOS
k0p = 1.46e-4;
vthp = 0.25;
n0p = 1.191;

%NMOS
k0n = 5.26e-4;
vthn = 0.3;
n0n = 1.114;

err_c = 0.01;
vin = 1.6;
vf = 0.8;
vout = (1-err_c)*vf;
vinL = 1.2;            %Vin lógico

Ro = 600;    %600ohm
C1 = 0.2e-9; %0.7nF
Fclk = 59e6;
T = 1/Fclk;



%S1 - PMOS (s/ Ro)

vsg1 = vin;
ront = -T/(C1*2*log(1-(vout/vf)));
Ws1 = Lmin/((ront/2)*k0p*(vsg1-vthp));

%S2 - Gate (Nmos/PMOS)

gons2 = 1/(2*ront);
rons2 = 1/gons2;
rons2p = rons2/2;
rons2n = rons2p;

vsg_s1p = vout;
vgs_s1n = vinL-vout;

Ws2p = Lmin/((rons2p)*k0p*(vsg_s1p-vthp));
Ws2n = Lmin/((rons2n)*k0n*(vgs_s1n-vthn));

%S3&S4 - NMOS/GATE

vgs_s3 = vinL;
vsg_s4p = vout;
vgs_s4n = vinL-vout;

ront = -T/(C1*2*log(1-(vout/vf)));
Ws4n = Lmin/((ront/2)*k0n*(vgs_s3-vthn));

gon_s4 = 1/(2*ront);
ron_s4 = 1/gon_s4;
ron_s4p = ron_s4/2;
ron_s4n = ron_s4p;

W_s3p = Lmin/((ron_s4p)*k0p*(vsg_s4p-vthp));
W_s3n = Lmin/((ron_s4n)*k0n*(vgs_s4n-vthn));


v_out= (2*C1*Ro*vin)./(4*C1*Ro+T);