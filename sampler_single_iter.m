% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013


function [ param, settings ] = sampler_single_iter(R, param, settings )
% function that implements one iteration of the MCMC sampler

% Given alpha and beta, sample posterior Zs
[ param, settings ] = sampler_z_single_iter(R, param, settings);

% Given Zs, Sample alpha
param = slice_sampler_alpha_iter(param);


% Given Zs, Sample beta
param = slice_sampler_beta_iter(param);

% Calculate energy
param = calc_energy(param);

end

