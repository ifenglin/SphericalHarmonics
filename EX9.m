degree = 3;
r = 6378;
grid = [2 ,4];
i = 0; 
j = 0;
Z = zeros(180/grid(1), 360/grid(2));

for lambda = 0 : grid(2) : 360
    i = i + 1;
    for phi = 0 : grid(1) : 180
        j = j + 1;
        Z(j,i) = DisturbingPotential(r, lambda, phi, degree);
    end
    j = 0;
end

contourf(0:grid(2):360, 0:grid(1):180, Z);
colorbar('southoutside');
hold on;
load('coast0.mat'); 
plot(lam,phi+90,'b');
plot(lam+360,phi+90, 'b');
title(['Disturbing potential on the surface (degree ' num2str(degree) ')']);
xlabel('longtitude in degree');
ylabel('colatitude in degree');
axis([0 360 0 180]);