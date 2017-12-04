%GB comments
1. 70 incorrect plots. Should be generated like this:
sol = ode23(@repressilator,[0 200], [1, 0,0]);
hold on
plot(sol.x, sol.y(1,:));
plot(sol.x, sol.y(2,:));
plot(sol.x, sol.y(3,:));
hold off 
legend('x1','x2','x3')

2 70 incorrect plot. Please see the above plotting approach. Using this and inputting .5 for all starting concentrations will indicate that the oscillatory behavior for all genes (there are 3) is removed. One gene starts high but is gradually lost and doesn’t rebound because its levels were never high enough to initiate the subsequent gene. 
3. 80 This questions requires you to scan through multiple parameters of k2 to capture and understand the behavior of the system. Values of k2<1 leads to dampened oscillations. Values below 0.15 remove osclliations. Values above 1 generate oscillations with a periodicity and amplitude directed by the magnitude of k2.  
4. 100
overall 80


%In this directory, you will find a derivaitve function representing a
%three gene circuit in which each gene product represses the transcription of another
%gene in a cycle. This simple three gene circuit displays oscillations and was one
%of the first synthetic circuits ever constructed (see Elowitz & Leibler
%Nature 2000). 

% 1. Start with initial conditions x(1) = 1, x(2) = x(3) = 0. 
% Run the model for 200 time units and plot the result. verify that it
% does indeed oscillate. 
figure(1);
sol1=ode23(@repressilator,[0 200],[1 0 0]);
plot(sol1.y(1,:),sol1.y(2,:),'g.-')

% 2. What happens if you start with initial conditions x(1) = x(2) = x(3) =
% 0.5? Why?
figure(2);
sol1=ode23(@repressilator,[0 200],[0.5 0.5 0.5]);
plot(sol1.y(1,:),sol1.y(2,:),'r.-')
The curve become a straight line which means in this initial conditions, these genes expression rates do not change.

% 3. The strength of the repression is governed by the constant k2 which is
% the same for all the genes. What happens when you make k2 larger or
% smaller? Find the approximate value of k2 for which the system no longer
% oscillates.

figure(3);
sol1=ode23(@repressilatorlargerk2,[0 200],[1 0 0]);
plot(sol1.y(1,:),sol1.y(2,:),'r.-')

figure(4);
sol1=ode23(@repressilatorsmallerk2,[0 200],[1 0 0]);
plot(sol1.y(1,:),sol1.y(2,:),'r.-')
When the k2 is larger,the oscillation has a lower x values which means the repression between these genes increases.
When the k2 is smaller, the oscillation has a large x values which means the repression between these genes decreases.
When the k2 is 0, the oscillation dissapears.




% 4. What happens when you make k2 larger or smaller for only one of the
% genes? 
figure(5);
sol1=ode23(@repressilatoronelargerk2,[0 200],[1 0 0]);
plot(sol1.y(1,:),sol1.y(2,:),'r.-')

figure(6);
sol1=ode23(@repressilatoronesmallerk2,[0 200],[1 0 0]);
plot(sol1.y(1,:),sol1.y(2,:),'r.-')
When one of k2 changes, the oscillation still be changed but in a more slightly way. Which means the repression rate is changed in 
a smaller degree.
