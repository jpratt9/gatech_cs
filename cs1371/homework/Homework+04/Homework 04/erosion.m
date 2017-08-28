%CHANGE NEWHEIGHT IF TOPSOIL=EROSION IF NECESSARY
function [ newheights ] = erosion( topsoil, bedrock, erosion )
%EROSION Returns the new heights of topsoil layers (NEWHEIGHTS) given
%original topsoil heights of TOPSOIL, bedrock height BEDROCK, and erosion
%factor EROSION.
newheights = topsoil-erosion;
%   If erosion <= topsoil, newheight becomes topsoil - erosion
newheights(topsoil - erosion < bedrock) = bedrock(topsoil - erosion < bedrock);
end