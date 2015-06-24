function [jVal, gradient] = computeCostAndGradient(theta, X, y)

  m = size(X,1);

  hypothesis = X * theta;

  deviation = hypothesis - y;
  jVal = (1/(2*m))*sum(deviation .^ 2);

  gradient = (1/m) * sum((X' * deviation),2);
end
