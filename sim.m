function sim = sim(ia, Utr, Iua, dataSet)

sim = zeros(size(Iua)(1),2);

for i=1:size(Iua)(1)
  item = Iua(i,2);
  dataSet_dash = zeros(1,4);
  for j=1:length(Utr)
    u = Utr(j);
    tmp = (dataSet(dataSet(:,1)==u,:));
    if size(tmp(tmp(:,2)==ia,:)) > 0 && size(tmp(tmp(:,2)==item,:)) > 0
      dataSet_dash = [dataSet_dash ; tmp];
    end
  end
  
  if size(dataSet_dash)(1) == 1
    continue
  end

  Ru_ia = dataSet(dataSet(:,2)==ia,:)(:,3);
  Ru_ia_dash = dataSet_dash(dataSet_dash(:,2)==ia,:)(:,3);

  bu_ia = dataSet(dataSet(:,2)==ia,:)(:,4);
  bu_ia_dash = dataSet_dash(dataSet_dash(:,2)==ia,:)(:,4);

  Ru_i = dataSet(dataSet(:,2)==item,:)(:,3);
  Ru_i_dash = dataSet_dash(dataSet_dash(:,2)==item,:)(:,3);
  
  bu_i = dataSet(dataSet(:,2)==item,:)(:,4);
  bu_i_dash = dataSet_dash(dataSet_dash(:,2)==item,:)(:,4);
  
  %num =  sum((Ru_ia_dash - bu_ia_dash).*(Ru_i_dash - bu_i_dash));
  num =  sum((Ru_ia_dash).*(Ru_i_dash));
  %den = sqrt(sum((Ru_ia-bu_ia).^2)*sum((Ru_i-bu_i).^2));
  den = sqrt(sum((Ru_ia).^2)*sum((Ru_i).^2));
  sim(i,:) = [item (num/den)];
end

end
