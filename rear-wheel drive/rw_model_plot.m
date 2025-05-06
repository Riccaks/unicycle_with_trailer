%% PLOTS

close all

dt  =  0.01;

% Create a blank figure
f = figure;
f.WindowState = 'maximized';

% Getting Vectors from Sim
q_out = out.q_out.Data.';
tout = out.tout.';

% Post processing data
time  =  0 : dt : tout(end);
q_pp  =  zeros(size(q_out,1),size(time,2));
for i  =  1 : size(time,2)
    [d, ix]  =  min(abs(tout-time(i)));
    q_pp(:,i)  =  q_out(:, ix);
end

% Bicycle motion
hold on
axis equal
% axis ([-0.5 2.5 -0.5 2.5])
grid on
xlabel('x (m)');
ylabel('y (m)');
title('unicycle with trailer motion')

rho = 0.5;

%% Plot init
% Visual circle for unicycle and trailer
R_a(1) = rectangle('Position',[q_pp(1,1)-rho/2, q_pp(2,1)-rho/2, rho, rho],'Curvature',[1,1],'EdgeColor','b','LineWidth',3);
R_p(1) = rectangle('Position',[q_pp(1,1)-rho/2 - L * cos(q_pp(4,1)), q_pp(2,1)-rho/2 - L * sin(q_pp(4,1)), rho, rho],'Curvature',[1,1],'EdgeColor','r','LineWidth',3);

% Direction of unicycle and connection of the trialer
R_a(2) = line([q_pp(1,1);rho*cos(q_pp(3,1)) + q_pp(1,1)],[q_pp(2,1);rho*sin(q_pp(3,1))+q_pp(2,1)],'LineStyle','-','Color','b','LineWidth',3);
R_p(2) = line([q_pp(1,1) - L * cos(q_pp(4,1)); q_pp(1,1)],[q_pp(2,1)- L * sin(q_pp(4,1)); q_pp(2,1)],'LineStyle','-','Color','k','LineWidth',1);

% Trajectory of both unicycle and trailer
R_l(1) = plot(q_pp(1,1), q_pp(2,1),'LineStyle', '-', 'Color',[0.2 .7 .5],'LineWidth',3);
R_lp(1) = plot(q_pp(1,1) - L * cos(q_pp(4,1)), q_pp(2,1) - L * sin(q_pp(4,1)),'LineStyle', '-', 'Color', [1 1 0],'LineWidth',3);


%% Plot update
for i=1:1:size(q_pp,2)
    
    delete(R_a)
    delete(R_p)
    delete(R_l)
    delete(R_lp)
    
    R_a(1) = rectangle('Position',[q_pp(1,i)-rho/2, q_pp(2,i)-rho/2, rho, rho],'Curvature',[1,1],'EdgeColor','b','LineWidth',3);
    R_a(2) = line([q_pp(1,i);rho*cos(q_pp(3,i)) + q_pp(1,i)],[q_pp(2,i);rho*sin(q_pp(3,i))+q_pp(2,i)],'LineStyle','-','Color','b','LineWidth',3);
    
    R_p(1) = rectangle('Position',[q_pp(1,i)-rho/2 - L * cos(q_pp(4,i)), q_pp(2,i)-rho/2 - L * sin(q_pp(4,i)), rho, rho],'Curvature',[1,1],'EdgeColor','r','LineWidth',3);
    R_p(2) = line([q_pp(1,i) - L * cos(q_pp(4,i)); q_pp(1,i)],[q_pp(2,i)- L * sin(q_pp(4,i)); q_pp(2,i)],'LineStyle','-','Color','k','LineWidth',1);

    R_l(1) = plot(q_pp(1,1:i), q_pp(2,1:i),'LineStyle', '-', 'Color',[0.2 .7 .5],'LineWidth',3);
    R_lp(1) = plot(q_pp(1,1:i) - L * cos(q_pp(4,i)), q_pp(2,1:i) - L * sin(q_pp(4,i)),'LineStyle', '-', 'Color',[1 1 0],'LineWidth',3);
    
    pause(dt)
    drawnow
    
end

%% Errors 

figure;
plot(time, q_pp(2,:), 'b-', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Error (m)');
title('y-error over time');
grid on;

figure;
plot(time, q_pp(3,:), 'b-', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Error (rad)');
title('\theta_a -error over time');
grid on;

figure;
plot(time, q_pp(4,:), 'b-', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Error (rad)');
title('\theta_p -error over time');
grid on;