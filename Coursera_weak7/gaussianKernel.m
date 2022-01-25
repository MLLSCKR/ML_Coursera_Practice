function sim = gaussianKernel(x1, x2, sigma)
%RBFKERNEL returns a radial basis function kernel between x1 and x2
%   sim = gaussianKernel(x1, x2) returns a gaussian kernel between x1 and x2
%   and returns the value in sim

% Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

% You need to return the following variables correctly.
sim = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the similarity between x1
%               and x2 computed using a Gaussian kernel with bandwidth
%               sigma
%
%

len_x = length(x1);
dist_sq = 0;

% task1. evaluate distance's square between x1 and x2
for i = 1:len_x
  temp = x1(i) - x2(i);
  dist_sq = dist_sq + temp^2;
endfor

% task2. evaluate exponential equation by using dist_sq
sim = exp((-1) * dist_sq  / (2 * sigma^2));

% =============================================================
    
end
