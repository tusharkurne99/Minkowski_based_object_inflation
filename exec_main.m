function [] = exec_main(number_of_nodes,is_grown)

% number of nodes 
ns=number_of_nodes;
map=map_definition(is_grown);
% 
% generate random nodes
[map, nodelocation]= generate_node(map,ns,is_grown);


% create undirected graph and its edges
[undirectedGraph,unedges]=generate_undirected_graph(map,nodelocation);


% define start and end point of simulation
startp=[3, 3];
endp=[26, 25];

% add start and end location as a new 2 nodes in undirected map.
% n+1 th node is start point, n+2th node is end point
[extungraph,exnodelocation,exunedges ]=addstartendpoint2ungraph(map,undirectedGraph,nodelocation,unedges,startp,endp);
exundnodIndex=[1:ns+2];
snodeund=ns+1;
enodeund=ns+2;


% optimal path with dijkstra on un-directional map
[Route Cost] = dijkstra(extungraph,exnodelocation,snodeund);
rt=Route{enodeund};

dijkstra_route=exnodelocation(rt,:);
cost=pathcost(dijkstra_route);
drawRoute('dijkstra on undirected map',snodeund,enodeund,exnodelocation,exundnodIndex,exunedges,rt,cost,is_grown);

end