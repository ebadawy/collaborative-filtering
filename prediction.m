function p = prediction(NNs, R)

p = sum(NNs(:,2) .* R') / sum(abs(NNs(:,2)));

end
