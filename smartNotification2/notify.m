data = load('data.txt');

m = size(data,1);
n = size(data,2) - 1;

X = data(:,1:n);
y = data(:,n + 1);

X = [ ones(m,1) X ];
num_labels = 3;
all_theta = zeros(num_labels, n+1);

for i = 1:num_labels
  initial_theta = zeros(n+1,1);
  options = optimset('GradObj', 'on', 'MaxIter', 50);
  theta = fmincg(@(t)(computeCost(t, X, ( y == i ))), initial_theta, options);

  all_theta(i,:) = theta';
end

%06hrs sms from FriendA
x = [ 1 6 0 0 0 1 0 0 1 123 ];

p = predict(x, all_theta);
fprintf('\n SMS from a friend at 6hrs %i\n',p);

%07hrs call from Dad
x = [ 1 7 0 0 1 0 1 0 0 0 ];

fprintf('\n Call from Dad at 7hrs %i\n', predict(x, all_theta));

%08hrs whats app from Brother
x = [ 1 8 1 0 0 0 0 1 0 20 ];

fprintf('\n WhatsApp msg from Brother at 8hrs %i\n', predict(x, all_theta));

event = predict(X, all_theta);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(event == y)) * 100);
