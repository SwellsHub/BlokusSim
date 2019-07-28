%BlokusSimulator
%Simulates a game of Blokus with various AI
%Joe Elson, Lauren Pardi, Spencer Wells
%Sometime in the Future
clear global variable
global gameResults;
gameResults = zeros(100,2);
for z=1:1:100
   

 
    board = playSpace();
    board.Spaces = zeros(20,20);
    player1 = defensivePlayer(1, 'green',1);
    player2 = defensivePlayer(2, 'red',2);
    player3 = aggressivePlayer(3, 'blue',3);
    player4 = defensivePlayer(4, 'yellow',4);
    %firstTurn(player1,player2,player3,player4,board);


    while(~(player1.isDone && player2.isDone && player3.isDone && player4.isDone))
        playRound(player1,player2,player3,player4,board,0);

        %disp(board.Checks);
    end

    finishGame(player1,player2,player3,player4,board,0,z);

end

xlswrite("3DefensivePlayers",gameResults);

    function firstTurn(player1,player2,player3,player4,board)
            player1.pieceSelection(board);
            player1.takeTurn(board,3,player1.startSpace,player1.endSpace);  
            player2.pieceSelection(board);
            player2.takeTurn(board,5,player2.startSpace,player2.endSpace);   
            player3.pieceSelection(board);
            player3.takeTurn(board,4,player3.startSpace,player3.endSpace); 
            player4.pieceSelection(board);
            player4.takeTurn(board,2,player4.startSpace,player4.endSpace);        
    end

    function playRound(player1,player2,player3,player4,board,fakeNews)
        if(~player1.isDone)
            player1.pieceSelection(board);
            player1.takeTurn(board,player1.pieceNum,player1.startSpace,player1.endSpace, 0);
        end
        if(~player2.isDone)
            player2.pieceSelection(board);
            player2.takeTurn(board,player2.pieceNum,player2.startSpace,player2.endSpace, 0);
        end
        if(~player3.isDone)
            player3.pieceSelection(board);
            player3.takeTurn(board,player3.pieceNum,player3.startSpace,player3.endSpace, 0);
        end
        if(~player4.isDone)
            player4.pieceSelection(board);
            player4.takeTurn(board,player4.pieceNum,player4.startSpace,player4.endSpace, 0);
        end
    end


    function finishGame(player1, player2, player3, player4, board,fakeNews,z)    
        winnerScore = max([player1.totalScore,player2.totalScore,player3.totalScore,player4.totalScore]);
        disp([player1.totalScore,player2.totalScore,player3.totalScore,player4.totalScore]);
        if(player1.totalScore == winnerScore)
            setGlobalx(z,1,winnerScore);
            
        elseif(player2.totalScore == winnerScore)
            setGlobalx(z,2,winnerScore);
            
        elseif(player3.totalScore == winnerScore)
            setGlobalx(z,3,winnerScore);
            
        elseif(player4.totalScore == winnerScore)
            setGlobalx(z,4,winnerScore);
            
        end
    end
    
    function setGlobalx(z,val,score)
        global gameResults
        gameResults(z,1) = val;
        gameResults(z,2) = score;
    end
    
    function r = getGlobalx
        global gameResults
        r = gameResults;
    end
        
    

 
