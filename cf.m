dataSet = load('u_test.data');

% add extra col to store bias of each user-item row
dataSet = [dataSet zeros(length(dataSet),1)];

% some constants
ua = 3; ia = 4; NNs_size = 3;

[val_Utr idx_Utr] = unique(dataSet(:,1));
Utr = dataSet(idx_Utr,:);
Iua = dataSet(dataSet(:,1) == ua, :);

mu = mean(dataSet(:,3));
bu = userBias(Utr, mu, dataSet);
bi = itemBias(Iua, mu, dataSet);

for i=1:length(Utr)
  for j=1:size(Iua)(1)
    u = Utr(i);
    item = Iua(j,2);
    dataSet(dataSet(:,1) == u & dataSet(:,2) == item, 4) = mu + bu(u) + bi(item);
  end
end

sim_ia = sim(ia, Utr, Iua, dataSet);

[val idx] = sort(sim_ia(:,2), 'descend');
NNs = sim_ia(idx,:);

if size(sim_ia)(1) > NNs_size
  NNs = NNs(1:NNs_size,:);
end

for i=1:size(NNs)(1)
  R(i) = dataSet(dataSet(:,1) == ua & dataSet(:,2) == NNs(i,1),3);
end

p = prediction(NNs(:,2), R)
