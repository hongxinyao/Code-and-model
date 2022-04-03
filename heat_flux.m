clear all;
   
Nx=20;   
Ny=20;   
dx=0.002;  
dy=0.002;  
Lx=0.025;
Ly=0.025;
L=0.5;
n=1;
P=0;
while n<=Nx*Ny  
       J=floor(n/Nx)+1;       
       I=rem(n,Nx);
       if I==0
          I=Nx;
          J=floor(n/Nx);
       end
    x(n)=dx/2+(I-1)*dx; 
    xl=dx/2+(I-1)*dx-(floor(Nx/2)*dx);
    y(n)=dy/2+(J-1)*dy;  
    yl=dy/2+(J-1)*dy-(floor(Ny/2)*dy); 
    q(n)=1.025*(2*10^6*exp(-((xl^2)/(Lx^2)+(yl^2)/(Ly^2))/L^2)+0.5*10^6); 
    q_gradient(n)=1.025*abs(-(4000000*xl*exp(-(xl^2/Lx^2 + yl^2/Ly^2)/L^2))/(L^2*Lx^2)-(4000000*yl*exp(-(xl^2/Lx^2 + yl^2/Ly^2)/L^2))/(L^2*Ly^2));
    P=P+q(n)*dx*dy;
    n=n+1;
end
q_gradient_MAX=max(q_gradient);
out=[x',y',q'];

