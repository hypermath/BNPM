% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013

function [ N R ] = load_data( file )
% function that load network.
% input:    file - full file name

	
	M = dlmread(file);
	N = M(1, 1);

	R = sparse(M(2:size(M, 1), 1), M(2:size(M, 1), 2), ones(size(M, 1)-1, 1), N, N);
end

