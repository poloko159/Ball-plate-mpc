figure;
clc
a_sign = 'a';
b_sign = 'b';
c_sign = 'c';
lim_angle = 5;
x_velo = zeros(252,1);
y_velo = zeros(252,1);
beta = zeros(251,1);
beta_now = 0;
beta_dif = 0;
alpha = zeros(251,1);
alpha_now = 0;
alpha_dif = 0;
for i = 2:251
    m = getdata(vid, 1);
    [img, bw,x,y] = trackball(m, 25);
    subplot(2, 3, 1);
    imagesc(img);
    subplot(2, 3, 2);
    x = x*0.2*2/320;
    y = y*0.2*240/320*2/240;
    plot(x,y,'.');
    axis([-0.2 0.2 -0.2*240/320 0.2*240/320])
    hold on;
    grid on;
    %% x cal
    % save to vector
    x_velo(i,1) = x;
    dif_x_velo = (x_velo(i,1)-x_velo(i-1,1))/Ts;
    
    %alpha_now = -y_con(2);
    alpha_dif = (alpha(i,1)-alpha(i-1,1))/Ts;
    
    % QP slove
    
    
    xx = [x;dif_x_velo; 0;0];
    wx = zeros(Np,1);
    gx=(V*xx-wx)'*Qx*G;
    x_con = quadprog(Hx,gx);
    x_con_1 = x_con(1);
    % get x2
    beta(i,1) = -x_con_1;
    if x_con_1 > lim_angle
        x_con_1 = lim_angle;
    end
    if x_con_1 < -lim_angle
        x_con_1 = -lim_angle;
    end
    %% y cal
    y_velo(i,1) = y;
    dif_y_velo = (y_velo(i-1,1)-y_velo(i-1,1))/Ts;
    beta_now = - x_con_1;
    beta_dif = (beta(i,1)-beta(i-1,1))/Ts;
    
    %% QP slove
    
    yy = [y;dif_y_velo;0;0];
    wy = zeros(Np,1);
    gy=(V*yy-wy)'*Qy*G;
    y_con = quadprog(Hy,gy);
    % get 
    
    y_con_1 = y_con(1);
    alpha(i,1) = -y_con_1;
    
    if y_con_1 > lim_angle
        y_con_1 = lim_angle;
    end
    if y_con_1 < -lim_angle
        y_con_1 = -lim_angle;
    end
    %% inverse
    [phi1,phi2,phi3] =test_inverse(-y_con_1,-x_con_1);
    %% plot
    % plot phi1
    subplot(2, 3, 4);
    plot(i,phi1,'.');
    axis([0 250 0 180])
    hold on;
    grid on;
    % plot phi2
    subplot(2, 3, 5);
    plot(i,phi2,'.');
    axis([0 250 0 180])
    hold on;
    grid on;
    % plot phi3
    subplot(2, 3, 6);
    plot(i,phi3,'.');
    axis([0 250 0 180])
    hold on;
    grid on;
    %% send to arduino
    phi1_st = int2str(uint8(phi1));
    phi2_st = int2str(uint8(phi2));
    phi3_st = int2str(uint8(phi3));
    
    sedata = strcat(phi1_st,a_sign,phi3_st,b_sign,phi2_st,c_sign);
    fprintf(ar,'%s',sedata);
    
end