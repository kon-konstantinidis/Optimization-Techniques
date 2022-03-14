function [x,y,k] = Newton(f,start_x,start_y,const_e,gamma_choice)
gradf = gradient(f);
Hf = hessian(f);
invHf = inv(Hf);
x = []; % stores all x values
y = []; % stores all y values
d = {}; % stores all d(k) values
gamma = []; % stores all gamma(k) values
m = []; % stores all m(k) values for armijo
x(1) = start_x;
y(1) = start_y;
k = 1;
% If Hf is not positive definite, then the Newton method is not applicable
% so an error is displayed and the function returns
d = eig(Hf(x(1),y(1))); % checking Eigenvalues of Hf
isposdef = all(d > 0);
if (isposdef == 0)
    msg = ['Hessian of f not positive difinite, Newton method not applicable for starting vector Xk = [',num2str(start_x),' ',num2str(start_y),'].'];
    disp(msg);
    return;
end

while (norm(gradf(x(end),y(end))) >= const_e)
    d{k} = -invHf(x(end),y(end))*gradf(x(end),y(end));
    
    % gamma(k) is chosen either as:
    % constant
    % minimizing the value of f(x(k) +gamma(k)*d{k})
    % or based on the Armijo rule
    if (strcmp(gamma_choice,'constant'))
    gamma(k) = 0.1;
    elseif (strcmp(gamma_choice,'minimize'))
        
        
    elseif (strcmp(gamma_choice,'armijo'))
        % The values of a,b and s are selected arbitrarily 
        a = 0.001;
        b = 0.3;
        s = 0.5;
        % the lowest starting value for mk is selected
        temp_mk = 1;
        temp_gamma = s*(b^temp_mk);
        temp = [x(end),y(end)] - (temp_gamma*gradf(x(end),y(end)))';
        while (f(x(end),y(end)) - f(temp(1),temp(2)) < -a*(b^temp_mk)*s*(d{k}')*gradf( x(end),y(end) ) )
        temp_mk = temp_mk + 1;
        temp_gamma = s*(b^temp_mk);
        temp = [x(end),y(end)] - (temp_gamma*gradf(x(end),y(end)))';
        end
        m(k) = temp_mk;
        gamma(k) = temp_gamma;
    end
    temp = [x(end),y(end)] + gamma(k)*(d{k}');
    x(end+1) = temp(1);
    y(end+1) = temp(2);
    k = k + 1;
end

end