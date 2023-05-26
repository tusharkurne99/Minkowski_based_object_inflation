function [map, nodelocation]= generate_node(map,nnode,is_grown)

% merge vertices of all obstacle
obsx=map.pgx{1};
obsy=map.pgy{1};
for i=2:length(map.pgx)
    obsx=[obsx NaN map.pgx{i}];% we are using NaN as separator in the array
    obsy=[obsy NaN map.pgy{i}];
end
map.obsx=obsx;
map.obsy=obsy; 
% set nodelocation to all zero
nodelocation=zeros(nnode,2);%initializing a matrix of nnode x 2 fro the randomly generated nodes
% generate nodes
n=1;


while (n<=nnode)
    % generate random two number in range of map's border
    %% Write your code here
    
    if(is_grown)
        [obsx6,obsy6] = get_obstacle(6,1);
        start = obsx6(length(obsx6));
        end_ = obsx6(length(obsx6)-2);
        rx=rand* (end_-start) + start;
        ry=rand* (end_-start) + start;
    else
        rx=rand* (map.xrange(2)-map.xrange(1)) + map.xrange(1);
        ry=rand* (map.yrange(2)-map.yrange(1)) + map.yrange(1);
    end

    
    % if this node is not inside any obstacle
    %% Write your code here
    %in = inpolygon(xq,yq,xv,yv) returns in indicating if the query points specified by xq and yq are inside or on the edge of the polygon area defined by xv and yv.
    if ~inpolygon(rx,ry,obsx,obsy) %give inputs to inpolygon()
        nodelocation(n,1)=rx;
        nodelocation(n,2)=ry;
        n = n+1;
        % add this location to nodelocation list


    end
end
hold on;
plot(nodelocation(:,1),nodelocation(:,2),'r*');
hold off;