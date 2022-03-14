function [x,y,k] = SteepestDescend(f,start_x,start_y,acc_e, gamma_choice, gamma_constant)
gradf = gradient(f);
x = []; % stores all x values
y = []; % stores all y values
d = {}; % stores all d(k) values
gamma = []; % stores all gamma(k) values
m = []; % stores all m(k) values for armijo
x(1) = start_x;
y(1) = start_y;
k = 1;


while (norm(gradf(x(end),y(end))) >= acc_e && k<500)
    d{k} = -gradf(x(end),y(end));
    
    % gamma(k) is chosen either as:
    % constant
    % minimizing the value of f(x(k) +gamma(k)*d{k})
    % or based on the Armijo rule
    if (strcmp(gamma_choice,'constant'))
    gamma(k) = gamma_constant;
    end
    
    temp = [x(end),y(end)] + gamma(k)*(d{k}');
    x(end+1) = temp(1);
    y(end+1) = temp(2);
    k = k + 1;
end


end % end SteepestDescend