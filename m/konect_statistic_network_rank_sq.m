%
% Compute the squared network rank.
%
% PARAMETERS 
%	a	Adjacency or biadjacency matrix
%	format
%	weights
%
% RESULT 
%	value
%

function value = konect_statistic_network_rank_sq(a, format, weights)

opts.disp = 2; 

consts = konect_consts(); 

% norm() does not accept logical matrices
if islogical(a)
    a = double(a); 
end

% Factor of 2 because we alwas double the effective number of edges
% later on-- either by taking the SVD, or by symmetrization. 
nf = 2 * norm(a, 'fro')^2;

if format == consts.BIP
    d = svds(a, 1, 'L', opts);
else
    d = eigs(a + a', 1, 'lm', opts);
end


value = nf / (d^2); 
