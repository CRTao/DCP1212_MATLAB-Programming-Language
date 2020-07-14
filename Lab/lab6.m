%% get the summation of input
function r = lab6(varargin)
    r = '0';
    for ii = 1:nargin
        r =  lab6worker(r,varargin{ii});
    end
end

%% return str1 add str2
function r = lab6worker(str1,str2)
    if ~all(str1>='0' & str1<='9') || ~all(str2>='0' & str2<='9')
      error('Strings must represent integers >= 0.\n');
    end
    n = max(length(str1), length(str2)) + 1; % keep one more digit for carry
    num1 = [zeros(1,n-length(str1)) str1-'0'];
    num2 = [zeros(1,n-length(str2)) str2-'0'];

    % num1 num2 相加
    num1 = num1 + num2;

    % 計算進位
    k = find(num1 >= 10);
    while ~isempty(k)
        num1(k) = num1(k) - 10;
        num1(k-1) = num1(k-1) + 1;
        k = find(num1 >= 10);
    end
    
    num1 = num1(find(num1>0,1,'first'):end); % remove leading zeros
    r = char(num1 +'0');
end