function [Route, Cost] = dijkstra(exbigraph,exbiloc,startnode)
% Find path and cost to all other nodes in the graph
% Route keeps the optimal path to reach to all points from start
% Cost keeps all the 

graph=exbigraph; % graph(x,y) = 1 means there is an edge between nodes x and y & '0' for vice-versa
Loc=exbiloc;     % Loc has the coordinate(x,y) of the nodes present in the graph loc -> (n x 2)
n=size(graph,1); % number of total nodes
Cost=inf(n,1);   % Initiating starting cost to infinite
curr=startnode;  % Staring the algorithm from start node
Route=cell(n,1); % Initializes the  empty routes to all nodes from start
Cost(curr)=0;    % Initiating the cost of start node to zero
Tabu=[curr];     % Storing the list of visited nodes

%taken this manipulation to for adding the new value in the cell of the Routes where each cell is an array
cRoute=[curr];   % Route for currently exploring node
i=1;
% for number of nodes
while i<n
    i=i+1;
    % take all possible node list
    T=1:n;
    % delete already visited node
    T(Tabu)=[];   
    
    % find connected node from current node which are not visited yet    
    %% Write your code here
    % finding all the neighbouring node that are not already visited
    % I vector contains the indices of the adjacent vertices of the curr
    % node
    I=find(graph(curr,T)==1);
    

   
    %% Write your code here
    % calculate connected nodes euclid distance from current node and add
    % current nodes cost! 
    % below line is partially correct, u need to fill the second argument
    % to the function cost cal
    %fprintf('dim of Loc(curr,:) %d x %d \n',size(Loc(curr,:),1),size(Loc(curr,:),2));
    %fprintf('dim of Loc(T(I),:) %d x %d \n',size(Loc(T(I),:),1),size(Loc(T(I),:),2));
    %fprintf('dim of Cost(curr) %d x %d \n',size(Cost(curr),1),size(Cost(curr),2));
    

    cost=costcal(Loc(curr,:),Loc(T(I),:)) + Cost(curr);

    %% Write your code here
    % if new finding coset is less than old cost then replace
    J=find(Cost(T(I))>cost); % J is vector of all the indexes which has a better cost from the curr node
    Cost(T(I(J)))=cost(J);   
    
    %% Write your code here
    % update new comming node rote if the new cost is more efficient
    for j=1:length(J)
        Route{T(I(J(j)))}=[cRoute T(I(J(j)))]; % in a cell {} -> used for accessing the cell value ,() -> used for accessing the cell        
    end


%% 
    % finding minimum costed node which is not visited yet in this iteration
    [mn cr]=min(Cost(T));
    %% Write your code here
    if isinf(mn)
        i=n; % for stopping condition        
        % Suggest the condition when the minimum cost of unvisited node
        % become infinite


    end
    %selecting the next node for exploration
    curr=T(cr);
    % select selected route as forbitten route to not to select this nodes
    % again
    cRoute=Route{curr};

    % Updating the table of visited nodes
    Tabu=[Tabu curr];
end
