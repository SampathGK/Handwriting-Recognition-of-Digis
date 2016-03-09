function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
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
minError = 999999 ;
val = [ 0.01 , 0.03, 0.1, 0.3, 1, 3, 10, 30 ] ;
for i = 1:8         %8 values for C
    for j = 1:8     %8 values for sigma
        % from here val(i) is C , val(j) is sigma
        % Generate a model on training set using current value of C and sigma
        [model] = svmTrain(X, y, val(i), @(x1,x2)gaussianKernel(x1,x2,val(j))) ;
        % use this model to predict for cross-validation set
        [predictions] = svmPredict(model,Xval);
        % Computing mean error 
        curError = mean(double(predictions ~= yval)) ;
        if ( minError > curError )
            minError = curError ;
            C = val(i) ;
            sigma = val(j) ;
        end 
    end
end


% =========================================================================

end
