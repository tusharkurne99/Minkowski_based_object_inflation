function grown = min_sum()
clear
clc

n_obs = 6

prx{1} = [0.8,0.2,0,0.6,0.8]
pry{1} = [0.8,0.6,0,0.2,0.8]

prx{2} = [-0.04, -0.84, -0.76, 0.04, -0.04]
pry{2} = [0.04, -0.76, -0.84, -0.04, 0.04]

rob1 = polyshape(prx{1},pry{1})
rob_tail = polyshape(prx{2},pry{2})

pgx{1} = [3,3,10,9,5,3];
pgy{1} = [12,8,10,16,18,12];

pgx{2}=[5,6,14,15,15,14,6,5];
pgy{2}=[22,20,20,22,25,27,27,25];

pgx{3} = [17,19,19,21.5,21.5,24,24,21.5,21.5,19,19,17];
pgy{3} = [16,16,13,13,16,16,18,18,21,21,18,18];

pgx{4} = [12,17,16,13,12];
pgy{4} = [5,5,12,12,5];

pgx{5} = [24,28,28,24,24];
pgy{5} = [3,3,11,11,3];

pgx{6} = [0 30 30 0 0 NaN 0.01 29.99 29.99 0.01 0.01];
pgy{6} = [0 0 30 30 0 NaN 0.01 0.01 29.99 29.99 0.01];

obs1 = polyshape(pgx{1},pgy{1})
obs2 = polyshape(pgx{2},pgy{2})
obs3 = polyshape(pgx{3},pgy{3})
obs4 = polyshape(pgx{4},pgy{4})
obs5 = polyshape(pgx{5},pgy{5})
obs6 = polyshape(pgx{6},pgy{6})

obstacles = [obs1, obs2, obs3, obs4, obs5, obs6]


grown.grown_obstacle = []
intr_shape = []
i=1
while i<n_obs+1
    MsumShape_intr = obs_grow(obstacles(i),rob1)
    intr_shape = [intr_shape; MsumShape_intr(:,1)]
    MsumShape_cmplt = obs_grow(MsumShape_intr(:,1),rob_tail)
    grown.grown_obstacle = [grown.grown_obstacle; MsumShape_cmplt(:,1)]
    i= i+1
end
% 
% MSumShape = minkowskiSum(obs1,rob)
% MsumShape2 = minkowskiSum(obs2,rob)
% 
figure;
plot([0 30 30 0 0],[0 0 30 30 0]);%plotting the coordinate system 30x30
hold on
plot(grown.grown_obstacle)
plot(intr_shape)
plot(obstacles)
plot(rob_tail)
plot(rob1)
hold off
% plot(obs1)
% plot(obs2)
% plot(rob)
% plot(MSumShape)
% plot(MsumShape2)