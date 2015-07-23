% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013


function [ param ] = slice_sampler_beta_iter(param)
%p(beta | A) prop_to p(A|beta)*p(beta)

beta = param.beta;

A = param.A;
K = param.K;
M = param.M;
NUM_M = param.N;
num = length(A);

f = @(b) num * (gammaln(NUM_M * b) - NUM_M * gammaln(b)) + sum(sum(gammaln(K + b))) - sum(gammaln(M + NUM_M * b));

h = @(x) f(exp(x)) + x - exp(x);

% limit beta from 0 to 1
t = slicesample(log(beta), 10, 'logpdf', h, 'thin', 1, 'burnin', 0);
while isempty(find(t < 0))
    t = slicesample(log(beta), 10, 'logpdf', h, 'thin', 1, 'burnin', 0);
end

pos = find(t < 0, 1, 'first');
param.beta = exp(t(pos));

% t = slicesample(log(beta), 1, 'logpdf', h, 'thin', 1, 'burnin', 0);
% param.beta = exp(t);

end

