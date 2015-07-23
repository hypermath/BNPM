% John Chen <chenyi@hitsz.edu.cn>
% Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013

function [param, settings] = check_settings(param, settings)
% function that checks that the settings provided by the user are correct.


if size(param.R,1)==0
     err = MException('Initialisation:MtxNotProvided', ...
        'the link matrix R is not provided. Please start again.');
    throw(err)
elseif size(param.R,1) ~=size(param.R,2)
     err = MException('Initialisation:MtxNotProvided', ...
        'the link matrix R is not square. Please choose again.');
    throw(err)
end



end

