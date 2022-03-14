function [x,y,k] = SteepestDescendP(f,start_x,start_y,acc_e,gamma_constant,sk)
gradf = gradient(f);
x = []; % stores all x values
y = []; % stores all y values
gamma = []; % stores all gamma(k) values
d = {}; % stores all d(k) values
xBar = []; % stores all xBar(k) values
x(1) = start_x;
y(1) = start_y;
k = 1;

while (norm(gradf(x(end),y(end))) >= acc_e)
    gamma(k) = gamma_constant;
    d{k} = gradf(x(end),y(end));
    
    xBar(k,:) = [x(end),y(end)] - (sk*d{k})';
    
    % Projecting xBar on the set of restraints
    if (xBar(k,1) < -20)
        xBar(k,1) = -20;
    elseif (xBar(k,1) > 10)
        xBar(k,1) = 10;
    end
    
    if (xBar(k,2) < -12)
        xBar(k,2) = -12;
    elseif(xBar(k,2) > 15)
        xBar(k,2) = 15;
    end
    
    nextX = [x(end),y(end)] + gamma(k)*(xBar(k) - [x(end),y(end)]);   
    x(end+1) = nextX(1);
    y(end+1) = nextX(2);
    k = k + 1;
end


end % end SteepestDescendP