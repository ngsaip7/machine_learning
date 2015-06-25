data = load('data.txt');

n = size(data,2) - 1;
m = size(data,1);

X = data(:,1:n);
y = data(:,n+1);

X = [ones(m,1) X];
initial_theta = zeros(n+1,1);

options = optimset('GradObj','on','MaxIter',400);

[theta, cost] = fminunc(@(t)(computeCostAndGradient(t,X,y)), initial_theta, options);

fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

% 15hrs sms from brother
x = [ 1 15 0 0 0 1 0 1 0 0 23 ];
z = x * theta;
probablity = sigmoid(z);
fprintf('Probablity of responding to sms from brother at 15hrs %f \n',probablity);
