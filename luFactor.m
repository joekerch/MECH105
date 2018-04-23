function [L, U, P] = luFactor (A)
% Joe Kerchinsky
% MECH105 - HW15
% DUE 3/26/18
%
% luFactor is a function that performs LU Factorization on an inputed
% square matrix of coeffecients. luFactor derives matrices L, U  and P such
% that [P]*[A]=[L]*[U]
% Inputs:
% A = matrix of coeffecients
% Outputs:
% L = lower triangular matrix
% U = upper triangular matrix
% P = pivot matrix
if nargin ~= 1  % Check if correct inputs
    error('Only one input variable required')  
end 
[r, c] = size(A); 
if r ~= c   % Check if over/underdetermiend system
    error('Inputed matrix must be square') 
end 
% Define variables
P = eye(r,c);  % Function 'eye' found at: 
L = eye(r,c);  % https://www.mathworks.com/help/matlab/ref/eye.html
U = A;
% First pivot
[~, rMax1] = max(abs(A(:,1))); % Find max coeff.
if rMax1 ~= 1
    P([rMax1 1],:) = P([1 rMax1],:); % Alter pivot matrix
    U = P * U;
end
% Eliminate first variable
for i = 2:r
    L(i,1) = (U(i,1)/U(1,1)); % Find factor
    modEQ = L(i,1) * U(1,:);  % Multiply through first equation
    U(i,:) = U(i,:) - modEQ;  % Subtract from desired equation
end
% Second Pivot
for i = 1:r-1
    [~, rMax] = max(abs(U([i r],i)));
    if rMax ~= 1
        P([i rMax+1],:) = P([rMax+1 i],:);
        U([i rMax+1],:) = U([rMax+1 i],:);  % Change all three matrices when pivoting
        L([i rMax+1],i-1) = L([rMax+1 i],i-1);
    end
end
% Eliminate second variable
for i = 3:r                     % Same steps as first elimination
    L(i,2) = (U(i,2)/U(2,2));
    modEQ = L(i,2) * U(2,:);
    U(i,:) = U(i,:) - modEQ;
end
if r == 4
    % Pivot again
    [~, rMax3] = max(abs(U([3 4],3))); % Find max coeff.
    if rMax3 ~= 1
        P([3 4],:) = P([4 3],:); % Alter pivot matrix
        U([3 4],:) = U([4 3],:);  % Change all three matrices when pivoting
        L([3 4],2) = L([4 3],2);
    end
    % Eliminate third variable
    i = 4;                   % Same steps as first elimination
    L(i,3) = (U(i,3)/U(3,3));
    modEQ = L(i,3) * U(3,:);
    U(i,:) = U(i,:) - modEQ;
end
end



