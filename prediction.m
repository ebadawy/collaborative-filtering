function p = prediction(NNs, R)

p = sum(NNs .* R') / sum(abs(NNs));

end
