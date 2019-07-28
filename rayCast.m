% rayCasting

function [castVals, maxCol, maxRow, minCol, minRow, startSpacesSorted] = rayCast(startSpaces,board, findMax)
minCol = 0;
minRow = 0;
maxCol = 0;
maxRow = 0;
%% choosing a corner
%if the computer deems that the space (1,1) with the corner as the orgin
%then that corner is playable.
%it will only evalute the ray casting for playable corners
%it will evalute all the angles for each playable corner, keeping track of
%the cooridinates of the nearest piece in every senario.
%based on the game mood, it will place a defensive piece or agressive
%piece
%45 degrees
%assume that this for loop is going to be implimented with the corner of the peice being (0,0)
castVals = zeros(20,size(startSpaces,1));



for i=1:1:size(startSpaces,1)
  if(startSpaces(i,1) ~= 20 && startSpaces(i,2) ~= 1)
    fifteenEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while fifteenEmpty == true
        
        if(board.Spaces(startSpaces(i,1)+j,startSpaces(i,2)-k) ~= 0 || startSpaces(i,1)+j == 1 || startSpaces(i,1)+j == 20 || startSpaces(i,2)-k == 1 || startSpaces(i,2)-k == 20)
            fifteenEmpty = false;
        else
            j = j + 1;
            if(l < 2)
                l = l + 1;
            else
                l = 0;
                k = k + 1;
            end
        end
    end
    castVals(1,i) = realsqrt(j^2 + k^2);
   


    thirtyEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while thirtyEmpty == true
        
        if(board.Spaces(startSpaces(i,1)+j,startSpaces(i,2)-k) ~= 0 || startSpaces(i,1)+j == 1 || startSpaces(i,1)+j == 20 || startSpaces(i,2)-k == 1 || startSpaces(i,2)-k == 20)
            thirtyEmpty = false;
        else
            j = j + 1;
            if(l == 0)
                l = 1;
            else
                l = 0;
                k = k + 1;
            end
        end
    end
    castVals(2,i) = realsqrt(j^2 + k^2);
   

    fortyFiveEmpty=true;
    j = 1;
    while fortyFiveEmpty == true
        
        if(board.Spaces(startSpaces(i,1)+j,startSpaces(i,2)-j) ~= 0 || startSpaces(i,1)+j == 1 || startSpaces(i,1)+j == 20 || startSpaces(i,2)-j == 1 || startSpaces(i,2)-j == 20)
            fortyFiveEmpty = false;
        else
            j = j + 1;
        end
    end
    castVals(3,i) = realsqrt(2*(j^2));
   

    sixtyEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while sixtyEmpty == true
        
        if(board.Spaces(startSpaces(i,1)+j,startSpaces(i,2)-k) ~= 0 || startSpaces(i,1)+j == 1 || startSpaces(i,1)+j == 20 || startSpaces(i,2)-k == 1 || startSpaces(i,2)-k == 20)
            sixtyEmpty = false;
        else
            k = k + 1;
            if(l == 0)
                l = l + 1;
            else
                l = 0;
                j = j + 1;
            end
        end
    end
    castVals(4,i) = realsqrt(j^2 + k^2);
   
    seventyFiveEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while seventyFiveEmpty == true
        
        if(board.Spaces(startSpaces(i,1)+j,startSpaces(i,2)-k) ~= 0 || startSpaces(i,1)+j == 1 || startSpaces(i,1)+j == 20 || startSpaces(i,2)-k == 1 || startSpaces(i,2)-k == 20)
            seventyFiveEmpty = false;
        else
            k = k + 1;
            if(l < 2)
                l = l + 1;
            else
                l = 0;
                j = j + 1;
            end
        end
    end
    castVals(5,i) = realsqrt(j^2 + k^2);
 end
end

for i=1:1:size(startSpaces,1)
  if(startSpaces(i,1) ~= 1 && startSpaces(i,2) ~= 1)
    fifteenEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while fifteenEmpty == true
        
        if(board.Spaces(startSpaces(i,1)-j,startSpaces(i,2)-k) ~= 0 || startSpaces(i,1)-j == 1 || startSpaces(i,1)-j == 20 || startSpaces(i,2)-k == 1 || startSpaces(i,2)-k == 20)
            fifteenEmpty = false;
        else
            j = j + 1;
            if(l < 2)
                l = l + 1;
            else
                l = 0;
                k = k + 1;
            end
        end
    end
    castVals(6,i) = realsqrt(j^2 + k^2);
   


    thirtyEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while thirtyEmpty == true
        
        if(board.Spaces(startSpaces(i,1)-j,startSpaces(i,2)-k) ~= 0 || startSpaces(i,1)-j == 1 || startSpaces(i,1)-j == 20 || startSpaces(i,2)-k == 1 || startSpaces(i,2)-k == 20)
            thirtyEmpty = false;
        else
            j = j + 1;
            if(l == 0)
                l = 1;
            else
                l = 0;
                k = k + 1;
            end
        end
    end
    castVals(7,i) = realsqrt(j^2 + k^2);
   

    fortyFiveEmpty=true;
    j = 1;
    while fortyFiveEmpty == true
        
        if(board.Spaces(startSpaces(i,1)-j,startSpaces(i,2)-j) ~= 0 || startSpaces(i,1)-j == 1 || startSpaces(i,1)-j == 20 || startSpaces(i,2)-j == 1 || startSpaces(i,2)-j == 20)
            fortyFiveEmpty = false;
        else
            j = j + 1;
        end
    end
    castVals(8,i) = realsqrt(2*(j^2));
   

    sixtyEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while sixtyEmpty == true
        
        if(board.Spaces(startSpaces(i,1)-j,startSpaces(i,2)-k) ~= 0 || startSpaces(i,1)-j == 1 || startSpaces(i,1)-j == 20 || startSpaces(i,2)-k == 1 || startSpaces(i,2)-k == 20)
            sixtyEmpty = false;
        else
            k = k + 1;
            if(l == 0)
                l = l + 1;
            else
                l = 0;
                j = j + 1;
            end
        end
    end
    castVals(9,i) = realsqrt(j^2 + k^2);
   
    seventyFiveEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while seventyFiveEmpty == true
        
        if(board.Spaces(startSpaces(i,1)-j,startSpaces(i,2)-k) ~= 0 || startSpaces(i,1)-j == 1 || startSpaces(i,1)-j == 20 || startSpaces(i,2)-k == 1 || startSpaces(i,2)-k == 20)
            seventyFiveEmpty = false;
        else
            k = k + 1;
            if(l < 2)
                l = l + 1;
            else
                l = 0;
                j = j + 1;
            end
        end
    end
    castVals(10,i) = realsqrt(j^2 + k^2);
 end
end

for i=1:1:size(startSpaces,1)
  if(startSpaces(i,1) ~= 1 && startSpaces(i,2) ~= 20)
    fifteenEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while fifteenEmpty == true
        
        if(board.Spaces(startSpaces(i,1)-j,startSpaces(i,2)+k) ~= 0 || startSpaces(i,1)-j == 1 || startSpaces(i,1)-j == 20 || startSpaces(i,2)+k == 1 || startSpaces(i,2)+k == 20)
            fifteenEmpty = false;
        else
            j = j + 1;
            if(l < 2)
                l = l + 1;
            else
                l = 0;
                k = k + 1;
            end
        end
    end
    castVals(11,i) = realsqrt(j^2 + k^2);
   


    thirtyEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while thirtyEmpty == true
        
        if(board.Spaces(startSpaces(i,1)-j,startSpaces(i,2)+k) ~= 0 || startSpaces(i,1)-j == 1 || startSpaces(i,1)-j == 20 || startSpaces(i,2)+k == 1 || startSpaces(i,2)+k == 20)
            thirtyEmpty = false;
        else
            j = j + 1;
            if(l == 0)
                l = 1;
            else
                l = 0;
                k = k + 1;
            end
        end
    end
    castVals(12,i) = realsqrt(j^2 + k^2);
   

    fortyFiveEmpty=true;
    j = 1;
    while fortyFiveEmpty == true
        
        if(board.Spaces(startSpaces(i,1)-j,startSpaces(i,2)+j) ~= 0 || startSpaces(i,1)-j == 1 || startSpaces(i,1)-j == 20 || startSpaces(i,2)+j == 1 || startSpaces(i,2)+j == 20)
            fortyFiveEmpty = false;
        else
            j = j + 1;
        end
    end
    castVals(13,i) = realsqrt(2*(j^2));
   

    sixtyEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while sixtyEmpty == true
        
        if(board.Spaces(startSpaces(i,1)-j,startSpaces(i,2)+k) ~= 0 || startSpaces(i,1)-j == 1 || startSpaces(i,1)-j == 20 || startSpaces(i,2)+k == 1 || startSpaces(i,2)+k == 20)
            sixtyEmpty = false;
        else
            k = k + 1;
            if(l == 0)
                l = l + 1;
            else
                l = 0;
                j = j + 1;
            end
        end
    end
    castVals(14,i) = realsqrt(j^2 + k^2);
   
    seventyFiveEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while seventyFiveEmpty == true
        
        if(board.Spaces(startSpaces(i,1)-j,startSpaces(i,2)+k) ~= 0 || startSpaces(i,1)-j == 1 || startSpaces(i,1)-j == 20 || startSpaces(i,2)+k == 1 || startSpaces(i,2)+k == 20)
            seventyFiveEmpty = false;
        else
            k = k + 1;
            if(l < 2)
                l = l + 1;
            else
                l = 0;
                j = j + 1;
            end
        end
    end
    castVals(15,i) = realsqrt(j^2 + k^2);
 end
end

for i=1:1:size(startSpaces,1)
  if(startSpaces(i,1) ~= 20 && startSpaces(i,2) ~= 20)
    fifteenEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while fifteenEmpty == true
        
        if(board.Spaces(startSpaces(i,1)+j,startSpaces(i,2)+k) ~= 0 || startSpaces(i,1)+j == 1 || startSpaces(i,1)+j == 20 || startSpaces(i,2)+k == 1 || startSpaces(i,2)+k == 20)
            fifteenEmpty = false;
        else
            j = j + 1;
            if(l < 2)
                l = l + 1;
            else
                l = 0;
                k = k + 1;
            end
        end
    end
    castVals(16,i) = realsqrt(j^2 + k^2);
   


    thirtyEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while thirtyEmpty == true
        
        if(board.Spaces(startSpaces(i,1)+j,startSpaces(i,2)+k) ~= 0 || startSpaces(i,1)+j == 1 || startSpaces(i,1)+j == 20 || startSpaces(i,2)+k == 1 || startSpaces(i,2)+k == 20)
            thirtyEmpty = false;
        else
            j = j + 1;
            if(l == 0)
                l = 1;
            else
                l = 0;
                k = k + 1;
            end
        end
    end
    castVals(17,i) = realsqrt(j^2 + k^2);
   

    fortyFiveEmpty=true;
    j = 1;
    while fortyFiveEmpty == true
        
        if(board.Spaces(startSpaces(i,1)+j,startSpaces(i,2)+j) ~= 0 || startSpaces(i,1)+j == 1 || startSpaces(i,1)+j == 20 || startSpaces(i,2)+j == 1 || startSpaces(i,2)+j == 20)
            fortyFiveEmpty = false;
        else
            j = j + 1;
        end
    end
    castVals(18,i) = realsqrt(2*(j^2));
   

    sixtyEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while sixtyEmpty == true
        
        if(board.Spaces(startSpaces(i,1)+j,startSpaces(i,2)+k) ~= 0 || startSpaces(i,1)+j == 1 || startSpaces(i,1)+j == 20 || startSpaces(i,2)+k == 1 || startSpaces(i,2)+k == 20)
            sixtyEmpty = false;
        else
            k = k + 1;
            if(l == 0)
                l = l + 1;
            else
                l = 0;
                j = j + 1;
            end
        end
    end
    castVals(19,i) = realsqrt(j^2 + k^2);
   
    seventyFiveEmpty=true;
    j = 1;
    k = 1;
    l=0;
    while seventyFiveEmpty == true
        
        if(board.Spaces(startSpaces(i,1)+j,startSpaces(i,2)+k) ~= 0 || startSpaces(i,1)+j == 1 || startSpaces(i,1)+j == 20 || startSpaces(i,2)+k == 1 || startSpaces(i,2)+k == 20)
            seventyFiveEmpty = false;
        else
            k = k + 1;
            if(l < 2)
                l = l + 1;
            else
                l = 0;
                j = j + 1;
            end
        end
    end
    castVals(20,i) = realsqrt((j^2) + (k^2));
 end
end

if(findMax) 
    maxCol = 1;
    unsorted = true;

    startSpacesSorted = startSpaces;
    while unsorted == true
        unsorted = false;
        maxCheck = max(castVals(:,1));
        if(size(castVals,2) == 1)
            maxCol = i;
        else
            for i=2:1:size(castVals,2)
                if(max(castVals(:,i)) > maxCheck)

                    maxCheck = max(castVals(:,i));


                    for j=2:1:size(castVals,2)
                        if(castVals(:,j) > castVals(:,j-1))
                            tempStart = startSpacesSorted(j-1,:);
                            startSpacesSorted(j-1,:) = startSpacesSorted(j,:);
                            startSpacesSorted(j,:) = tempStart;
                            tempCast = castVals(:,j-1);
                            castVals(:,j-1) = castVals(:,j);
                            castVals(:,j) = tempCast;
                            unsorted = true;



                        end
                    end
                    maxCol = i;

                end
            end
       end
    end

    maxVal = castVals(1,maxCol);
    for i=2:1:20
        if(castVals(i,maxCol) > maxVal)
            maxVal = castVals(i,maxCol);
            maxRow = i;
        else
            maxRow = 1;
        end
    end
else
    minCol = 1;
    unsorted = true;

    startSpacesSorted = startSpaces;
    while unsorted == true
        unsorted = false;
        minCheck = min(castVals(:,1));
        if(size(castVals,2) == 1)
            minCol = i;
        else
            for i=2:1:size(castVals,2)
                if(max(castVals(:,i)) < minCheck)

                    minCheck = min(castVals(:,i));


                    for j=2:1:size(castVals,2)
                        if(castVals(:,j) < castVals(:,j-1))
                            tempStart = startSpacesSorted(j-1,:);
                            startSpacesSorted(j-1,:) = startSpacesSorted(j,:);
                            startSpacesSorted(j,:) = tempStart;
                            tempCast = castVals(:,j-1);
                            castVals(:,j-1) = castVals(:,j);
                            castVals(:,j) = tempCast;
                            unsorted = true;



                        end
                    end
                    minCol = i;

                end
            end
       end
    end

    minVal = castVals(1,minCol);
    for i=2:1:20
        if(castVals(i,minCol) < minVal)
            minVal = castVals(i,minCol);
            minRow = i;
        else
            minRow = 1;
        end
    end
end

