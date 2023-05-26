function poly_sum = obs_grow(P1,P2)
% triangulate each polyshape
%triangulation decomposes a complex polygon into a collection of simpler triangular polygons
TR_1 = triangulation(P1);
TR_2 = triangulation(P2);

% fetching the triangles formed for each triangle 
no_of_tri1 = size(TR_1.ConnectivityList,1); 
no_of_tri2 = size(TR_2.ConnectivityList,1);

comb = [1,1;1,2;1,3;2,1;2,2;2,3;3,1;3,2;3,3];

for i = 1:no_of_tri1
  for j = 1:no_of_tri2
    % calculating the Minkowski sum of the two triangles iA and iB from each triangulated polyshape
    tri_in_p1_xy = TR_1.Points(TR_1.ConnectivityList(i,:),:);%finding the points related to the i th triangle in obs
    
    tri_in_p2_xy = TR_2.Points(TR_2.ConnectivityList(j,:),:);%finding the points related to the j th triangle in robot
    
    ver_comb = tri_in_p1_xy(comb(:,1),:) + tri_in_p2_xy(comb(:,2),:);

    %The convex hull of a set of points S in n dimensions is the intersection of all convex sets containing S
    hull = convhull(ver_comb);
    HexShape = polyshape(ver_comb(hull,:));
    
    if (i == 1) && (j == 1)
      poly_sum = HexShape;
    else
      poly_sum = union(poly_sum,HexShape);
    end
    warning('off','backtrace');
  end
  warning('off','backtrace');
end


