classdef Player < handle
    
    properties
        numPieces;
        strategy;
        hand;
        startSpace;
        startSpaceOptions;
        pieceNum;       
        endSpace;
        isDone;
        totalScore;
        playerNum;
        checkBoard;
        checkBoardTemp;
        
    end
    
    methods
        
        function obj = Player(startCorner,color,playernum)
            obj.checkBoard = zeros(20,20);
            obj.checkBoardTemp = zeros(20,20);
            obj.totalScore = 0;
            obj.playerNum = playernum;
            obj.isDone = false;
            handSetup = [1,5];           
            obj.hand = ObjectArray(handSetup);
            obj.hand(1) = Piece(1, color);            
            obj.hand(2) = Piece(2, color);
            obj.hand(3) = Piece(3, color);  
            obj.hand(4) = Piece(4, color);
            obj.hand(5) = Piece(5, color);
             obj.hand(6) = Piece(6, color);            
            obj.hand(7) = Piece(7, color);
            obj.hand(8) = Piece(8, color);  
            obj.hand(9) = Piece(9, color);
            obj.hand(10) = Piece(10, color);
             obj.hand(11) = Piece(11, color);            
            obj.hand(12) = Piece(12, color);
            obj.hand(13) = Piece(13, color);  
            obj.hand(14) = Piece(14, color);
            obj.hand(15) = Piece(15, color);
             obj.hand(16) = Piece(16, color);            
            obj.hand(17) = Piece(17, color);
            obj.hand(18) = Piece(18, color);  
            obj.hand(19) = Piece(19, color);
            obj.hand(20) = Piece(20, color);
            %obj.hand(6) = Piece(6, color);
            %obj.hand(7) = Piece(7, color);
            %obj.hand(8) = Piece(8, color);
            %obj.hand(9) = Piece(9, color);
            %obj.hand(10) = Piece(10, color);
            
            
            if(startCorner == 1)
                obj.startSpace = [1,1];
            elseif(startCorner == 2)
                obj.startSpace = [1,20];
            elseif(startCorner == 3)
                obj.startSpace = [20,1];
            elseif(startCorner == 4)
                obj.startSpace = [20,20];
            end   
            
        end
        
        function startSquare = calculateOrigin(player,board)
          board.startSpaces = zeros(20,20);
          startSquare = zeros(1,2);
          r=0;
          q=0;
          u=1;
          t=1;
          for t=1:1:4  
               for u=1:1:size(board.startSpaces,1)
                   if(t == 1)
                     if(u ~= 1 && u ~= 20)
                       if(player.checkBoard(u,1) ~= player.playerNum && board.Spaces(u,1) == 0 && (board.Spaces(u+1,2) == player.playerNum ...
                            || board.Spaces(u-1,2) == player.playerNum))
                          board.startSpaces(u,1) = 1;
                          r = r + 1;
                       end
                     else
                         if(u == 1 && player.playerNum == 1)
                              board.startSpaces(u,1) = 1;
                              r = r + 1;                        
                          elseif(u == 20 && player.playerNum == 3)
                              board.startSpaces(u,1) = 1;
                              r = r + 1;
                         end
                     end
                   elseif(t == 2)
                     if(u ~= 1 && u ~= 20)
                       if(player.checkBoard(1,u) ~= player.playerNum && board.Spaces(1,u) == 0 && (board.Spaces(2,u-1) == player.playerNum ...
                            || board.Spaces(2,u+1) == player.playerNum))
                          board.startSpaces(1,u) = 1;
                          r = r + 1;
                       end
                     else
                         if(u == 1 && player.playerNum == 1)
                              board.startSpaces(1,u) = 1;
                              r = r + 1;
                         elseif(u == 20 && player.playerNum == 2)
                             board.startSpaces(1,u) = 1;
                              r = r + 1;
                         end
                     end
                   elseif(t == 3)
                    if(u ~= 1 && u ~= 20)
                       if(player.checkBoard(20,u) ~= player.playerNum && board.Spaces(20,u) == 0 && (board.Spaces(19,u+1) == player.playerNum ...  
                            || board.Spaces(19,u-1) == player.playerNum))
                          board.startSpaces(20,u) = 1;
                          r = r + 1;
                       end
                    else
                        if(u == 1 && player.playerNum == 3)
                            board.startSpaces(20,u) = 1;
                              r = r + 1;
                        elseif(u == 20 && player.playerNum == 4)
                             board.startSpaces(20,u) = 1;
                              r = r + 1;
                        end
                    end
                       
                   elseif(t == 4)
                     if(u ~= 1 && u ~= 20)  
                       if(player.checkBoard(u,20) ~= player.playerNum && board.Spaces(u,20) == 0 && (board.Spaces(u-1,19) == player.playerNum ...
                            || board.Spaces(u+1,19) == player.playerNum))
                          board.startSpaces(u,20) = 1;
                          r = r + 1;
                       end
                     else
                         if(u == 1 && player.playerNum == 2)
                             board.startSpaces(u,20) = 1;
                              r = r + 1;
                         elseif(u == 20 && player.playerNum == 4)
                             board.startSpaces(u,20) = 1;
                              r = r + 1;
                         end
                     end                       
                   end
               end
          end   
            
                
            
            for t=2:1:size(board.startSpaces,1)-1
                for u=2:1:size(board.startSpaces,2)-1
                    
                    if(player.checkBoard(t,u) ~= player.playerNum && board.Spaces(t,u) == 0 && (board.Spaces(t+1,u+1) == player.playerNum...
                            || board.Spaces(t-1,u+1) == player.playerNum || board.Spaces(t+1,u-1) == player.playerNum...
                            || board.Spaces(t-1,u-1) == player.playerNum))
                        board.startSpaces(t,u) = 1;
                        r = r + 1;
                    end
                end
            end
            
                for g=1:1:size(board.startSpaces,1)
                    for h=1:1:size(board.startSpaces,2)
                        if(board.startSpaces(g,h) == 1)
                           q = q + 1;
                               startSquare(q,:) = [g,h];                              
                        end
                    end
                end
        end
        
        function pieceSelection(varargin)
            if(nargin == 2)
                player = varargin{1};
                board = varargin{2};
                player.pieceNum = randi(size(player.hand,2));
                %(player.hand(player.pieceNum).Value.numOrientations);                
                player.startSpaceOptions = calculateOrigin(player,board);
                 player.startSpace = player.startSpaceOptions(randi(size(player.startSpaceOptions,1)),:);
                player.endSpace = randi(player.hand(player.pieceNum).Value.numOrientations);
            elseif(nargin == 7)
                player = varargin{1};
                board = varargin{2};
                numPiece = varargin{3};
                endCorner = varargin{4};
                status = varargin{5};
                originSelect = varargin{6};
                counter = varargin{7};
                player.pieceNum = numPiece;  

                if(counter == 0)

                    player.startSpaceOptions = calculateOrigin(player,board);
                    
                end

                player.startSpace = player.startSpaceOptions(originSelect,:);
                player.endSpace = endCorner;
            end
               
        end
        
        function takeTurn(obj,Space,pieceNum,origin,endCorner,handles) 
            counter = 0;
            l=1;
            m=1;
            i=1;
            status = Space.playPiece(obj.hand(pieceNum).Value,obj.startSpace,obj.endSpace,obj,pieceNum, handles);
            if(status == "failed")    
                if(size(obj.hand,2) == 1)
                    for m=1:1:obj.hand(l).Value.numOrientations
                        for k=1:1:size(obj.startSpaceOptions, 1)                          
                            if(status == "failed")
                                obj.pieceSelection(Space,l,m,status,k,counter);
                                counter = counter + 1;
                                status = Space.playPiece(obj.hand(obj.pieceNum).Value,obj.startSpace,obj.endSpace,obj,obj.pieceNum, handles);
                            end
                        end
                    end                
                else
                   
                        for l=1:1:size(obj.hand,2)-1
                            
                            if(status == "failed")
                                for m=1:1:obj.hand(l).Value.numOrientations
                                    if(status == "failed")
                                        for k=1:1:size(obj.startSpaceOptions, 1)
                                            if(status == "failed")
                                               
                                                obj.pieceSelection(Space,l,m,status,k,counter);
                                                counter = counter + 1;
                                                status = Space.playPiece(obj.hand(obj.pieceNum).Value,obj.startSpace,obj.endSpace,obj,obj.pieceNum, handles);
                                            end
                                        end
                                    end
                                end
                            end
                            
                        end
                    
                end
            end
    
          if(status == "failed" || size(obj.hand,2) == 0)
              obj.isDone = true;
          end
          counter = 0;
        end
    end
end