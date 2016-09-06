
% open the file
%fid = fopen('Dummy.csv','r');
fid = fopen('Varsha_SpaceTake_New.csv','r');
% fid = fopen('LaiYI_SpaceTake_HipsRemoved.csv','r');
 %fid = fopen('Dummy.csv');
 counter_next = 0;
 counter_prev = 0;
 old_n = zeros(30,1);
 if fid>0
     % loop until end of file is reached
     while ~feof(fid)
        % while counter
         % read the current line
         %line = fgetl(fid);
      % fid = fopen('Varsha_SpaceTake_New.csv','r'); 
      line =  dlmread('Varsha_SpaceTake_New.csv',',',[counter_prev 0 counter_next 56]);
      counter_prev = counter_prev+1;
      counter_next = counter_next+1;
      
         
         % extract data from the line
         % plot the data
         % wait two seconds until continuing with next line
        % line_mat = cell2mat(line);
        fid2 = fopen('Varsha_overwritten.csv','w');
        %dlmwrite('Varsha_overwritten.csv',line,'delimiter',',',1,1);
        dlmwrite('Varsha_overwritten.csv',line,',',0,0);
        
        
         %csvwrite('Varsha_overwritten.csv',line,0,0)
         %dlmwrite('Varsha_overwritten.csv',line_mat,'-append','delimiter',',');
         %dlmwrite('Varsha_overwritten.csv', line_mat,'-append', 'delimiter', ',');
         n = seq_kmeans_princeton(old_n);
         old_n = n;
         display(n);
         %seq_kmeans_princeton
         fclose(fid2);
         %type('Varsha_overwritten.csv')
         
         %pause(2.0);
         
        
     end
     fclose(fid);
        
     % close the file
 end
