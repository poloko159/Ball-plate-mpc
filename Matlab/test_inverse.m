function [phi1,phi2,phi3] = test_inverse(x,y)
%% init
a11 = 0;                
a12 = 120*0.0174533; 
a13 = -120*0.0174533;
% gound distances
R = 0.08; % m radius - motor ground
l1 = 0.025; % m, activate limb
l2 = 0.115; % m, passivate limb
high= 0.103;
r = 0.115; 

%% phi1 cal
GP1 = [r; 0; 0];
GP1 = rotx(x)*roty(y)*GP1;
GP1 = GP1 + [0;0;high];
A1 = 2*l1*cos(a11)*(-GP1(1) + R*cos(a11));
B1 = 2*l1*GP1(3)*cos(a11)*cos(a11);
C1 = GP1(1)^2-2*R*GP1(1)*cos(a11)+(cos(a11)^2)*(R^2+l1^2-l2^2+GP1(3)^2);
phi1=90-(atan(2*(-B1+sqrt(A1^2+B1^2-C1^2))/(C1-A1)))/0.017;

%% phi2 cal
GP2 = [-r/2 ; r*sqrt(3)/2; 0];
GP2 = rotx(x)*roty(y)*GP2;
GP2 = GP2 + [0;0;high];
A2 = 2*l1*cos(a12)*(-GP2(1) + R*cos(a12));
B2 = 2*l1*GP2(3)*cos(a12)*cos(a12);
C2 = GP2(1)^2-2*R*GP2(1)*cos(a12)+(cos(a12)^2)*(R^2+l1^2-l2^2+GP2(3)^2);
phi2=90-(atan(2*(-B2+sqrt(A2^2+B2^2-C2^2))/(C2-A2)))/0.017;

%% phi3 cal
GP3 = [-r/2; -r*sqrt(3)/2; 0];
GP3 = rotx(x)*roty(y)*GP3;
GP3 = GP3 + [0;0;high];
A3 = 2*l1*cos(a13)*(-GP3(1) + R*cos(a13));
B3 = 2*l1*GP3(3)*cos(a13)^2;
C3 = GP3(1)^2-2*R*GP3(1)*cos(a13)+(cos(a13)^2)*(R^2+l1^2-l2^2+GP3(3)^2);
phi3=90-(atan(2*(-B3+sqrt(A3^2+B3^2-C3^2))/(C3-A3)))/0.017;
end
