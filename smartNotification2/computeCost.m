function [J,grad] = computeCost(initial_theta, X, y, lambda)

  z = X * initial_theta;
  hypothesis = sigmoid(z);

  m = size(X,1);
  J = -(1/m) * sum( y .* log(hypothesis) + ( 1 - y ) .* log(1 - hypothesis)) + (lambda/(2*m)) * sum(initial_theta(2:end));

  deviations = hypothesis - y;
  grad = (1/m) * (sum( X' * deviations)) + lambda * initial_theta;
  grad(1,:) = (1/m) * (sum(X' * deviations));
end
