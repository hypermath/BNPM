% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013

function param = calc_energy(param)
% function that calculate the log-likelihood

alpha = param.alpha;
beta = param.beta;

NUM_M = size(param.R, 1);

K = param.K;
M = param.M;
A = param.A;

cluster_num = length(A);

% energy = P(R|Z,beta)*P(Z|alpha)
% log_energy = logPP(R|Z,beta)+logP(Z|alpha)
%

%likelihood term P(R|Z,beta)
lk = 0;
lk = lk + cluster_num * (gammaln(NUM_M * beta) - NUM_M * gammaln(beta));

lk = lk + sum(sum(gammaln(K + beta)) - gammaln(M + NUM_M * beta));

%likelihood term P(Z|alpha)
lpz = 0;
lpz = lpz + sum(gammaln(A + alpha)) + gammaln(cluster_num * alpha);
lpz = lpz - gammaln(cluster_num * alpha + NUM_M) - cluster_num * gammaln(alpha);

% lpz = lpz + sum(gammaln(A)) + gammaln(cluster_num * alpha);
% lpz = lpz - gammaln(cluster_num * alpha + NUM_M) + cluster_num * log(alpha);

param.energy = lk + lpz;

end

