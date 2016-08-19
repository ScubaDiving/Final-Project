function [ hawkpay, dovepay, mixedpay ] = collect( pairs, pay )
%COLLECT sums up all payoffs for population type.
%   Detailed explanation goes here

if size(pairs)~=size(pay)
    errmsg('Pairs distribution and payoff matrixes mismatch');
    return
end

hawkpay = 0;
dovepay = 0;     % Initialize payoffs
mixedpay = 0;

[imax,jmax] = size(pairs);

for i=1:imax
    for j = 1:jmax
        switch pairs(i,j)
            case 1
                hawkpay = hawkpay + pay(i,j);
            case 2
                dovepay = dovepay + pay(i,j);
            case 3
                mixedpay = mixedpay + pay(i,j);
        end

    end
end
end

