function [a,b,reps,calls] = GoldenSector (f, start_a, start_b, acc_l)
a(1) = start_a;
b(1) = start_b;
reps = 0;
calls = 0;
k = 1;
gamma = 0.618;
x1 = [];
x2 = [];
fx1 = [];
fx2 = [];
x1(k) = a(k) + (1 - gamma)*(b(k) - a(k));
x2(k) = a(k) + gamma*(b(k) - a(k));
fx1(k) = f(x1(k));
fx2(k) = f(x2(k));
calls = 2;

while ( b(k) - a(k) > acc_l)
    
    if ( fx1(k) > fx2(k) )
        a(k+1) = x1(k);
        b(k+1) = b(k);
        
        x1(k+1) = x2(k);
        fx1(k+1) = fx2(k);
        
        x2(k+1) = a(k+1) + gamma*(b(k+1) - a(k+1));
        fx2(k+1) = f(x2(k+1));
        
    elseif ( fx1(k) <= fx2(k) )
        a(k+1) = a(k);
        b(k+1) = x2(k);
        
        x1(k+1) = a(k+1) + (1 - gamma)*(b(k+1) - a(k+1));
        fx1(k+1) = f(x1(k+1));
        
        x2(k+1) = x1(k);
        fx2(k+1) = fx1(k);
    end
    k = k + 1;    
    calls = calls + 1;
end
reps = k - 1;
end % end GoldenSector function