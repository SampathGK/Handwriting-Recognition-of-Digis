function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
m = size(X,1) ;                                                 %Training set size
count = zeros(K,1) ;                                            %Count Represents the no of examples assigned to 
                                                                %   each of the centroid 
centroids = zeros(K,size(X,2)) ;                                %Matrix for centroids initialized

for i = 1:m
    count(idx(i)) += 1 ;
    centroids(idx(i),:) = centroids(idx(i),:) .+ X(i,:) ;           %adding the examples assigned to a centroid
                                                                %   Later we will divide by the count to get Mean 
end

centroids = centroids ./ count ;                                %divide by the count to get the mean


% =============================================================


end

