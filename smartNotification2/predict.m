function p = predict(x, all_theta)
  predictions = x * all_theta';
  predictions = sigmoid(predictions);
  [q,p] = max(predictions, [], 2);
end
