function [ Cnm, Snm ] = SphericalHarmonics( n, m, theta, lambda )
  Cnm = legendre(n,m,theta*pi/180)*cos(m*lambda*pi/180); 
  Snm = legendre(n,m,theta*pi/180)*sin(m*lambda*pi/180);
end

