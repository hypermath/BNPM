% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013

function [param settings]= load_settings(param)
% function that load settings.
% input:    file - structure that contains the set of parameters

% Alpha parameter for Dirichlet Process(\alpha)
param.alpha = 0.5; 
% param.alpha = gamrnd(1, 1);
% Beta parameter for Dirichlet prior 
param.beta = 0.5; 
% param.beta = gamrnd(1, 1);


%% Experimental Settings
% number of iterations
settings.iterations = 10000;
% number of initial clusters
% initialisation c_ini can be 1 10 100 1000 ...
settings.c_ini = 10;
% number of for a new clusters.
settings.c_new = 1;


end

