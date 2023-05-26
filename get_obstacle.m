function [obsx,obsy] = get_obstacle(obs_number,is_grown)

    if ~is_grown
    switch(obs_number)
        case 1 
            obsx = [3,3,10,9,5,3]; obsy = [12,8,10,16,18,12];
        case 2
            obsx = [5,6,14,15,15,14,6,5]; obsy = [22,20,20,22,25,27,27,25];
        case 3
            obsx = [17,19,19,21.5,21.5,24,24,21.5,21.5,19,19,17]; obsy = [16,16,13,13,16,16,18,18,21,21,18,18];
        case 4
            obsx = [12,17,16,13,12]; obsy = [5,5,12,12,5];
        case 5
            obsx = [24,28,28,24,24]; obsy = [3,3,11,11,3];
        case 6 
            obsx = [0 30 30 0 0 NaN 0.01 29.99 29.99 0.01 0.01]; obsy = [0 0 30 30 0 NaN 0.01 0.01 29.99 29.99 0.01];%to define the hole
        otherwise
            disp('Invalid Obstacle number given')
       

    end

    else
        switch(obs_number)
            case 1 
                [obsx,obsy] = union_of_minkowski(1);
            case 2
                [obsx,obsy] = union_of_minkowski(2);
            case 3
                [obsx,obsy] = union_of_minkowski(3);
            case 4
                [obsx,obsy] = union_of_minkowski(4);
            case 5
                [obsx,obsy] = union_of_minkowski(5);
            case 6 
                [obsx,obsy] = union_of_minkowski(6);
            otherwise
                disp('Invalid Obstacle number given')
       

        end
    end
    
    if is_grown
        obsx = obsx';
        obsy = obsy';
    end
    

end

