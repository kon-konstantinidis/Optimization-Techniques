function [a,b,reps,calls] = DerivativeDichotomy (f, start_a, start_b, acc_l)
a(1) = start_a;
b(1) = start_b;
k = 1;
reps = 0;
calls = 0;
x = [];
df = diff(f);

while ( b(k) - a(k) > acc_l)
    
    x(k) = ( a(k) + b(k) ) / 2;
    derVal = df(x(k));
    
    if ( derVal == 0 )
        a(k) = x(k);
        b(k) = x(k);
        
    elseif ( derVal > 0 )
        a(k+1) = a(k);
        b(k+1) = x(k);
        
    elseif ( derVal < 0 )
        a(k+1) = x(k);
        b(k+1) = b(k);
    end
    calls = calls + 1;
    k = k+1;
end
reps = k - 1;
end % end DerivativeDichotomy function