function [jVal,gradient] = computeCostAndGradient(theta,X,y)

  m = size(X,1);

  z = X * theta;
  hypothesis = sigmoid(z);

  jVal = -(1/m) * sum(y .* log(hypothesis) + ( 1 - y ) .* log(1 - hypothesis));

  deviation = hypothesis - y;
  gradient = (1/m)*sum((X' * deviation), 2);
end
