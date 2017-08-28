function [ true_indices ] = myFind( mask )
%MYFIND Returns indices (going by collumn) of where elements in MASK are
%true as a vector, TRUE_INDICES.
%   First, reshape MASK into a 1x(M*N) array (aka a vector of length M*N)
%   where M and N are the number of rows and collumns in MASK
mask_size = numel(mask);
mask = reshape(mask,[1 mask_size]);
%   Then, create an array of indices of this M*N length vector
all_indices = 1:mask_size;
%   Then apply the mask to this new vector containing index values.
true_indices = all_indices(mask);
end