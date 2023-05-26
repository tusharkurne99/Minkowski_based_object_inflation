function [grown_obsx,grown_obsy] = union_of_minkowski(obs_number)
    [ox1, oy1] = get_obstacle(obs_number,0);
    po1 = polyshape(ox1,oy1);
    
    [rx1, ry1] = get_robot(1);
    pr1 = polyshape(rx1,ry1);

    o2 = obs_grow(po1,pr1); 
    po2 = polyshape(o2.Vertices(:,1),o2.Vertices(:,2));

    [rx2,ry2] = get_robot(2);
    %for taking miskowski difference
    rx2 = rx2*-1;
    ry2 = ry2*-1;
    
    pr2 = polyshape(rx2,ry2);

    fo = obs_grow(po2,pr2); 

    grown_obsx = fo.Vertices(:,1);
    grown_obsy = fo.Vertices(:,2);
    warning('off','backtrace');

end