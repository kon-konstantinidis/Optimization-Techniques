function [x,y,k] = LM(f,start_x,start_y,const_e,gamma_choice)
gradf = gradient(f);
Hf = hessian(f);
x = []; % stores all x values
y = []; % stores all y values
d = {}; % stores all d(k) values
mi = []; % stores all mi(k) values
gamma = []; % stores all gamma(k) values
m = []; % stores all m(k) values for armijo
x(1) = start_x;
y(1) = start_y;
k = 1;
while (norm(gradf(x(end),y(end))) >= const_e)
    % Step 2
    % Increasing temp_mi by one until the matrix syst is positive difinite
    temp_mi = 1;
    syst = Hf(x(end),y(end)) + temp_mi*[1 0; 0 1];
    ds = eig(syst);
    isposdef = all(ds > 0);
    while (isposdef == 0)
    temp_mi = temp_mi + 1;
    syst = Hf(x(end),y(end)) + temp_mi*[1 0; 0 1];
    ds = eig(syst);
    isposdef = all(ds > 0);
    end
    % Step 3
    d{k} = -inv(syst)*gradf(x(end),y(end));
    % Step 4
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
    temp = [x(end),y(end)] - gamma(k)*(d{k}');
    x(end+1) = temp(1);
    y(end+1) = temp(2);
    k = k + 1;
end


end % end LM function