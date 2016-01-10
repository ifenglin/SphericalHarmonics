% parameters
n = 7;
m = 6;
% initialization
i = 0;
j = 0;
grid = [2 ,4];
H=zeros(180/grid(1), 360/grid(2));
for lambda = 0 : grid(2) : 360 % longtitude
    i = i + 1;
    for theta = 0 : grid(1) : 180 % latitude
        j = j + 1;
        [Cnm, Snm] = SphericalHarmonics(n, m, theta, lambda);
        H(j,i) = Cnm + Snm;
    end
    j = 0;
end
pcolor(0:4:360, 0:2:180, H);
[x, y, z] = sphere(90);
surf(x, y, z, H);
title(['Tesseral spherical harmonics (n= ' num2str(n) ', m=' num2str(m) ')']);
colorbar('southoutside');
axis off;