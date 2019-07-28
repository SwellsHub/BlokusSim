classdef playSpace < handle
    
    properties
        numSpaces;
        Players;
        Pieces;
        Spaces;
        ChecksTemp;
        playMap;
        startSpaces;
    end
    
    methods
        function obj = playSpace()
            obj.Pieces = 5;
            obj.numSpaces = 400;
            obj.Spaces = zeros(20,20);
            obj.ChecksTemp = zeros(20,20);
            obj.startSpaces = zeros(20,20);
        end
        
        
        function [space1] = markTile(board,piece)
            
            if(piece.pieceisGreen) 
                space1=1;
            elseif(piece.pieceisRed)
                space1=2;
            elseif(piece.pieceisBlue)
                space1=3;
            elseif(piece.pieceisYellow)
                space1=4;
            else
                space1=0;
            end
            
        end
        
        function status = playPiece(board,piece,origin,endCorner,player,pieceNum, handles) 
            player.checkBoardTemp = zeros(20,20);
            k=1;
            status = "legitimate";
            board.playMap = placePiece(piece, endCorner);
            for i=1:1:size(board.playMap,1) 
                
                space1 = origin(1)+board.playMap(i,2);
                space2 = origin(2)+board.playMap(i,1);
                
                if((space1 > 0 && space2 > 0) && (space1 <= 20 && space2 <= 20))
                    player.checkBoardTemp(space1,space2) = player.playerNum;
                    if(space1 == 1)
                        player.checkBoardTemp(space1+1,space2) = player.playerNum;
                        if(~(space2 == 20))                           
                         player.checkBoardTemp(space1,space2+1) = player.playerNum;
                        end
                        
                        if(~(space2 == 1))
                         player.checkBoardTemp(space1,space2-1) = player.playerNum;
                         
                        end
                         
                        if(space2 == 20)
                            
                        elseif(space2 == 1)
                            
                        elseif((board.Spaces(space1,space2) ~= 0) || ...
                            (board.Spaces(space1+1,space2) == player.playerNum) || (board.Spaces(space1,space2 - 1) == player.playerNum)...
                            || (board.Spaces(space1,space2 + 1) == player.playerNum))
                            status = "failed";                        
                        end                   
                    elseif(space1 == 20)
                        player.checkBoardTemp(space1-1,space2) = player.playerNum;
                        
                        if(~(space2 == 20))
                           player.checkBoardTemp(space1,space2+1) = player.playerNum;
                        end
                           
                        if(~(space2 == 1))
                           player.checkBoardTemp(space1,space2-1) = player.playerNum;
                           
                        end
                           
                        if(space2 == 1)
                            
                        elseif(space2 == 20)
                                                      
                        elseif((board.Spaces(space1,space2) ~= 0) || (board.Spaces(space1-1,space2) == player.playerNum) || (board.Spaces(space1,space2 - 1) == player.playerNum)...
                            || (board.Spaces(space1,space2 + 1) == player.playerNum))
                            status = "failed";
                        end
                    elseif(space2 == 1)
                        player.checkBoardTemp(space1,space2+1) = player.playerNum;
                        
                        if(~(space1 == 20))
                           player.checkBoardTemp(space1+1,space2) = player.playerNum;
                        end
                           
                        if(~(space1 == 1))
                           player.checkBoardTemp(space1-1,space2) = player.playerNum;
                           
                        end
                        
                        if(space1 == 1)
                        
                        elseif(space1 == 20)
                           
                        elseif((board.Spaces(space1,space2) ~= 0) || (board.Spaces(space1-1,space2) == player.playerNum) || ...
                            (board.Spaces(space1+1,space2) == player.playerNum)...
                            || (board.Spaces(space1,space2 + 1) == player.playerNum))                             
                            status = "failed";
                        end
                    elseif(space2 == 20)
                        
                        player.checkBoardTemp(space1,space2-1) = player.playerNum;
                        
                        if(~(space1 == 20))
                           player.checkBoardTemp(space1+1,space2) = player.playerNum;
                        end
                           
                        if(~(space1 == 1))
                           player.checkBoardTemp(space1-1,space2) = player.playerNum;  
                        end
                        
                        if(space1 == 1)
                            
                        elseif(space1 == 20)
                           
                        elseif((board.Spaces(space1,space2) ~= 0) || (board.Spaces(space1-1,space2) == player.playerNum) || ...
                            (board.Spaces(space1+1,space2) == player.playerNum) || (board.Spaces(space1,space2 - 1) == player.playerNum)...
                            )                            
                            status = "failed";
                        end
                    else
                         player.checkBoardTemp(space1-1,space2) = player.playerNum;
                         player.checkBoardTemp(space1+1,space2) = player.playerNum;
                         player.checkBoardTemp(space1,space2-1) = player.playerNum;
                         player.checkBoardTemp(space1,space2+1) = player.playerNum;
                        if(((board.Spaces(space1,space2) ~= 0) || (board.Spaces(space1,space2) ~= 0) || (board.Spaces(space1-1,space2) == player.playerNum) || ...
                            (board.Spaces(space1+1,space2) == player.playerNum) || (board.Spaces(space1,space2 - 1) == player.playerNum) || ...
                            (board.Spaces(space1,space2 + 1)) == player.playerNum) || (player.checkBoard(space1,space2) == player.playerNum)) 
                            status = "failed";
                        else

                        end
                    end                   
                else
                    status = "failed";
                end                
            end
            if(~(status == "failed"))
                status = "legitimate";
            end
            if(status == "legitimate")
                
                for i=1:1:size(board.playMap,1)               
                    if(board.Spaces(origin(1)+board.playMap(i,2),origin(2)+board.playMap(i,1)) == 0 && status == "legitimate")
                        board.Spaces(origin(1)+board.playMap(i,2),origin(2)+board.playMap(i,1)) = board.markTile(piece);
                        if(i == size(board.playMap,1))
                        player.hand(pieceNum) = [];
                        %Use if board should be displayed to user
                        %disp(board.playMap);
                        createPlayBoard(board,handles);
                        pause(.001);
                       
                        
                            player.totalScore = player.totalScore + piece.nSquares;
                            
                            for n=1:1:20
                                for p=1:1:20
                                    if(player.checkBoardTemp(n,p) ~= 0)
                                        player.checkBoard(n,p) = player.checkBoardTemp(n,p);
                                    end
                                end                                
                            end                                                    
                            
                        end
                    else
                        status = "failed";                       
                    end
                    
                end
               
            end


            
        end    
    end
end
    
