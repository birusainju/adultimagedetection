function r = dwthaar(Signal)

% Determine the length of the signal.
N = length(Signal);

% Allocate space in memory.
s = zeros(1, N/2); d = s;

% The actual transform.
for n=1:N/2
  s(n) = 1/2*(Signal(2*n-1) + Signal(2*n));
  d(n) = Signal(2*n-1) - s(n);
end

r = [s d];
