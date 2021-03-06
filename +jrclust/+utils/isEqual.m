function flag = isEqual(val1, val2)
    %ISEQUAL Generalized check for equality
    if isnumeric(val1)
        flag = isnumeric(val2) && ...
               ndims(val1) == ndims(val2) && ...
               all(size(val1) == size(val2)) && ...
               all(val1(:) == val2(:));
    elseif ischar(val1)
        flag = ischar(val2) && strcmp(val1, val2);
    elseif iscell(val1)
        flag = iscell(val2) && ...
               ndims(val1) == ndims(val2) && ...
               all(size(val1) == size(val2)) && ...
               all(arrayfun(@(i) jrclust.utils.isEqual(val1{i}, val2{i}), numel(val1)));
    elseif islogical(val1)
        flag = islogical(val2) && ...
               ndims(val1) == ndims(val2) && ...
               all(size(val1) == size(val2)) && ...
               all(val1(:) == val2(:));
    else % format not supported
        flag = 0;
    end
end
