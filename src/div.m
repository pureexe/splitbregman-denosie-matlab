%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The subroutine for computing the divergent of a vector field
% over the image domain [1,N]x[1,N] with periodic BCs
%
% LAST MODIFIED: 2018-January-04
%
% Programed by (for SEAMS School 2018)
%
% Asistant Profesor Dr. Noppadol Chumchob
% Department of Mathematics,
% Silpakorn University, 
% Nakhon-Pathom, 73000, THAILAND.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function D = div(u,height,width)
% Applying backward finite difference to compute D = (u1)_x+(u2)_y
N = height*width;
u1 = u(1:N,1);
u2 = u(N+1:2*N,1);
 n = sqrt(N);
u1 = reshape(u1,height,width);
u2 = reshape(u2,height,width);
% Periodic boundary conditions
pd_u1x = [u1(1,:)-u1(height,:); u1(2:height,:)-u1(1:height-1,:)];  
pd_u2y = [u2(:,1)-u2(:,width) u2(:,2:width)-u2(:,1:width-1)];
d = pd_u1x+pd_u2y;
D = reshape(d,N,1);