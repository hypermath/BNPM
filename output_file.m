% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013

function output_file( param )
% function that outputs the group partitions

    Z = param.Z;
	N = param.N;
    [N K] = size(param.K);
    
    file = strcat(param.path, 'BNPM-');
    file = strcat(file, param.file);
    file = strcat(file, '.txt');
    
    fid = fopen(file, 'w');
    
	for i=1:N
		fprintf(fid, '%d ', Z(i));
	end
    
    fclose(fid);
end

