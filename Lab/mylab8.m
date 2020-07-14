%%  lab08 function
% sort string by sort_mode
% fn : file name
% sort_mode : 'word' 'len' 'count'
function A = mylab8(fn,sort_mode)

% get word and count value from mylab7(fn)
[word count] = mylab7(fn);

% set struct temp
tempsize = size(word,1);
for i = 1:tempsize
    temp(i).word = word{i};
    temp(i).len = length(word{i});
    temp(i).count = count(i);
end

% sorting
if strcmp(sort_mode,'none')
    if nargout == 0
        print(temp,tempsize);
    else
        A = temp;
    end  
elseif strcmp(sort_mode,'len')
    [~,sortindex] = sort([temp.len]);
    temp = temp(sortindex);
    A = temp;
    if nargout == 0
        print(temp,tempsize);
    end
elseif strcmp(sort_mode,'count')
    [~,sortindex] = sort([temp.count]);
    temp = temp(sortindex);
    A = temp;
    if nargout == 0
        print(temp,tempsize);
    end
    elseif strcmp(sort_mode,'word')
    [a,sortindex] = sort(lower({temp.word}));
    temp = temp(sortindex);
    A = temp;
    if nargout == 0
        print(temp,tempsize);
    end
end
return;

% print string
function print(temp,tempsize)
    for i = 1:tempsize
        fprintf('%10s %2d\n',temp(i).word,temp(i).count);
    end
return;