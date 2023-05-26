function [rx,ry] = get_robot(convex_number)
    switch(convex_number)
        case 1 
            rx = [0.8,0.2,0,0.6]; ry = [0.8,0.6,0,0.2];
        case 2 
            rx = [-0.04,-0.84,-0.76,0.04]; ry = [0.04,-0.76,-0.84,-0.04];
    end
end