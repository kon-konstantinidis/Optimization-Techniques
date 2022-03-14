% MINIMIZE CONVEX FUNCTION OF ONE VARIABLE

% Initializing the functions f1(x), f2(x), f3(x)
syms f1(x)
f1(x) = (x-2)^2 - sin(x+3);

syms f2(x)
f2(x) = exp(-5*x) + (x-2)*(cos(0.5*x)^2);

syms f3(x)
f3(x) = (x^2)*(sin(x+2)) -(x+1)^2;



% Below is the code written to produce the answers required for the paper

% Initializing starting interval [a,b]
start_a = 2;
start_b = 5;

% ITEM 1 (Dichotomy method)

% Studying the effect of const_e on the number of f(x) calls 
acc_l = 0.01;
d1CallsToE = [];
d2CallsToE = [];
d3CallsToE = [];
step = 0.0005;
for const_e = 0.001:step:(acc_l/2 - step)
    % For f1(x):
    [dich_a,dich_b,dichReps,dichCalls] = Dichotomy(f1,start_a,start_b,acc_l,const_e);
    d1CallsToE(end+1,1) = dichCalls;
    d1CallsToE(end,2) = const_e;
    % For f2(x):
    [dich_a,dich_b,dichReps,dichCalls] = Dichotomy(f2,start_a,start_b,acc_l,const_e);
    d2CallsToE(end+1,1) = dichCalls;
    d2CallsToE(end,2) = const_e;
    % For f3(x):
    [dich_a,dich_b,dichReps,dichCalls] = Dichotomy(f3,start_a,start_b,acc_l,const_e);
    d3CallsToE(end+1,1) = dichCalls;
    d3CallsToE(end,2) = const_e;
end

% Plots of (const_e,calls) for f1,f2,f3:
plot(d1CallsToE(:,2),d1CallsToE(:,1));
plot(d2CallsToE(:,2),d2CallsToE(:,1));
plot(d3CallsToE(:,2),d3CallsToE(:,1));


% Studying the effect of acc_l on the number of f(x) calls and on the
% number of partitions and final [a(k),b(k)] interval containing the solution
const_e = 0.001;
d1CallsToL = [];
d1CallsToKAB = [];
d2CallsToL = [];
d2CallsToKAB = [];
d3CallsToL = [];
d3CallsToKAB = [];
step = 0.01;
for acc_l = 0.003:step:0.1
    % For f1(x):
    [dich_a,dich_b,dichReps,dichCalls] = Dichotomy(f1,start_a,start_b,acc_l,const_e);
    d1CallsToL(end+1,1) = dichCalls;
    d1CallsToL(end,2) = acc_l;
    
    d1CallsToKAB(end+1,1) = dichReps;
    d1CallsToKAB(end,2) = dich_a(end);
    d1CallsToKAB(end,3) = dich_b(end);
    % For f2(x):
    [dich_a,dich_b,dichReps,dichCalls] = Dichotomy(f2,start_a,start_b,acc_l,const_e);
    d2CallsToL(end+1,1) = dichCalls;
    d2CallsToL(end,2) = acc_l;
    
    d2CallsToKAB(end+1,1) = dichReps;
    d2CallsToKAB(end,2) = dich_a(end);
    d2CallsToKAB(end,3) = dich_b(end);
    % For f3(x):
    [dich_a,dich_b,dichReps,dichCalls] = Dichotomy(f3,start_a,start_b,acc_l,const_e);
    d3CallsToL(end+1,1) = dichCalls;
    d3CallsToL(end,2) = acc_l;
    
    d3CallsToKAB(end+1,1) = dichReps;
    d3CallsToKAB(end,2) = dich_a(end);
    d3CallsToKAB(end,3) = dich_b(end);
end

% Plots of (acc_l,calls) for f1,f2,f3:
plot(d1CallsToL(:,2),d1CallsToL(:,1));
plot(d2CallsToL(:,2),d2CallsToL(:,1));
plot(d3CallsToL(:,2),d3CallsToL(:,1));

% Plots of (k,a(k)) and (k,b(k)) for f1:
plot(d1CallsToKAB(:,2),d1CallsToKAB(:,1));
hold on
plot(d1CallsToKAB(:,3),d1CallsToKAB(:,1));
hold off;
% Plots of (k,a(k)) and (k,b(k)) for f2:
plot(d2CallsToKAB(:,2),d2CallsToKAB(:,1));
hold on;
plot(d2CallsToKAB(:,3),d2CallsToKAB(:,1));
hold off;
% Plots of (k,a(k)) and (k,b(k)) for f3:
plot(d3CallsToKAB(:,2),d3CallsToKAB(:,1));
hold on;
plot(d3CallsToKAB(:,3),d3CallsToKAB(:,1));
hold off;


% ITEM 2 (Golden Sector method)

% Studying the effect of acc_l on the number of f(x) calls and on the
% number of partitions and final [a(k),b(k)] interval containing the solution
const_e = 0.001;
gs1CallsToL = [];
gs1CallsToKAB = [];
gs2CallsToL = [];
gs2CallsToKAB = [];
gs3CallsToL = [];
gs3CallsToKAB = [];
step = 0.01;
for acc_l = 0.003:step:0.1
    % For f1(x):
    [gs_a,gs_b,gsReps,gsCalls] = GoldenSector(f1, start_a, start_b, acc_l);
    gs1CallsToL(end+1,1) = gsCalls;
    gs1CallsToL(end,2) = acc_l;
    
    gs1CallsToKAB(end+1,1) = gsReps;
    gs1CallsToKAB(end,2) = gs_a(end);
    gs1CallsToKAB(end,3) = gs_b(end);
    % For f2(x):
    [gs_a,gs_b,gsReps,gsCalls] = GoldenSector(f2, start_a, start_b, acc_l);
    gs2CallsToL(end+1,1) = gsCalls;
    gs2CallsToL(end,2) = acc_l;
    
    gs2CallsToKAB(end+1,1) = gsReps;
    gs2CallsToKAB(end,2) = gs_a(end);
    gs2CallsToKAB(end,3) = gs_b(end);
    % For f3(x):
    [gs_a,gs_b,gsReps,gsCalls] = GoldenSector(f3, start_a, start_b, acc_l);
    gs3CallsToL(end+1,1) = gsCalls;
    gs3CallsToL(end,2) = acc_l;
    
    gs3CallsToKAB(end+1,1) = gsReps;
    gs3CallsToKAB(end,2) = gs_a(end);
    gs3CallsToKAB(end,3) = gs_b(end);
end

% Plots of (acc_l,reps) for f1,f2,f3:
plot(gs1CallsToL(:,2),gs1CallsToL(:,1));
plot(gs2CallsToL(:,2),gs2CallsToL(:,1));
plot(gs3CallsToL(:,2),gs3CallsToL(:,1));

% Plots of (k,a(k)) and (k,b(k)) for f1:
plot(gs1CallsToKAB(:,2),gs1CallsToKAB(:,1));
hold on;
plot(gs1CallsToKAB(:,3),gs1CallsToKAB(:,1));
hold off;
% Plots of (k,a(k)) and (k,b(k)) for f2:
plot(gs2CallsToKAB(:,2),gs2CallsToKAB(:,1));
hold on;
plot(gs2CallsToKAB(:,3),gs2CallsToKAB(:,1));
hold off;
% Plots of (k,a(k)) and (k,b(k)) for f3:
plot(gs3CallsToKAB(:,2),gs3CallsToKAB(:,1));
hold on;
plot(gs3CallsToKAB(:,3),gs3CallsToKAB(:,1));
hold off;



% ITEM 3 (Fibonacci method)

% Studying the effect of acc_l on the number of f(x) calls and on the
% number of partitions and final [a(k),b(k)] interval containing the solution
const_e = 0.001;
fib1CallsToL = [];
fib1CallsToKAB = [];
fib2CallsToL = [];
fib2CallsToKAB = [];
fib3CallsToL = [];
fib3CallsToKAB = [];
step = 0.01;
for acc_l = 0.003:step:0.1
    % For f1(x):
    [fib_a,fib_b,fibReps,fibCalls] = Fibonacci(f1, start_a,start_b,acc_l);
    fib1CallsToL(end+1,1) = fibCalls;
    fib1CallsToL(end,2) = acc_l;
    
    fib1CallsToKAB(end+1,1) = fibReps;
    fib1CallsToKAB(end,2) = fib_a(end);
    fib1CallsToKAB(end,3) = fib_b(end);
    % For f2(x):
    [fib_a,fib_b,fibReps,fibCalls] = Fibonacci(f2, start_a,start_b,acc_l);
    fib2CallsToL(end+1,1) = fibCalls;
    fib2CallsToL(end,2) = acc_l;
    
    fib2CallsToKAB(end+1,1) = fibReps;
    fib2CallsToKAB(end,2) = fib_a(end);
    fib2CallsToKAB(end,3) = fib_b(end);
    % For f3(x):
    [fib_a,fib_b,fibReps,fibCalls] = Fibonacci(f3, start_a,start_b,acc_l);
    fib3CallsToL(end+1,1) = fibCalls;
    fib3CallsToL(end,2) = acc_l;
    
    fib3CallsToKAB(end+1,1) = fibReps;
    fib3CallsToKAB(end,2) = fib_a(end);
    fib3CallsToKAB(end,3) = fib_b(end);
end

% Plots of (acc_l,calls) for f1,f2,f3:
plot(fib1CallsToL(:,2),fib1CallsToL(:,1));
plot(fib2CallsToL(:,2),fib2CallsToL(:,1));
plot(fib3CallsToL(:,2),fib3CallsToL(:,1));

% Plots of (k,a(k)) and (k,b(k)) for f1:
plot(fib1CallsToKAB(:,2),fib1CallsToKAB(:,1));
hold on;
plot(fib1CallsToKAB(:,3),fib1CallsToKAB(:,1));
hold off;
% Plots of (k,a(k)) and (k,b(k)) for f2:
plot(fib2CallsToKAB(:,2),fib2CallsToKAB(:,1));
hold on;
plot(fib2CallsToKAB(:,3),fib2CallsToKAB(:,1));
hold off;
% Plots of (k,a(k)) and (k,b(k)) for f3:
plot(fib3CallsToKAB(:,2),fib3CallsToKAB(:,1));
hold on;
plot(fib3CallsToKAB(:,3),fib3CallsToKAB(:,1));
hold off;


% ITEM 4 (Dichotomy with derivative method)

% Studying the effect of acc_l on the number of f(x) calls and on the
% number of partitions and final [a(k),b(k)] interval containing the solution
const_e = 0.001;
dd1CallsToL = [];
dd1CallsToKAB = [];
dd2CallsToL = [];
dd2CallsToKAB = [];
dd3CallsToL = [];
dd3CallsToKAB = [];
step = 0.01;
for acc_l = 0.003:step:0.1
    % For f1(x):
    [dd_a,dd_b,ddReps,ddCalls] = DerivativeDichotomy (f1, start_a, start_b, acc_l);
    dd1CallsToL(end+1,1) = ddCalls;
    dd1CallsToL(end,2) = acc_l;
    
    dd1CallsToKAB(end+1,1) = ddReps;
    dd1CallsToKAB(end,2) = dd_a(end);
    dd1CallsToKAB(end,3) = dd_b(end);
    % For f2(x):
    [dd_a,dd_b,ddReps,ddCalls] = DerivativeDichotomy (f2, start_a, start_b, acc_l);
    dd2CallsToL(end+1,1) = ddCalls;
    dd2CallsToL(end,2) = acc_l;
    
    dd2CallsToKAB(end+1,1) = ddReps;
    dd2CallsToKAB(end,2) = dd_a(end);
    dd2CallsToKAB(end,3) = dd_b(end);
    % For f3(x):
    [dd_a,dd_b,ddReps,ddCalls] = DerivativeDichotomy (f3, start_a, start_b, acc_l);
    dd3CallsToL(end+1,1) = ddCalls;
    dd3CallsToL(end,2) = acc_l;
    
    dd3CallsToKAB(end+1,1) = ddReps;
    dd3CallsToKAB(end,2) = dd_a(end);
    dd3CallsToKAB(end,3) = dd_b(end);
end

% Plots of (acc_l,calls) for f1,f2,f3:
plot(dd1CallsToL(:,2),dd1CallsToL(:,1));
plot(dd2CallsToL(:,2),dd2CallsToL(:,1));
plot(dd3CallsToL(:,2),dd3CallsToL(:,1));

% Plots of (k,a(k)) and (k,b(k)) for f1:
plot(dd1CallsToKAB(:,2),dd1CallsToKAB(:,1));
hold on;
plot(dd1CallsToKAB(:,3),dd1CallsToKAB(:,1));
hold off;
% Plots of (k,a(k)) and (k,b(k)) for f2:
plot(dd2CallsToKAB(:,2),dd2CallsToKAB(:,1));
hold on;
plot(dd2CallsToKAB(:,3),dd2CallsToKAB(:,1));
hold off;
% Plots of (k,a(k)) and (k,b(k)) for f3:
plot(dd3CallsToKAB(:,2),dd3CallsToKAB(:,1));
hold on;
plot(dd3CallsToKAB(:,3),dd3CallsToKAB(:,1));
hold off;

% end Minimize