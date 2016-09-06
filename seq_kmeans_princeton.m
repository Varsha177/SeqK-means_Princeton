
function n =  seq_kmeans_princeton(new_n)
tic
%update the count for the clusters
n = new_n;
% flag = 0;

%dlmread('Varsha_overwritten.csv',',');
%load Varsha_overwritten.csv;
%fid = fopen('Varsha_overwritten.txt','r');
%data_point = textscan(fid,'%f');
%data_point = textread('Varsha_overwritten.csv', '', 'delimiter', ','
%data_point = importdata('Varsha_overwritten.csv');
data_point = dlmread('Varsha_overwritten.csv',',');
load RecordedMeans30.csv;
%data_all  = Varsha_SpaceTake_New;
%data_point  = Varsha_overwritten;

means = RecordedMeans30(1:29, :);
mean_count = size(means,1);

%the mean with the highest 'n' value could be the cluster. 
%row_count = size(Varsha_overwritten,1);
row_count = size(data_point,1);
%means = Varsha_SpaceTake_New_accum;

closest_mean = 0;
for i = 1:row_count
%while(!EOF) incase of data streaming, present code takes cumulative data
%data_point = data_all(i,:);

    % Find the closest mean - index
    display('closest_ind');
    closest_ind = dsearchn(means,data_point);
    %display(size(closest_ind));
    
    %increment the respective nth value (corresponding to the closest mean)
    n(closest_ind) = n(closest_ind) + 1;

    %change corresponding mean value (mi by mi + (1/ni)*( x - mi))
    means(closest_ind,:) = means(closest_ind,:) + ((1/n(closest_ind)) * (data_point - means(closest_ind,:)));

    %finding the max value in n
    [M,index] = max(n(:));
    %final_mean = means(index,:);
    
    %sorting to find the largest 5 clusters
    [sortedn,sortingIndices] = sort(n,'descend');
    maxValues = sortedn(1:5);
    maxValueIndices = sortingIndices(1:5);
    
    final_mean_1 = means(maxValueIndices(1),:);
%     final_mean_2 = means(maxValueIndices(2),:);
%     final_mean_3 = means(maxValueIndices(3),:);
%     final_mean_4 = means(maxValueIndices(4),:);
%     final_mean_5 = means(maxValueIndices(5),:);
    
    %OSCTrial
%     echoudp('on',8080)
      u = udp('127.0.0.1',7488);  
      fopen(u);
%       oscsend(u,'/test','fffffff', 1.05);
%       display('final_mean:')
%       display(final_mean_1(1,7))
%       oscsend(u,'/test','fffffff', final_mean_1(1,1), final_mean_1(1,2),final_mean_1(1,3),final_mean_1(1,4));
       oscsend(u,'/test','fffffff', [final_mean_1]);

%       fclose(u);
    
% 
%         figure_1 =  display_skeletons(final_mean_1, 'red');
%         figure_2 = display_skeletons(final_mean_2, 'blue');
%         display_skeletons(final_mean_3, 'black');
%         display_skeletons(final_mean_4, 'yellow');
%         display_skeletons(final_mean_5, 'green');
   

%The below code is to send skeletons to Processing. Can be ommited
%accordingly. 
% % % % for i = 1:10

  display_skeletons(final_mean_1,'white');

% % %   plot(i, i)
% % %   filename = sprintf('forprocessing.png');
% set(gcf,'Color','black');
% Saves white skeleton with black background. (IMP for Processing)
  saveas(gcf, '/Users/hareesh/Documents/OneDrive/Thesis/Matlab/blacktrial', 'png')
% end


% Display in Matlab
   figure(1);
   subplot(2, 2, 1);
   display_skeletons(final_mean_1,'red');
% % %     
% % %     %fig = get(groot,'CurrentFigure');
% % %     subplot(2, 2, 2);
% % %     display_skeletons(final_mean_2, 'blue');   
% % %     
   figure(1);
   subplot(2, 2, 3);
   display_skeletons(final_mean_3, 'cyan');
% % %    
    subplot(2, 2, 4);
    display_skeletons(final_mean_4, 'green');
      
    pause(0.4);
      
     
% % % %     subplot(2, 2, 3);
% % % %     image(image3);
% % % %     subplot(2, 2, 4);
% % % %     image(image4);
% % %     %displaying the skeletal mean
% % % %     figure;
% % % %     figure1 = display_skeletons(final_mean_1);
% % % %     figure2 = display_skeletons(final_mean_2);
% % % %     figrue3 = display_skeletons(final_mean_3);
% % % %     figure4 = display_skeletons(final_mean_4);
% % % %     figure5 = display_skeletons(final_mean_5);
% % %        
end
toc
end
