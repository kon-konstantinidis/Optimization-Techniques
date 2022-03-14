function [a,b,reps,calls] = Fibonacci(f, start_a,start_b,acc_l)
a(1) = start_a;
b(1) = start_b;
reps = 0;
calls = 0;

F = [];
F(1) = 1;
F(2) = 1;
n = 2;

% Computing as much of the Fibonacci series is needed
while ( F(n) <= (b(1) - a(1)) / acc_l )
    F(n+1) = F(n) + F(n-1);
    n = n+1;
end

k = 1;
x1 = [];
x2 = [];
x1(k) = a(k) + ( F(n-k-1)/F(n-k+1) )*( b(k) - a(k) );
x2(k) = a(k) + ( F(n-k)/ F(n-k+1) )*( b(k) - a(k) );
fx1 = [];
fx2 = [];
fx1(k) = f(x1(k));
fx2(k) = f(x2(k));


while ( k < n - 2 )

    if ( fx1(k) > fx2(k) )
        a(k+1) = x1(k);
        b(k+1) = b(k);
        
        x1(k+1) = x2(k);
        fx1(k+1) = fx2(k);
        
        x2(k+1) = a(k+1) + ( F(n-k-1)/ F(n-k) )*( b(k+1) - a(k+1) );
        fx2(k+1) = f(x2(k+1));
        
    elseif ( fx1(k) < fx2(k) )
        a(k+1) = a(k);
        b(k+1) = x2(k);
    
        x1(k+1) = a(k+1) + ( F(n-k-2)/F(n-k) )*( b(k+1) - a(k+1) );
        fx1(k+1) = f(x1(k+1));
        
        x2(k+1) = x1(k);
        fx2(k+1) = fx1(k);
        
    end
    calls = calls + 1;
    k = k + 1;
end

% For k == n - 2, there needs to be exactly one more repetition to partition the
% interval [a(n-2),b(n-2)] one more time, so it is: b(n-2) - a(n-2) < l 
% However, it will always be that x1(n-2) = x2(n-2). Therefore, for this
% last time only, the values of x1 and x2 are calculated indepedently

% Something relatively small
increment = ( b(n-2) - a(n-2) ) /5;

if (k == n - 2)
    
    if ( fx1(k-1) > fx2(k-1) )
        x1(k) = x2(k-1);
        fx1(k) = fx2(k-1);
        
        x2(k) = x1(k) + increment;
        fx2(k) = f(x2(k));
        
    elseif ( fx1(k-1) < fx2(k-1) )
        x1(k) = x2(k) - increment;
        fx1(k) = f(x1(k));
        
        x2(k) = x1(k-1);
        fx2(k) = fx1(k-1);
    end
    calls = calls + 1;
    % Now that x1 and x2 have the proper values, corresponding to each case
    %(whether is was f(x1)>f(x2) or f(x1)<f(x2) the previous repetion)
    % The last partition is performed  
    
    
    if ( fx1(k) > fx2(k) )
        a(k+1) = x1(k);
        b(k+1) = b(k);
        
    elseif ( fx1(k) < fx2(k) )
        a(k+1) = a(k);
        b(k+1) = x2(k);
    end
end % end if(k=n-2)

reps = k;

end % end Fibonacci function