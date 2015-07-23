% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013

function prob = calc_posterior(i, r, alpha, beta, K, M, A, NUM_M, E_i, cls_num)
% function that calculate the posteriors
	top = 0;
	bottom = 1.0;
	
	if A(r) == 0
		top = alpha;
	else
		top = A(r);
	end
	%bottom = (NUM_M + cls_num * alpha);
	
	top1 = K(E_i, r) + beta;
    bottom1 = M(r) + NUM_M * beta + [0:length(E_i) - 1];
	
	prob = (top * prod(top1)) / (bottom * prod(bottom1));
end

