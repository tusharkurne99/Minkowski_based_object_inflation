function map =map_definition(should_grow)

Npoly=5; %Define number of polygons

% Define x and y coordinates of each polygons given
%Example of 2 polygons with respective x and y coordinates is shown below

% map.pgx{1}=[2 8.5 8.5 4 2 2 1 1 2 4 2];
% map.pgy{1}=[8 10 1 3 3 1 1 6 6 5 8];
% map.pgx{2}=[2 8 2 15 2 1 1 2 2];
% map.pgy{2}=[10 16 22 15.5 9 10 16 16 10];

%% Write your code here...
if should_grow == 0
    [map.pgx{1},map.pgy{1}] = get_obstacle(1,should_grow);
    [map.pgx{2},map.pgy{2}] = get_obstacle(2,should_grow);
    [map.pgx{3},map.pgy{3}] = get_obstacle(3,should_grow);
    [map.pgx{4},map.pgy{4}] = get_obstacle(4,should_grow);
    [map.pgx{5},map.pgy{5}] = get_obstacle(5,should_grow);
    
    %Define map range
    %that is the range of the coordinate system
    map.xrange=[0 30];
    map.yrange=[0 30];
else
    [map.pgx{1},map.pgy{1}] = get_obstacle(1,should_grow);
    [map.pgx{2},map.pgy{2}] = get_obstacle(2,should_grow);
    [map.pgx{3},map.pgy{3}] = get_obstacle(3,should_grow);
    [map.pgx{4},map.pgy{4}] = get_obstacle(4,should_grow);
    [map.pgx{5},map.pgy{5}] = get_obstacle(5,should_grow);
    [map.pgx{6},map.pgy{6}] = get_obstacle(6,should_grow);

    %Define map range
    %that is the range of the coordinate system
    map.xrange=[0.01 29.99];
    map.yrange=[0.01 29.99];

end


%Plot map
figure;
plot([0 30 30 0 0],[0 0 30 30 0]);%plotting the coordinate system 30x30
hold on

% Fill polygons
for ii=1:Npoly    
    fill(map.pgx{ii},map.pgy{ii},'b')
end
hold off

    