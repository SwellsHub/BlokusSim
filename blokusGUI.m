%gui for the gameplay
%Section 1 Group 11

x = linspace(1,20,20);
y = linspace(1,20,20);

[X,Y] = meshgrid(x,y);
coordinates = [X(:) Y(:)];

%% Plot the playboard
function [board] = createBoardGui()
    hold on

    plot(X,Y,'k');
    plot(X',Y','k');

         for i = 1:1:size(board.Spaces,1)
            for j=1:1:size(board.Spaces,2)
            x = i;
            y = j;

            idx = knnsearch(coordinates,[x y], 'k',4);
            x0 = min(coordinates(idx,1)); x1 = max(coordinates(idx,1));
            y0 = min(coordinates(idx,2)); y1 = max(coordinates(idx,2));

            coori = [x0 y0 ; x0 y1; x1 y1; x1 y0; x0 y0];
            if(board.Spaces(i,j) == 1)
                patch(coori(:,1),coori(:,2),'g');
            elseif(board.Spaces(i,j) == 2)
                patch(coori(:,1),coori(:,2),'r');
            elseif(board.Spaces(i,j) == 3)
                patch(coori(:,1),coori(:,2),'b');
            elseif(board.Spaces(i,j) == 4)
                patch(coori(:,1),coori(:,2),'y');
            end
            end

        end
end