%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The subroutine for computing the gradient of an image
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
function G = Grad(u,height,width)
% Applying forward finite difference to compute G = [(u)_x;(u)_y]
 um = reshape(u,height,width);
% Periodic boundary conditions
   ux = [um(2:height,:);um(1,:)];
   uy = [um(:,2:width) um(:,1)];
pd_ux = ux-um;
pd_uy = uy-um;
G = [pd_ux(:);pd_uy(:)];

