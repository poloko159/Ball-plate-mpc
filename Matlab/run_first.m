<<<<<<< HEAD

%% model init
Ts=1/20;
g=9.81;
mb= 0.01;
rb=0.016;
Jb=2*mb*(rb^3)/5;
Gb=mb/(mb+(Jb/(rb^2)));
Nc = 3;

%% matrix init
Ac=[0 1 0 0;0 0 -g*Gb 0;0 0 0 1;0 0 0 0];
Bc=[0;0;0;1];
Cc=[1 0 0 0];
Dc=zeros(1,1);
Conti_model = ss(Ac,Bc,Cc,Dc);
[Ad,Bd,Cd,Dd]=c2dm(Ac,Bc,Cc,Dc,Ts);
%% MPC y
Np = 1/Ts;
Qy = 0.00001;
Ry = 190;
[G,V,~,~] = imgpc_predmat(Ad,Bd,Cd,Dd,Np);
Hy = (G'*Qy*G+Ry);
yy = [0.15;0;0;0];
w = zeros(Np,1);
gg=(V*yy-w)'*Qy*G;
hhhy = quadprog(Hy,gg);

%% MPC x

Qx = 0.00001;
Rx = 460;
Hx = (G'*Qx*G+Rx);
xx = [0.2;0;0;0];
w = zeros(Np,1);
gg=(V*xx-w)'*Qx*G;
hhhx = quadprog(Hx,gg);
hhhx(1)
=======

%% model init
Ts=1/20;
g=9.81;
mb= 0.01;
rb=0.016;
Jb=2*mb*(rb^3)/5;
Gb=mb/(mb+(Jb/(rb^2)));
Nc = 3;

%% matrix init
Ac=[0 1 0 0;0 0 -g*Gb 0;0 0 0 1;0 0 0 0];
Bc=[0;0;0;1];
Cc=[1 0 0 0];
Dc=zeros(1,1);
Conti_model = ss(Ac,Bc,Cc,Dc);
[Ad,Bd,Cd,Dd]=c2dm(Ac,Bc,Cc,Dc,Ts);
%% MPC y
Np = 1/Ts;
Qy = 0.00001;
Ry = 190;
[G,V,~,~] = imgpc_predmat(Ad,Bd,Cd,Dd,Np);
Hy = (G'*Qy*G+Ry);
yy = [0.15;0;0;0];
w = zeros(Np,1);
gg=(V*yy-w)'*Qy*G;
hhhy = quadprog(Hy,gg);

%% MPC x

Qx = 0.00001;
Rx = 460;
Hx = (G'*Qx*G+Rx);
xx = [0.2;0;0;0];
w = zeros(Np,1);
gg=(V*xx-w)'*Qx*G;
hhhx = quadprog(Hx,gg);
hhhx(1)
>>>>>>> fde0ffbf156e966581cdd966662bb9d461e3685d
hhhy(1)