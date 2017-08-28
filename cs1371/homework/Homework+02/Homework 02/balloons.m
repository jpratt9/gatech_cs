function [ totalCost ] = balloons( roomVolume, balloonRadius, packPrice )
%BALLOONS Returns the total cost (TOTALCOST) of hypothetically buying
%enough 12-packs of balloons of price PACKPRICE which have radius 
%BALLOONRADIUS to fill a room of volume ROOMVOLUME, ignoring empty space 
%between baloons.

%   Each balloon is a assumed to be a perfect sphere, so they each have a
%   volume of (4/3)*pi*balloonRadius^3.  The number of balloons needed is
%   the quotient of the volume of the room and the volume of each balloon.
numberOfBalloons = roomVolume / (4/3 * pi * balloonRadius^3);

%   The number of packs is equal to the ceiling of the quotient of the
%   number of balloons needed and the number of balloons per pack (12).
numberOfPacks = ceil(numberOfBalloons/12);

%   The total cost is the product of the number of packs needed, the price
%   of each pack, and 1.08 (price of balloons plus 8% sales tax).
totalCost = 1.08*numberOfPacks*packPrice;


end

