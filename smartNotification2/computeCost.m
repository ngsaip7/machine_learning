function [J,grad] = computeCost(initial_theta, X, y)

  z = X * initial_theta;
  hypothesis = sigmoid(z);

  m = size(X,1);
  J = -(1/m) * sum( y .* log(hypothesis) + ( 1 - y ) .* log(1 - hypothesis));

  deviations = hypothesis - y;
  grad = (1/m) * (sum( X' * deviations,2));
end
