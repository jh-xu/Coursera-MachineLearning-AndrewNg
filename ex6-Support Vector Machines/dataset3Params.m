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
jval = zeros(8);
for i = 1:8
    for j = 1:8
        model= svmTrain(X, y, 3^i*0.01, @(x1, x2) gaussianKernel(x1, x2, 3^j*0.01));
        y_p = svmPredict(model, Xval);
        jval(i,j) = mean(double(y_p~=yval));
    end
end

min_jval = min(min(jval));

[nrow, ncol] = find(jval==min_jval,1);
C = 3^nrow*0.01;
sigma = 3^ncol*0.01;

% =========================================================================

end
