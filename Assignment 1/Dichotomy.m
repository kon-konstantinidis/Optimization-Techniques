function [a,b,reps,calls] = Dichotomy(f, start_a, start_b, acc_l, const_e)
a(1) = start_a;
b(1) = start_b;
reps = 0;
k = 1;
x1 = [];
x2 = [];
calls = 0;

while (b(k) - a(k) > acc_l)
 
    x1(k) = ((a(k) + b(k))/2) - const_e;
    x2(k) = ((a(k) + b(k))/2) + const_e;
    
    if (f(x1(k)) < f(x2(k)))
        a(k+1) = a(k);
        b(k+1) = x2(k);
    else 
        a(k+1) = x1(k);
        b(k+1) = b(k);
    end
    calls = calls + 2;
    k = k + 1;
end
reps = k - 1;
end % end Dichotomy function