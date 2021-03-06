function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


% Task1. Construct Cost funciton J
hypo_x = X * theta;
error_xy = hypo_x - y;
error_sq = error_xy .^ 2;
J_1st_term = (1 / (2 * m)) * sum(sum(error_sq));

theta_sq = theta .^ 2;
theta_sum_region = theta_sq(2:end);
J_2nd_term = (lambda / (2 * m)) * sum(sum(theta_sum_region));

J = J_1st_term + J_2nd_term;

% Task2. Calculate grad at given conditions
% Regularized linear regression gradient -> should seperate to j = 0 and others
temp_Theta = theta;
temp_Theta(1) = 0;

grad = (1/m) * (X' * error_xy + lambda * temp_Theta);

% =========================================================================

grad = grad(:);

end
