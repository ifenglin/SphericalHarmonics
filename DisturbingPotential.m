function [ T ] = DisturbingPotential( r, lambda, phi, degree )
    if degree == 0
        T = 1;
        return;
    end
    if degree == 1
        T = 0;
        return;
    end
    % coefficient
    delta_C = [ 0           0           0               0; % C0 is not used
                0           0           0               0; % C1 is not used
                0.002*10^-6 0           2.439 * 10^-6   0; % C20, C21, C22
                0.957*10^-6 2.029*10^-6 0.904*10^-6     0.721*10^-6]; %C30, C31, C32, C33
    delta_S = [ 0           0           0               0; % S0 is not used
                0           0           0               0; % S1 is not used
                0           0           -1.400*10^-6    0; % S21, S22
                0           0.249*10^-6 -0.619*10^-6    1.414*10^-6]; %S31, S32, S33
    % constants
    GM = 398600.44;
    R = 6378;

    sum_outer = 0;
    for l = 2:degree
        sum_inner = 0;
        for m = 0:l
            sum_inner = sum_inner + legendre(l,m,phi*pi/180)*(delta_C(l+1,m+1)*cos(m*lambda*pi/180) + delta_S(l+1,m+1)*sin(m*lambda*pi/180));
        end
        sum_outer = sum_outer + (R/r)^(l+1) * sum_inner ;
    end
    
    T = GM/R * sum_outer;

end

function [ Pnm ] = P(l,m,phi)
  Pnm = 1;
end


        