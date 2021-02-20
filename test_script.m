%% Build instrumented mex
T = mytypes('fixed');

n = 10;

buildInstrumentedMex mysum ...
    -args {zeros(n,1,'like',T.x),T} -histogram

%% Test inputs
rng default
x = cast(2*rand(n,1)-1,'like',T.x);

% Algorithm
y = mysum_mex(x,T);

% Verify results

showInstrumentationResults mysum_mex ...
    -defaultDT numerictype(1,16) -proposeFL

y_expected = sum(double(x));

err = double(y) - y_expected

%% Generate C code

codegen mysum -args {x,T} -config:lib -report