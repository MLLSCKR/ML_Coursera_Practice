function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% X -> Training set, y -> Training set labels
% Xval -> cross validation set, yval -> cross validation set labels

% Task1. Set various C and sigma values and compute prediction errors for each conditions

C_list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
predict_error = [];

for i = C_list
  for j = sigma_list
    model = svmTrain(X, y, i, @(x1, x2) gaussianKernel(x1, x2, j));
    predictions = svmPredict(model, Xval);
    
    temp_error = mean(double(predictions ~= yval));
    
    predict_error(end + 1) = temp_error;
  endfor
endfor


[least_error, least_error_idx] = min(predict_error);

C = C_list(floor((least_error_idx-1) / 8) + 1);
sigma = sigma_list(mod(least_error_idx-1, 8) + 1);

% =========================================================================

end
