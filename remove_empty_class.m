% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013


function [Z, K, M, A] = remove_empty_class(Z, K, M, A)
% function that removes empty groups

cluster_num = length(A);

K_arr = zeros(1, cluster_num);
label = 1;
tmp_NULL = [];


for i=1:cluster_num
	if A(i) == 0
		tmp_NULL = [tmp_NULL i];
	else
		K_arr(i) = label;
		label = label + 1;
	end
end

A(tmp_NULL) = [];
M(tmp_NULL) = [];
K(:, tmp_NULL) = [];


Z = K_arr(Z);

end

