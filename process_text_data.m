function Cell = process_text_data()
%# read the whole file to a temporary cell array
fid = fopen('test.txt','rt');
tmp = textscan(fid,'%s','Delimiter',' ');
value1 = 0;
value2 = 0;
value3 = 0;
value4 = 0;
value5 = 0;
counter = 1;
Cell = {};
temp_Cell = {};
j = 1;
len = size(tmp{1,1});
flag = 0;
for i = 1:size(tmp{1,1})-2
    value1 = tmp{1,1}(i,1);
    value2 = tmp{1,1}(i+1,1);
    value3 = tmp{1,1}(i+2,1);
    
    if strcmp(value1,'0') && strcmp(value2,'0.000') && ~strcmp(value3,'0.000')
        
        while (~strcmp(value4,'0') | ~strcmp(value5,'0.000'))
         temp_Cell{j,1} =  tmp{1,1}(i,1);
         %if i<len-1
         j = j+1;  
         i = i+1;
         %end
         if (i>(size(tmp{1,1})-1))
             flag = 1;
             temp_Cell{j,1} =  tmp{1,1}(i,1);
             break;
         else
         value4 = tmp{1,1}(i,1);
         value5 = tmp{1,1}(i+1,1);
         end
         %else
         %    break;
         %end
        end
        if strcmp(value4,'0') & strcmp(value5,'0.000') 
            i = i+2;
            j=1;
            value4 = '0';
            value5 = '0';
            display(temp_Cell);
            Cell{1,counter} = temp_Cell
            temp_Cell = {};
            counter = counter + 1;
            
%         elseif i == size(tmp{1,1})-2
%             display(temp_Cell);
%             Cell{1,counter} = temp_Cell
%             temp_Cell = {};
%             counter = counter + 1;
        end
        if flag == 1
            Cell{1,counter} = temp_Cell
            break;
        end
    end
% varsha
    if tmo > 100000
       tmp(:,i) = [];
    end
% end varsha
    i = i+1;

end
 
fclose(fid);
end