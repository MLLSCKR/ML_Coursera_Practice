function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


z = X * theta;
hypo_t = sigmoid(z);
cost_vec = -1 * y .* log(hypo_t) - (1 - y) .* log(1 - hypo_t);

theta_sq = theta .^ 2;

J = (1 / m) * sum(cost_vec) + (lambda / (2 * m)) * sum(theta_sq(2 : length(theta_sq) , 1));


theta_temp = [zeros(1, 1) theta'(:, 2:length(theta))];
temp_vec = X.*(hypo_t - y);
grad = 1/m * sum(temp_vec) + lambda / m * theta_temp;


% =============================================================

end
