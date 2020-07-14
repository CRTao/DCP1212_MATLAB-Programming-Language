%% get the amount of words
function [r , c] = mylab7(in)
    fid = fopen(in,'r');
    A = textscan(fid, '%s' ,'delimiter','., ');
    A=A{1};
    
    num_str=size(A,1);
    
    r = A(1);
    c = 1;
    %% update new word or amount
    for ii = 2:num_str
        index = find(strcmpi(r,A(ii))==1);
        if (~isempty(index))
            c(index) = c(index) + 1;
        else
            r = [r;A(ii)];
            c = [c;1];
        end
    end
    
%% if nargout == 0, print r and c
    if(nargout == 0)
        for ii = 1:size(r,1)            
         fprintf('%-30s\t%d\r',r{ii},c(ii));
        end
    end
        
return ;