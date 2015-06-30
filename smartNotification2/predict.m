function p = predict(x, all_theta)
  predictions = x * all_theta';
  [q,p] = max(predictions, [], 2);
end
