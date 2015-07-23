% John Chen <chenyi@hitsz.edu.cn>
% Shenzhen Graduate School, Harbin Institute of Technology
% Created: November 2013
% Modified: November 2013


function znew = sample_index(probs)
% function that samples
	
sumprobs = sum(probs);
probs = probs ./ sumprobs;
irand = rand;
cumprobs = cumsum(probs);

znew = 1+ sum(irand > cumprobs);

end

