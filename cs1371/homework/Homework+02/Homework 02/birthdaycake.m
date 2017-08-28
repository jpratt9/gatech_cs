function [ piecesForYou ] = birthdaycake( piecesTotal, people )
%BIRTHDAYCAKE Returns the total number of pieces of birthday cake 
%(PIECESFORYOU) you will be able to eat at a party with PEOPLE number of 
%people and PIECESTOTAL number of pieces of cake.

%  The cake will be split evenly amongst all guests including you, with all
%  remaining pieces also going to you.  Therefore, you will get the sum of 
%  rounded down version of the quotient of the number of pieces and number 
%  of people and the number of remaining pieces

piecesForYou = floor(piecesTotal/people) + mod(piecesTotal, people);

end

