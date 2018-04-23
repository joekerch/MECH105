function I = Simpson(x,y)
% Joe Kerchinsky
% MECH105 - HW21
% DUE 4/9/18
%
% Simpson is a function that uses the Composite Simpson's 1/3 Rule to
% integrate specific inputed values. If the number of inputed values is
% even, meaning the number of segments is odd, the last segment will be
% intgrated using the Trapezoid rule.
%
% Inputs:
% x = row vector of independant variables
% y = row vector of dependant variables
% Outputs:
% I = Total integral

% Define variables
lengthX = length(x);    % Determine number of points
lengthY = length(y);
spaceX = diff(x);       % Determine the spacing of the intervals
n = lengthX;            % Define number of points
TrapInt = 0;            % Define trapezoid sum
SimpsonInt = 0;         % Define simpson sun

% Error Checking
if ~all(spaceX == spaceX(1))        % Check for equal interval spacing
    error('x values are not equally spaced')
end
if lengthX ~= lengthY               % Check that inputs are of equal length
    error('Inputs must be the same length')
end
if lengthX < 2                      % If input less than 2, no trap or simpson
    error('Not enough input values')
end

% Check for and complete trapezoid rule 
if mod(n,2) == 0                    % Check if odd amount of segments
    warning('Trapezoid rule will be used to integrate the last segment')
    h = spaceX(1);                  % Spacing for trapezoid (b-a)
    TrapInt = h.*((y(n)+y(n-1))/2); % Calculate trap area
    n=n-1;                          % Redefine number of points for simpson
end

% Composite Simpson's Rule
h2 = x(n) - x(1);                   % Spacing for simpson's (b-a)
for i = 2:2:n-1                     % Sum the points weighed 4x
    SimpsonInt = SimpsonInt + 4*y(i);
end
for k=3:2:n-2                       % Sum the points weighed 2x              
    SimpsonInt = SimpsonInt + 2*y(k);
end
SimpsonInt = SimpsonInt + y(1) + y(n);   % Add the endpoints
SimpsonInt = h2*(SimpsonInt/(3*(n-1)));  % Divide by 3n and multiply by (b-a)

% If two points given, only trapezoid rule can be applied
if lengthX == 2                          
    SimpsonInt = 0;
end

% Add the integrals
I = SimpsonInt + TrapInt;      

% "Works cited"
% all(A) function found at: https://www.mathworks.com/help/matlab/ref/all.html
% mod(a,m) function found at: https://www.mathworks.com/help/matlab/ref/mod.html
