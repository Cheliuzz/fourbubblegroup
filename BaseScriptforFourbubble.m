%%This asumes you have added the experiment folder, the movie-track.mat and
%%registered_trx to the workspace and eventually you'll add the perframe
%%feature to workspace, all the added things are manually

posx=trk.data(:,:,1); %remember to first load the video-track.mat on workspace
posy=trk.data(:,:,2);

figure;
chaser_IDs = [1, 4, 7, 10];
runner_IDs1 = [2, 5, 8, 11];  % First set of runners
runner_IDs2 = [3, 6, 9, 12];  % Second set of runners

for i = 1:4
    subplot(2, 2, i);  % Create a 2x2 grid of subplots, with the current plot being 'i'
    
    % Plot the chaser's data first
    plot(posx(chaser_IDs(i), :), posy(chaser_IDs(i), :), 'k-', 'LineWidth', 1);
    hold on;  % Hold the plot to overlay the next plots on the same subplot
    
    % Plot the first runner's data
    plot(posx(runner_IDs1(i), :), posy(runner_IDs1(i), :), 'c-', 'LineWidth', 1);
    
    % Plot the second runner's data
    plot(posx(runner_IDs2(i), :), posy(runner_IDs2(i), :), 'm-', 'LineWidth', 1);

    hold off;  % Release the hold on the current plot
end
% Create a new time array matching the length of the data arrays
time = trx.timestamps;
new_time = linspace(min(time), max(time), length(data{2}));
% 
% To carry out mean and std, the data has to be numeric or logical
% Therefore, we have to convert cell arrays or structures to numeric array

figure;
chaser_IDs = [1, 4, 7, 10];       % IDs for chasers
runner_IDs1 = [2, 5, 8, 11];      % IDs for the first set of runners
runner_IDs2 = [3, 6, 9, 12];      % IDs for the second set of runners

for i = 1:4  % Loop over 4 subplots
    subplot(4, 1, i);  % Create a 4x1 grid of subplots
    
    % Plot the chaser's data in black
    plot(data{chaser_IDs(i)}, 'k-', 'LineWidth', 1);
    hold on;  % Hold on to overlay the next plots
    
    % Plot the first runner's data in blue
    plot(data{runner_IDs1(i)}, 'c-', 'LineWidth', 1);
    
    % Plot the second runner's data in red
    plot(data{runner_IDs2(i)}, 'm-', 'LineWidth', 1);

    % Set the x-axis limits
    set(gca, 'xlim', [0 900]);
    box off;  % Remove the box around the plot
    hold off;  % Release the hold for the next subplot
end
sgtitle('wing angle imbalance')
han = axes(gcf,'Visible','off');
han.YLabel.Visible = 'on';
% Change ylabel for each parameter
ylabel(han, 'Change in wing angle from frame t to t + 1 (deg/s)');
han.XLabel.Visible = 'on';
xlabel(han, 'Time (s)');

figure;
for i = [ 1 2 3 4 5 6 7 8 9 10 11 12] 
    subplot(12,1,i);
    plot(data {i} , 'k')
    set(gca, 'xlim', [0 900] );
    box off;
end

% Change sgtitle for each parameter
sgtitle('wing angle imbalance')
han = axes(gcf,'Visible','off');
han.YLabel.Visible = 'on';
% Change ylabel for each parameter
ylabel(han, 'Change in wing angle from frame t to t + 1 (deg/s)');
han.XLabel.Visible = 'on';
xlabel(han, 'Time (s)');
