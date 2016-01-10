function Pnm=legendre(n,m,theta)

if n<m
    fprintf('Your number is wrong,n should larger or equal to m');
    Pnm=0;
else 
    if n==0
        Pnm=1;
    elseif n==1
            if m==n
                Pnm=sqrt(3)*sin(theta)*legendre(n-1,n-1,theta);
            else
                bnm=sqrt(((2*n+1)*(2*n-1))/((n+m)*(n-m)));
                Pnm=bnm*cos(theta)*legendre(n-1,n-1,theta);
            end
    elseif m==n && n~=0 && n~=1
        an=sqrt((2*n+1)/2*n);
        Pnm=an*sin(theta)*legendre(n-1,n-1,theta);
    elseif m==n-1 && n~=0 && n~=1
        bnm=sqrt(((2*n+1)*(2*n-1))/((n+m)*(n-m)));
        Pnm=bnm*cos(theta)*legendre(n-1,n-1,theta);
    else
        bnm=sqrt(((2*n+1)*(2*n-1))/((n+m)*(n-m)));
        cnm=sqrt(((2*n+1)*(n-m-1)*(n+m-1))/((2*n-3)*(n+m)*(n-m)));
        Pnm=bnm*cos(theta)*legendre(n-1,m,theta)-cnm*legendre(n-2,m,theta);
    end
end

