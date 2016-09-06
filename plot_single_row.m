function plot_single_row

load Varsha_SpaceTake_New.csv
y = Varsha_SpaceTake_New(1:57);
    for i = 1:3:57
    hold on
    scatter3(y(:,i),y(:,i+1),y(:,i+2))
    hold off
    end
end