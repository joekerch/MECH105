function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxIter)
% Joe Kerchinsky
% MECH105: HW 9
% Due: Mon, Feb 19, 2018
% 
% falsePosition is a function that estimates a single root of a chosen 
% function using false positioning, which is a bracketing method.
%
% Inputs:
%   func = the function being evaluated
%   xL = the lower guess
%   xU = the upper guess
%   es = desired relative error (defaults to 0.0001%)
%   maxIter = desired number of iterations (defaults to 200)
% Outputs:
%   root = estimated root location (x-value)
%   fx = function value at the estimated root (y-value)
%   ea = the approximate relative error (%)
%   iter = number of iterations performed
%
% * PLEASE NOTE *
%    If the default value for maxIter OR es is desired, enter a 0
%       for that value and enter the other desired value. (5 inputs)
%    If the default value for maxIter AND es is desired, enter
%       only the first three inputs. (func, xl, xu)

if nargin < 3           % Checks for at least three inputs
    error('Must have at least three input arguements.')
elseif nargin < 4       % If three inputs are given, es and maxIter are set to default
    es = 0.0001;
    maxIter = 200;
elseif nargin == 5      % If five inputs are given
    if es == 0          % Checks if user wants es to be set to default 
        es = 0.0001;
    end
    if maxIter == 0     % Checks if user wants maxIter to be set to default
        maxIter = 200;
    end
elseif nargin > 5       % Checks for too many inputs
    error('Too many input arguments.')
end

if func(xl) * func(xu) > 0  % Tests for sign change
    error('bounds do not bracket a root.')
end

iter = 0;   % Establishing variables for loop
ea = 100;
xr = xl;
while iter < maxIter && ea > es    % While loop will stop on the basis of iter and es
    iter = iter + 1;                
    xr0 = xr;   % Establish to calculate ea
    xlVal = func(xl);
    xuVal = func(xu);
    xr = xu - ((xuVal * (xl - xu))/(xlVal - xuVal));    %Calculation for root
    xrVal = func(xr); 
    if xrVal == 0   % Calculate approx. relative error 
        ea = 0;     % If the rot is spot on, ea will equal zero
    else
        ea = (abs((xr - xr0)/xr)) * 100;
    end
    if xrVal * xlVal > 0    % Check for sign change in order to reestablish bounds
        xl = xr;
    else
        xu = xr;
    end   
end

%Printing
fx = xrVal;
root = xr;
fprintf('root = %.4f.\nfx = %.4f.\nea = %.2f %%.\niter = %d.\n', xr, fx, ea, iter)
end
