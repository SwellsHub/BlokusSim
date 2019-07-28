classdef aggressivePlayer < Player
    
    properties
        startSpacesSorted;
        findMax;
    end
    
    
    methods
        
       
        function obj = aggressivePlayer(startCorner,color,playernum)
            unsortedBlocks = true;
            obj@Player(startCorner,color,playernum);
             for i=1:1:size(obj.hand, 2)
                    playerSquares(i) = obj.hand(i).Value.nSquares;
             end
             while(unsortedBlocks)
                 unsortedBlocks = false;
                for i=2:1:size(obj.hand,2)
                    j = i-1;
                    block1 = obj.hand(i).Value.nSquares;
                    block2 = obj.hand(j).Value.nSquares;
                    if(block1 > block2)
                        unsortedBlocks = true;
                        tempBlock = obj.hand(i-1).Value;
                        obj.hand(i-1).Value = obj.hand(i).Value;
                        obj.hand(i).Value = tempBlock;
                        tempSquares = playerSquares(i-1);
                        playerSquares(i-1) = playerSquares(i);
                        playerSquares(i) = tempSquares;
                    end
                end
             end
            obj.findMax = true;
            
        end
        
        function startSquare = calculateOrigin(player,board) 
                startSquare = calculateOrigin@Player(player,board);
        end
        
        function pieceSelection(varargin)
            
            if(nargin == 2)
                player = varargin{1};
                board = varargin{2};
                pieceSelection@Player(player,board);
            elseif(nargin == 7)
                player = varargin{1};
                board = varargin{2};
                numPiece = varargin{3};
                endCorner = varargin{4};
                status = varargin{5};
                k = varargin{6};
                n = varargin{7};
                
                player.startSpaceOptions = calculateOrigin(player,board);
                [castVals, maxCol, maxRow, minCol, minRow, player.startSpacesSorted] = rayCast(player.startSpaceOptions,board, player.findMax);
                player.pieceNum = numPiece;
                
                if(k <= player.hand(numPiece).Value.numOrientations && size(player.startSpaceOptions,1) == n) 
                    player.startSpace = player.startSpacesSorted(k,:);
                end
                
                player.endSpace = endCorner;
            end
            
        end
        
        function takeTurn(obj,Space,pieceNum,origin,endCorner, handles) 
            [castVals, maxCol, maxRow, minCol, minRow, startSpacesSorted] = rayCast(obj.startSpaceOptions, Space, obj.findMax);
            counter = 1;
            l=1;
            m=1;
            i=1;
            status = Space.playPiece(obj.hand(pieceNum).Value,obj.startSpace,obj.endSpace,obj,pieceNum, handles);
            if(status == "failed")    
                if(size(obj.hand,2) == 1)
                    for m=1:1:obj.hand(l).Value.numOrientations
                        
                        for k=1:1:size(obj.startSpaceOptions, 1)                          
                            if(status == "failed")
                                if(counter == 1) 
                                   n = size(obj.startSpaceOptions,1);
                                end
                                counter = counter + 1;
                                obj.pieceSelection(Space,l,m,status,k,n);
                                status = Space.playPiece(obj.hand(obj.pieceNum).Value,obj.startSpace,obj.endSpace,obj,obj.pieceNum, handles);
                            end
                        end
                    end                
                else
                   
                        for l=1:1:size(obj.hand,2)
                            
                            if(status == "failed")
                                for m=1:1:obj.hand(l).Value.numOrientations
                                    
                                    if(status == "failed")
                                       
                                        for k=1:1:size(obj.startSpaceOptions, 1)
                                            if(status == "failed")
                                                if(counter == 1) 
                                                    n = size(obj.startSpaceOptions,1);
                                                end
                                                
                                                
                                                obj.pieceSelection(Space,l,m,status,k,n);
                                                if(size(obj.startSpaceOptions,1) ~= 1)
                                                    counter = counter + 1;
                                                end
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
          counter = 1;
        end
        
        
        
        
        
        
    end
    
    
    
end