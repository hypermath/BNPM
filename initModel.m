% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013

function [param settings] = initModel(param, settings)
% function that initializes the Markov Chain State


%%%%%%%%%%%%%%%%%%%%%%%%%%% Initialize Markov Chain State %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cluster_num = settings.c_ini;

N = param.N;
[I J S] = find(param.R);
NUM_E = length(I);

% nodes' neighbors
E_cell = cell(1, N);
% Z
Z_init = zeros(1, N);
% mk,j
K_init = zeros(N, cluster_num);
% mk
M_init = zeros(1, cluster_num);
% nk
A_init = zeros(1, cluster_num);

for i=1:N
    [tmpv E_cell{i}] = find(param.R(i, :));
end

% initialize
for i=1:N
	probs = zeros(1, cluster_num);
	for j=1:cluster_num
		probs(j) = 1.0 / cluster_num;
	end
	
	znew = sample_index(probs);
	Z_init(i) = znew;
	K_init(E_cell{i}, znew) = K_init(E_cell{i}, znew) + 1;
	M_init(znew) = M_init(znew) + length(E_cell{i});
	A_init(znew) = A_init(znew) + 1;
end

param.E_cell = E_cell;
param.Z = Z_init;
param.K = K_init;
param.M = M_init;
param.A = A_init;

end
