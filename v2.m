%% Hawk Dove Game Simulation
% Numerical Analysis Final Project
% Written by Amir Melnikov (c)
% Version 2.0

%% System Initialization
clear all
close all
clc
tic
%% Simulation Constants
n=100;                                               % Population size
x1=0.25;                                            % Hawk Precetange
x2=0.25;                                            % Dove Precentage
y=0.5;                                              % Mixed Precentage

% Payoffs
a=0;
b=3;
c=1;
d=2;

p = (((n-1)./(n-2)).*b-d-(1./(n-2)).*c)./(b-d+c-a); % Hawk Equ. Precantage

% Population initialization
population = zeros(1,n);
pairs = zeros(2,n/2);
lasty = rand(1,10);
yind = 1;
counter = 0;
%% Simulation

while std(lasty)>1e-5

    for i=1:n

            if i<=n*x1
                population(i) = 1;  % Hawks

            elseif i <= n*(x1+x2)
                population(i) = 2;  % Doves
            else                      
                population(i) = 3;  % Mixed
            end
    end

    population = population(randperm(n));               % Shuffle population
    pairs(1,1:end) = population(1:n/2);                 % Divide into pairs
    pairs(2,1:end) = population(n/2+1:end);

    pay = fightv2(pairs,p);                             % Calculate Payoff per individual

    [ hawkpay, dovepay, mixedpay ] = collect(pairs,pay);% Calculate Payoff per strategy
    totalpay = hawkpay + dovepay + mixedpay;            % Total Payoff of population
    
    meanpay = hawkpay * x1 + dovepay * x2 + mixedpay * y
    % Revaluate population - next generation
    x1 = x1 * hawkpay/meanpay;
    x2 = x2 * dovepay/meanpay;
    y  = y * mixedpay/meanpay;
    
    if yind ~=length(lasty)                             % y index for lasty
        lasty(yind) = y;                                % lasty holds a few of last y values
        yind=yind + 1;
    else
        lasty(yind) = y;
        yind = 1;
    end
    counter = counter +1
end

toc