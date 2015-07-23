% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013

function [param settings] = inference(param, settings)
% function that runs the inference process.
% input:    param - structure that contains the set of parameters
%           settings - structure that contains the experimental settings

%start the timer
%tic

% check the settings are correctly set
[param settings] = check_settings(param, settings);

% initialise the model; initialise the structures
[param settings] = initModel(param, settings);

Energy = -Inf;

%% Start the actual sampler
for i = 1:settings.iterations
    % fprintf('iteration: %d\n', i);

    [ param, settings] = sampler_single_iter( param.R, param, settings );

%	if i > 100
		if Energy < param.energy

			Energy = param.energy;
			fprintf('%10f\n',Energy);
			
          	output_file(param);
%           	param.alpha
%           	param.beta
          	length(unique(param.Z))
            param.Z
          	prob = calculateNMI(param);
          	prob
			
		end
%	end

end

%toc
end