data = load('data.txt');

m = size(data,1);
n = size(data,2) - 1;

X = data(:,1:n);
y = data(:,n + 1);

X = [ ones(m,1) X ];
initial_theta = zeros(n+1,1);
lambda = 0.1;
all_theta = zeros(n, n+1);

for i = 1:n
  options = optimset('GradObj', 'on', 'MaxIter', 50);
  theta = fmincg(@(t)(computeCost(t, X, ( y == i ), lambda)), initial_theta, options);

  all_theta(i,:) = theta';
end

% 15hrs sms from FriendA
x = [ 1 5 0 0 0 1 0 0 1 0 23 ];

event = predict(x, all_theta);

fprintf('Response: %i\n',event);
