function [ pay ] = fightv2( pairs,p )
%fightv2 calculates hawk-dove game payoff
%   Detailed explanation goes here

a=0;
b=3;
c=1;
d=2;

pay = char(zeros(size(pairs)));

r = rand;
[imax,jmax] = size(pairs);
for i=1:imax
    for j = 1:jmax
        if pairs(i,j)==3
            switch r;
                    case r < p 
                        pairs(i,j) = 1;
                    otherwise
                        pairs(i,j) = 2;
            end
        end

    end
end
for j = 1:jmax
    if pairs(1,j)==1 && pairs(2,j)==1   % Hawk Hawk
        pay(:,j) = 'a';
    end
    if pairs(1,j)==1 && pairs(2,j)==2   % Hawk Dove
        pay(1,j) = 'b';
        pay(2,j) = 'c';
    end
    if pairs(1,j)==2 && pairs(2,j)==1   % Dove Hawk
        pay(1,j) = 'c';
        pay(2,j) = 'b';
    end
    if pairs(1,j)==2 && pairs(2,j)==2   % Dove Dove
        pay(:,j) = 'd';
    end
end
end