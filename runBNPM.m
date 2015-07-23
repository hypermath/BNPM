% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  True matrices %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create R matrix (NxN)
% This is ALWAYS needed. It is the observed data. Should be a NxN sparse matrix.
% You may as well load it.
clc;
clear;

param.path = 'datasets/';
param.file = '108';
file = strcat(param.path, param.file);
file = strcat(file, '.tuple');

[param.N param.R] = load_data(file);

%% Load the settings
[param settings] = load_settings(param);


%% Run the INFERENCE
[param settings] = inference(param, settings);

