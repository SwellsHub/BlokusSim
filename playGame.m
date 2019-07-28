%BlokusSimulator
%Simulates a game of Blokus with various AI
%Joe Elson, Lauren Pardi, Spencer Wells
%Sometime in the Future
function playGame(handles)

    board = playSpace();
    board.Spaces = zeros(20,20);
    if(handles.player1PopUp.Value == 1) 
        player1 = aggressivePlayer(1, 'green',1);
    elseif(handles.player1PopUp.Value == 2)
        player1 = defensivePlayer(1, 'green',1);
    elseif(handles.player1PopUp.Value == 3)
        player1 = Player(1, 'green',1);
    end
    
    if(handles.player2PopUp.Value == 1)
        player2 = aggressivePlayer(2, 'red',2);
    elseif(handles.player2PopUp.Value == 2)
        player2 = defensivePlayer(2, 'red',2);
    elseif(handles.player2PopUp.Value == 3)
        player2 = Player(2, 'red',2);
    end
    
    if(handles.player3PopUp.Value == 1)
        player3 = aggressivePlayer(3, 'blue',3);
    elseif(handles.player3PopUp.Value == 2)
        player3 = defensivePlayer(3, 'blue',3);
    elseif(handles.player3PopUp.Value == 3)
        player3 = Player(3, 'blue',3);
    end
    
    if(handles.player4PopUp.Value == 1)
        player4 = aggressivePlayer(4, 'yellow',4);
    elseif(handles.player4PopUp.Value == 2)
        player4 = defensivePlayer(4, 'yellow',4);
    elseif(handles.player4PopUp.Value == 3)
        player4 = Player(4, 'yellow',4);
    end
    %firstTurn(player1,player2,player3,player4,board);


    while(~(player1.isDone && player2.isDone && player3.isDone && player4.isDone))
        playRound(player1,player2,player3,player4,board,handles);
    end

    finishGame(player1,player2,player3,player4,board,handles);

end
   
    function playRound(player1,player2,player3,player4,board,handles)
        if(~player1.isDone)
            player1.pieceSelection(board);
            player1.takeTurn(board,player1.pieceNum,player1.startSpace,player1.endSpace, handles);
        end
        if(~player2.isDone)
            player2.pieceSelection(board);
            player2.takeTurn(board,player2.pieceNum,player2.startSpace,player2.endSpace, handles);
        end
        if(~player3.isDone)
            player3.pieceSelection(board);
            player3.takeTurn(board,player3.pieceNum,player3.startSpace,player3.endSpace, handles);
        end
        if(~player4.isDone)
            player4.pieceSelection(board);
            player4.takeTurn(board,player4.pieceNum,player4.startSpace,player4.endSpace, handles);
        end
    end


    function finishGame(player1, player2, player3, player4, board, handles)    
        winnerScore = max([player1.totalScore,player2.totalScore,player3.totalScore,player4.totalScore]);
        disp([player1.totalScore,player2.totalScore,player3.totalScore,player4.totalScore]);
        if(player1.totalScore == winnerScore)
            set(handles.finishText, 'String', ['The winning player is the green player with a total score of ', num2str(winnerScore), '.']);
        elseif(player2.totalScore == winnerScore)
            set(handles.finishText, 'String', ['The winning player is the orange player with a total score of ', num2str(winnerScore), '.']);
        elseif(player3.totalScore == winnerScore)
            set(handles.finishText, 'String', ['The winning player is the blue player with a total score of ', num2str(winnerScore), '.']);
        elseif(player4.totalScore == winnerScore)
            set(handles.finishText, 'String', ['The winning player is the purple player with a total score of ', num2str(winnerScore), '.']);
        end
    end


 
