function [ winner ] = blackjack( seed, strategyArray )
%Returns the winner of a game of blackjack
[dealerUpCard, playerHand] = dealer('start',seed);
hitting = true; %checks whether the player wants to hit
over = false; %checks whether the game is over
if sum(playerHand) == 21 %Blackjack if your start hand adds to 21
    winner = 'Blackjack!';
    over = true;
end
row = 0;
dealerHand = [];
if ~over
    while hitting
        if sum(playerHand) > 21 %if you bust, all aces become ones
            playerHand(playerHand == 11) = 1;
        end
        %Otherwise, simply look through the strategy array for whether or
        %not to hit.  Row is determined by the player's hand...
        if sum(playerHand) > 20
            hitting = false;
        elseif sum(playerHand) <= 20 && sum(playerHand) >= 17
            row = 1;
        elseif sum(playerHand) <= 16 && sum(playerHand) >= 13
            row = 2;
        elseif sum(playerHand) == 12
            row = 3;
        else
            row = 4;
        end
        if hitting %this only happens if the player chose to hit at the end of last turn
            hitting = strategyArray(row, dealerUpCard - 1); %...and column by the dealer's face up card.
        end
        if hitting %The player hits, and their card is added to their hand.
            [~, playerCard] = dealer('hit',seed);
            playerHand = [playerHand playerCard];
        else
            dealerHand = dealer('stay',seed);
        end
        %This process repeats until the player should not hit (according to
        %the strategy array).
    end
    playerSum = sum(playerHand);
    dealerSum = sum(dealerHand);
    if (dealerSum > 21 || abs(21-playerSum) < abs(21-dealerSum)) && playerSum <= 21
        winner = 'The player wins!';
    else %(playerSum > 21 || playerSum == dealerSum || abs(21-playerSum) > abs(21-dealerSum)) && dealerSum <= 21
        winner = 'The dealer wins :(';
    end
end
end

