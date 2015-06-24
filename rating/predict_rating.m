data = load('2014.txt');
n = size(data,2) - 1;
m = size(data,1);

X = data(:,1:n);
y = data(:,n+1);

X = [ones(m,1) X];
initial_theta = zeros(n+1,1);

options = optimset('GradObj','on','MaxIter', 400);

[theta,cost] = fminunc(@(t)(computeCostAndGradient(t,X,y)), initial_theta, options);

fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('Theta: \n');
fprintf('%f \n', theta);

% Spy movie 120mins runtime, Action, Comedy, Crime
% actual imdb rating is 7.6
x = [ 1 120 0 0 0 1 0 0 1 0 1 0 0 0 0 0 0 ];

rating = x * theta;
fprintf('Spy: \n');
fprintf('Predicted rating is %f \n', rating);
fprintf('Actual rating is 7.6 \n\n');

% The Standford Prison Experiment 122mins runtime, Drama, Thriller
% actual movie rating is 6.7
x = [ 1 122 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ];

rating = x * theta;
fprintf('The Stanford Prison Experiment: \n');
fprintf('Predicted rating is %f \n', rating);
fprintf('Actual rating is 6.7 \n\n');

% The San Andreas 114mins runtime, Action, Drama, Thriller
% actual movie rating is 6.6
x = [ 1 122 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 ];

rating = x * theta;
fprintf('San Andreas: \n');
fprintf('Predicted rating is %f \n', rating);
fprintf('Actual rating is 6.6 \n\n');

% Insidious: Chapter 3 97mins runtime, Horror, Drama, Thriller
% actual movie rating is 6.6
x = [ 1 122 1 1 0 0 0 0 0 0 0 0 0 0 1 0 0 ];

rating = x * theta;
fprintf('Insidious 3: \n');
fprintf('Predicted rating is %f \n', rating);
fprintf('Actual rating is 6.6 \n\n');
