% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013


function [ param, settings ] = sampler_z_single_iter(R, param, settings )
% function that implements one iteration of sampling BNPM

alpha = param.alpha;
beta = param.beta;

E_cell = param.E_cell;

NUM_M = param.N;

Z_init = param.Z;
K_init = param.K;
M_init = param.M;
A_init = param.A;

for i=1:NUM_M
	zold = Z_init(i);
	
	%Decrement the topic counters of the current edge
	K_init(E_cell{i}, zold) = K_init(E_cell{i}, zold) - 1;
	M_init(zold) = M_init(zold) - length(E_cell{i});
	A_init(zold) = A_init(zold) - 1;

	%remove empty class
	[Z_init, K_init, M_init, A_init] = remove_empty_class(Z_init, K_init, M_init, A_init);

	cluster_num = length(A_init);
	cls_num = cluster_num + settings.c_new;
	K_tmp = K_init;
	K_tmp(:, (end + settings.c_new)) = 0;
	M_tmp = M_init;
	M_tmp(end + settings.c_new) = 0;
	A_tmp = A_init;
	A_tmp(end + settings.c_new) = 0;
	
	probs = zeros(1, cls_num);
	for r=1:cls_num
		probs(r) = calc_posterior(i, r, alpha, beta, K_tmp, M_tmp, A_tmp, NUM_M, E_cell{i}, cls_num);
	end
	
	znew = sample_index(probs);
	if znew > cluster_num
		K_init(:, (end + settings.c_new)) = 0;
		M_init(end + settings.c_new) = 0;
		A_init(end + settings.c_new) = 0;
	end
	
	K_init(E_cell{i}, znew) = K_init(E_cell{i}, znew) + 1;
	M_init(znew) = M_init(znew) + length(E_cell{i});
	A_init(znew) = A_init(znew) + 1;
	Z_init(i) = znew;
	
end

param.Z = Z_init;
param.K = K_init;
param.M = M_init;
param.A = A_init;

end

