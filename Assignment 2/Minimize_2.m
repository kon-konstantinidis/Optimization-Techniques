% MINIMIZE FUNCTION OF TWO VARIABLES USING ITS DIFFERENTIAL

% Initializing the function f(x,y)
syms f(x,y)
f(x,y) = (x^3)*exp(- (x^2) - (y^4) );
% Below is the code written to produce the answers required for the paper

%{
% ITEM 1 (Plot function)
[X,Y] = meshgrid(-2.5:0.1:2.5);
Z = (X.^3).*(exp(-(X.^2) - (Y.^4)));
surf(X,Y,Z); % first type of plot
figure; % adds new figure so the last diagram is not overwritten
contourf(X,Y,Z); % second type of plot
figure;

% ITEM 2 (Steepest Descent method)
[SDxic,SDyic,SDrepsic] = SteepestDescend(f,0,0,0.01, 'constant');
plot(SDxic,'v');
hold on;
plot(SDyic);
hold off;
figure;


[SDxiic,SDyiic,SDrepsiic] = SteepestDescend(f,-1,-1,0.01, 'constant');
plot(SDxiic,'v');
hold on;
plot(SDyiic,'^');
hold off;
figure;

[SDxiiic,SDyiiic,SDrepsiiic] = SteepestDescend(f,1,1,0.01, 'constant');
plot(SDxiiic,'v');
hold on;
plot(SDyiiic,'v');
hold off;
figure;

%{
[SDxim,SDyim,SDrepsim] = SteepestDescend(f,0,0,0.01, 'minimize');
[SDxiim,SDyiim,SDrepsiim] = SteepestDescend(f,-1,-1,0.01, 'minimize');
[SDxiiim,SDyiiim,SDrepsiiim] = SteepestDescend(f,1,1,0.01, 'minimize');
%}

[SDxia,SDyia,SDrepsia] = SteepestDescend(f,0,0,0.01, 'armijo');
plot(SDxia,'v');
hold on;
plot(SDyia);
hold off;
figure;

[SDxiia,SDyiia,SDrepsiia] = SteepestDescend(f,-1,-1,0.01, 'armijo');
plot(SDxiia,'v');
hold on;
plot(SDyiia,'^');
hold off;
figure;

[SDxiiia,SDyiiia,SDrepsiiia] = SteepestDescend(f,1,1,0.01, 'armijo');
figure;
plot(SDxiiia,'v');
hold on;
plot(SDyiiia,'v');
hold off;
figure;


% ITEM 3 (Newton Method)
[Nxic,Nyic,Nrepsic] = Newton(f,0,0,0.01,'constant');
plot(Nxic,'v');
hold on;
plot(Nyic);
hold off;
figure;

[Nxiic,Nyiic,Nrepsiic] = Newton(f,-1,-1,0.01,'constant');
plot(Nxiic,'v');
hold on;
plot(Nyiic,'^');
hold off;
figure;

[Nxiiic,Nyiiic,Nrepsiiic] = Newton(f,1,1,0.01,'constant');
plot(Nxiiic,'v');
hold on;
plot(Nyiiic,'v');
hold off;
figure;

%{
[Nxim,Nyim,Nrepsim] = Newton(f,0,0,0.01,'minimize');
[Nxiim,Nyiim,Nrepsiim] = Newton(f,-1,-1,0.01,'minimize');
[Nxiiim,Nyiiim,Nrepsiiim] = Newton(f,1,1,0.01,'minimize');
%}

[Nxia,Nyia,Nrepsia] = Newton(f,0,0,0.01,'armijo');
plot(Nxia,'v');
hold on;
plot(Nyia);
hold off;
figure;

[Nxiia,Nyiia,Nrepsiia] = Newton(f,-1,-1,0.01,'armijo');
plot(Nxiia,'v');
hold on;
plot(Nyiia,'^');
hold off;
figure;

[Nxiiia,Nyiiia,Nrepsiiia] = Newton(f,1,1,0.01,'armijo');
plot(Nxiiia,'v');
hold on;
plot(Nyiiia,'v');
hold off;
figure;

%}
% ITEM 4 (Levenberg-Marquardt method)
[LMxic,LMyic,LMrepsic] = LM(f,0,0,0.01,'constant');
plot(LMxic,'v');
hold on;
plot(LMyic);
hold off;
figure;

[LMxiic,LMyiic,LMrepsiic] = LM(f,-1,-1,0.01,'constant');
plot(LMxiic,'v');
hold on;
plot(LMyiic,'^');
hold off;
figure;

[LMxiiic,LMyiiic,LMrepsiiic] = LM(f,1,1,0.01,'constant');
plot(LMxiiic,'v');
hold on;
plot(LMyiiic,'v');
hold off;
figure;
%{
[LMxim,LMyim,LMrepsim] = LM(f,0,0,0.01,'minimize');
[LMxiim,LMyiim,LMrepsiim] = LM(f,-1,-1,0.01,'minimize');
[LMxiiim,LMyiiim,LMrepsiiim] = LM(f,1,1,0.01,'minimize');
%}
[LMxia,LMyia,LMrepsia] = LM(f,0,0,0.01,'armijo');
plot(LMxia,'v');
hold on;
plot(LMyia);
hold off;
figure;

[LMxiia,LMyiia,LMrepsiia] = LM(f,-1,-1,0.01,'armijo');
plot(LMxiia,'v');
hold on;
plot(LMyiia,'^');
hold off;
figure;

[LMxiiia,LMyiiia,LMrepsiiia] = LM(f,1,1,0.01,'armijo');
plot(LMxiiia,'v');
hold on;
plot(LMyiiia,'v');
hold off;
figure;

% end Minimize