%% For a point robot
clear
close all
clc

numberofelements =100;

% case :  when the robot is considered a point object
is_grown = 0;
exec_main(numberofelements,is_grown);

% case : when the robot is a polygon
is_grown = 1;
exec_main(numberofelements,is_grown);
% 
% 
% 
