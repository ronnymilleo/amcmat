function y = mysum(x,T) %#codegen
  y = cast(0,'like',T.y);
  for n = 1:length(x)
    y(:) = y + x(n);
  end
end