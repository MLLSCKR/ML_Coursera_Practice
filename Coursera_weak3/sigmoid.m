function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

minus_z = -1 * z;
exp_z = exp(minus_z);
denominator = 1 + exp_z;
g = 1 ./ denominator;

% =============================================================

end
