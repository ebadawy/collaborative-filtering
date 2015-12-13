function bu = userBias(Utr, mu, dataSet)

bu = zeros(max(Utr),1);
for i=1:size(Utr)(1)
  u = Utr(i);
  Iu = dataSet(dataSet(:,1)==u,:);
  bu(u) = mean(Iu(:,3)) - mu;
end    

end
