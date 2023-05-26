prx{1} = [0,1,1,0,0]
pry{1} = [0,0,1,1,0]
rob1 = polyshape(prx{1},pry{1})
P1 = rob1
pgx{1} = [2,3,3,2,2];
pgy{1} = [1,1,3,3,1];
obs = polyshape(pgx{1},pgy{1})
P2 = obs

TR_1 = triangulation(P1);
TR_2 = triangulation(P2);

no_of_tri1 = size(TR_1.ConnectivityList,1); 
no_of_tri2 = size(TR_2.ConnectivityList,1);

ind12 = dec2base(0:8,3) - '0' + 1;

tri_in_p1_xy = TR_1.Points(TR_1.ConnectivityList(1,:),:);
    %disp(tri_in_p1_xy);
tri_in_p2_xy = TR_2.Points(TR_2.ConnectivityList(1,:),:);
    %disp(tri_in_p2_xy);
Hxy1 = tri_in_p1_xy(ind12(:,1),:) + tri_in_p2_xy(ind12(:,2),:);
Hexhull1 = convhull(Hxy1);
HexShape1 = polyshape(Hxy1(Hexhull1,:));
Psum = HexShape1;


tri_in_p1_xy = TR_1.Points(TR_1.ConnectivityList(1,:),:);
    %disp(tri_in_p1_xy);
tri_in_p2_xy = TR_2.Points(TR_2.ConnectivityList(2,:),:);
    %disp(tri_in_p2_xy);
Hxy2 = tri_in_p1_xy(ind12(:,1),:) + tri_in_p2_xy(ind12(:,2),:);
Hexhull2 = convhull(Hxy2);
HexShape2 = polyshape(Hxy2(Hexhull2,:));
Psum = union(Psum,HexShape2);

tri_in_p1_xy = TR_1.Points(TR_1.ConnectivityList(2,:),:);
    %disp(tri_in_p1_xy);
tri_in_p2_xy = TR_2.Points(TR_2.ConnectivityList(1,:),:);
    %disp(tri_in_p2_xy);
Hxy3 = tri_in_p1_xy(ind12(:,1),:) + tri_in_p2_xy(ind12(:,2),:);
Hexhull3 = convhull(Hxy3);
HexShape3 = polyshape(Hxy3(Hexhull3,:));
Psum = union(Psum,HexShape3);

tri_in_p1_xy = TR_1.Points(TR_1.ConnectivityList(2,:),:);
    %disp(tri_in_p1_xy);
tri_in_p2_xy = TR_2.Points(TR_2.ConnectivityList(2,:),:);
    %disp(tri_in_p2_xy);
Hxy4 = tri_in_p1_xy(ind12(:,1),:) + tri_in_p2_xy(ind12(:,2),:);
Hexhull4 = convhull(Hxy4);
HexShape4 = polyshape(Hxy4(Hexhull4,:));
Psum = union(Psum,HexShape4);

figure 
hold on
triplot(TR_1)
triplot(TR_2)
plot(Hxy1(Hexhull1,1),Hxy1(Hexhull1,2))
plot(Hxy2(Hexhull2,1),Hxy2(Hexhull2,2))
plot(Hxy3(Hexhull3,1),Hxy3(Hexhull3,2))
plot(Hxy4(Hexhull4,1),Hxy4(Hexhull4,2))
plot(Psum)
hold off
