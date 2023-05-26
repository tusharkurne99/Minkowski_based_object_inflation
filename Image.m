clc,clearvars, close all

data=imread('image.png');
imshow(data);
[rows, columns, numberOfColorChannels] = size(data);
des_rows = 30;
des_columns = 30;
row_jump = rows/des_rows;
col_jump = columns/des_columns;


hold on;
for row = 1 : row_jump : rows
    line([1,columns], [row,row],'Color','r');%(1,row) --- (columns,row)  -> Horizontal Lines  
end

for col = 1 : col_jump : columns
    line([col,col], [1,rows],'Color','r');%(col,1) --- (col,rows)  -> vertical lines
end

i=0 ; j =0;
for row = rows : -1*row_jump : -1
    j=0;
    for col =  1 : col_jump : (ceil(columns/des_columns)*des_columns)
        textString =  sprintf('(%d, %d)',j, i);
        fprintf('row : %f , col : %f \n',row,col)
        %text(col + col_jump,row + row_jump, textString,'FontSize', 7)
        text(col,row , textString,'FontSize', 7)
        j=j+1;
    end
    i=i+1;
end
