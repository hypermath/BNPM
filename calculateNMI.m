% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013

function prob = calculateNMI( param )
% function that calculate nmi

	file = strcat(param.path, param.file);
    file = strcat(file, '.txt');

    M = dlmread(file);
    prob = nmi(param.Z, M);

end