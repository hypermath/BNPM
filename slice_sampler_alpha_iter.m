% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013


function [ param ] = slice_sampler_alpha_iter(param)
%p(alpha | z) prop_to p(z|alpha)*p(alpha)
%p(alpha)=exp(-alpha) --> log_prior=-alpha

alpha = param.alpha;

A = param.A;
NUM_M = param.N;
num = length(A);

f = @(a) sum(gammaln(A + a)) + gammaln(num * a) - num * gammaln(a) - gammaln(num * a + NUM_M);

h = @(x) f(exp(x)) + x - exp(x);

% limit alpha from 0 to 1
t = slicesample(log(alpha), 10, 'logpdf', h, 'thin', 1, 'burnin', 0);
while isempty(find(t < 0))
    t = slicesample(log(alpha), 10, 'logpdf', h, 'thin', 1, 'burnin', 0);
end

pos = find(t < 0, 1, 'first');
param.alpha = exp(t(pos));

% t = slicesample(log(alpha), 1, 'logpdf', h, 'thin', 1, 'burnin', 0);
% param.alpha = exp(t);

end

