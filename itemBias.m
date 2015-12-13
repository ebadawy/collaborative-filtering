function bi = itemBias(Iua, mu, dataSet)

bi = zeros(max(Iua),1);

for i=1:size(Iua)(1)
  item = Iua(i,2);
  Ui = dataSet(dataSet(:,2)==item,:);
  bi(item) = mean(Ui(:,3)) - mu;
end

end
