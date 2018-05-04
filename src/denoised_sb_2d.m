function u = denoised_sb_2d(f,alpha,theta,eps1,eps2)
%Step 2)
 [height,width] = size(f);
 f = f(:);
 N = length(f);
w1 = zeros(N,1);  
w2 = w1;
b1 = w1;
b2 = w1;
w = [w1;w2];
b = [b1;b2];

u = f(:);
k = 0;
err = 1;

%Step 3)
zeta = zeros(height,width);
for i=1:height
    for j=1:width
        s = i-1;
        r = j-1;
        zeta(i,j) = 1-2*theta*(cos(2*pi*s/height)+cos(2*pi*r/width)-2); 
    end
end

while ((err >= eps1) & (k < eps2))
u_old = u;    
%Step 4) compute u 
 G = reshape(f,N,1) - theta*div(w-b,height,width);%Task 3
GM = reshape(G,height,width);
uM = real(ifft2(fft2(GM)./zeta));%Task 4
u = reshape(uM,N,1);
%Step 5) compute w 
GradB = Grad(u,height,width)+b;%Task 5
w = max(abs(GradB)-alpha/theta,0).*sign(GradB);%Task 6
%Step 6) update Bregman parameter b <- B+Grad(u)-w
b = GradB-w;
%Step 7) Check convegence of u
err = norm(u_old-u)/norm(u); 
k = k+1;
fprintf('k = %d, err = %f \n',k,err)
end
u = reshape(u,height,width);

