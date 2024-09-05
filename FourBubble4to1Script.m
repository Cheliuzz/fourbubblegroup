%%% add experiment and movie-track, registered, and perframe to workspace
%%% manually

posx=trk.data(:,:,1); %remember to first load the video-track.mat on workspace
posy=trk.data(:,:,2);

%%to plot trajectories
%% verify the males IDs everytime
figure;
males_IDs = [1, 6, 11, 18];  % IDs for males
females_IDs = [2, 3, 4, 5, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 19, 20];  % IDs for females


for i = 1:4  % Loop over 4 subplots
    subplot(2, 2, i);  % Create a 2x2 grid of subplots
    
    % Plot the chaser's trajectory
    plot(posx(males_IDs(i), :), posy(males_IDs(i), :), 'k-', 'LineWidth', 1);
    hold on;  % Hold the plot to overlay the next plots on the same subplot
    
    % Calculate females indices for the current male
    start_idx = (i-1)*4 + 1;  % Start index for females (4 females per male)
    end_idx = start_idx + 3;  % End index for females
    
    % Loop to plot 4 runners' trajectories on each subplot
    for j = start_idx:end_idx
        plot(posx(females_IDs(j), :), posy(females_IDs(j), :), 'Color', rand(1,3), 'LineWidth', 1); % Random color for each runner
    end
    
    hold off;  % Release the hold for the next subplot
    
    % Set labels and title if needed
    xlabel('posx');
    ylabel('posy');
    title(['males ' num2str(males_IDs(i)) ' and females']);
end


%%%To START PLOTTING PERFRAMES 4:1

figure;
males_IDs = [1, 6, 11, 18];  % IDs for males
females_IDs = [2, 3, 4, 5, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 19, 20];  % IDs for females

for i = 1:4  % Loop over 4 subplots
    subplot(4, 1, i);  % Create a 4x1 grid of subplots
    
    % Plot the chaser's data in black
    plot(data{males_IDs(i)}, 'k-', 'LineWidth', 1);
    hold on;  % Hold on to overlay the next plots
    
    % Calculate runner indices for the current male
    start_idx = (i-1)*4 + 1;  % Start index for females (4 females per male)
    end_idx = start_idx + 3;  % End index for females
    
    % Loop to plot 4 runners' data on each subplot
    for j = start_idx:end_idx
        plot(data{females_IDs(j)}, 'Color', rand(1,3), 'LineWidth', 1); % Random color for each runner
    end
    
    % Set the x-axis limits
    set(gca, 'xlim', [0 900]);
    box off;  % Remove the box around the plot
    hold off;  % Release the hold for the next subplot
    sgtitle('closest fly nose to tail')
    han = axes(gcf,'Visible','off');
han.YLabel.Visible = 'on';
% Change ylabel for each parameter
ylabel(han, 'Change in wing angle from frame t to t + 1 (deg/s)');
han.XLabel.Visible = 'on';
xlabel(han, 'Time (s)');

end

%%% now to plot pos x only:

figure;
males_IDs = [1, 6, 11, 18];  % IDs for males
females_IDs = [2, 3, 4, 5, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 19, 20];  % IDs for females


for i = 1:4  % Loop over 4 subplots
    subplot(2, 2, i);  % Create a 2x2 grid of subplots
    
    % Plot the males trajectory
    plot(posx(males_IDs(i), :), 'k-', 'LineWidth', 1);
    hold on;  % Hold the plot to overlay the next plots on the same subplot
    
    % Calculate runner indices for the current chaser
    start_idx = (i-1)*4 + 1;  % Start index for females
    end_idx = start_idx + 3;  % End index for females
    
    % Loop to plot 4 runners' trajectories on each subplot
    for j = start_idx:end_idx
        plot(posx(females_IDs(j), :), 'Color', rand(1,3), 'LineWidth', 1); % Random color for each runner
    end
    
    hold off;  % Release the hold for the next subplot
    
    % Set labels and title if needed
    xlabel('Time');
    ylabel('posx');
    title(['Males ' num2str(males_IDs(i)) ' and females']);
end
figure;
males_IDs = [1, 6, 11, 18];  % IDs for males
females_IDs = [2, 3, 4, 5, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 19, 20];  % IDs for females

for i = 1:4  % Loop over 4 subplots
    subplot(4, 1, i);  % Create a 4x1 grid of subplots
    
    % Plot the male's data in black
    plot(data{males_IDs(i)}, 'k-', 'LineWidth', 1);
  
  
    % Set the x-axis limits
    set(gca, 'xlim', [0 900]);
    box off;  % Remove the box around the plot
    hold off;  % Release the hold for the next subplot
    sgtitle('closest fly nose to tail')
    han = axes(gcf,'Visible','off');
han.YLabel.Visible = 'on';
% Change ylabel for each parameter
ylabel(han, 'Change in wing angle from frame t to t + 1 (deg/s)');
han.XLabel.Visible = 'on';
xlabel(han, 'Time (s)');

end
