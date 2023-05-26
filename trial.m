pgx{1}=[2,5,9,8,4,2];
pgy{1}=[12,8,10,16,18,12];

pgx{2}=[4,5,13,14,14,13,5,4];
pgy{2}=[22,20,20,22,25,27,27,25];

figure;
plot([ 0 30 30 0 0],[ 0 0 30 30 0]);%plotting the coordinate system 30x30
hold on

% Fill polygons
for i=1:2    
    fill(pgx{i},pgy{i},'b')
end
hold off