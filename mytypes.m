function T = mytypes(dt)
  switch dt
    case 'double'
      T.x = double([]);
      T.y = double([]);
    case 'single'
      T.x = single([]);
      T.y = single([]);
    case 'fixed'
      T.x = fi([],true,16,15);
      T.y = fi([],true,16,13);
    case 'scaled'
      T.x = fi([],true,16,15,...
           'DataType','ScaledDouble');
      T.y = fi([],true,16,13,...
           'DataType','ScaledDouble');
  end
end