clc;clear;
%% John Conway's Game of life simulation...
% written by Nikhil yewale
% email -   yewale.nikhil65@gmail.com
%% index - 1 is birth/existence, index 0 is death/absence
N =6; M =6; 
% lat_now =  sprand(N,M,0.07);               % intial configuration lat =
% lat_now = spones(lat_now);
% lat_now = sparse(N,M);
% lat_now(22,22) = 1;
% lat_now(23,23) = 1; 
% lat_now(24,21) = 1;lat_now(24,22 ) =1;lat_now(24,23)=1;
lat_now = [0 0 0 0 0 0;0 0 1 0 0 0;0 0 0 1 0 0;0 1 1 1 0 0 ;0 0 0 0 0 0 ; 0 0 0 0 0 0];
lat_next = lat_now;


maxiter = 600;                          % number of generations
for i = 1:maxiter                       % iteration for each generation
    for j = 1:N                         % along row
        for k = 1:M                     % along column
            % 8 neighbours always for every lattice point..
            v = Find8Neighbours(j,k,N,M);
            % vector v depending on whether the lattice point is in interior or
            % boundary point      #periodic boundary in top and bottom side
            V = [lat_now(v(1,1),v(1,2));lat_now(v(2,1),v(2,2));lat_now(v(3,1),v(3,2));lat_now(v(4,1),v(4,2));lat_now(v(5,1),v(5,2));lat_now(v(6,1),v(6,2));lat_now(v(7,1),v(7,2));lat_now(v(8,1),v(8,2))];
            num = sum(V(:)==1);   % live nieghbours
            state = lat_now(j,k);
            switch state
                case 1
                    if(num<2 || num>3)
                        lat_next(j,k)=0;     % either loner or surrounded..
                    end
                case 0
                    if(num==3)
                        lat_next(j,k)=1;    % birth  
                    end
            end
        end
    end
    lat_now = lat_next;
    %plotting as black and white
    imagesc((1:M)+0.5, (1:N)+0.5, lat_now);          % Plot the image
    colormap(gray);                              % Use a gray colormap
    axis equal                                   % Make axes grid sizes equal
    set(gca, 'XTick', 1:(M+1), 'YTick', 1:(N+1), ...  % Change some axes properties
        'XLim', [1 M+1], 'YLim', [1 N+1], ...
        'GridLineStyle', '-', 'XGrid', 'on', 'YGrid', 'on');
    pause(0.1)
end




