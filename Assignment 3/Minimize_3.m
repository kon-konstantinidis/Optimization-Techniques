% Minimize 3

syms f(x1,x2)
f(x1,x2) = (1/2)*x1^2 + (1/2)*x2^2;
Hf = hessian(f);
d = eig(Hf);
isposdef = all(d > 0);


% ITEM 1

%[SDix,SDiy,SDireps] = SteepestDescend(f,1,2,0.01,'constant',0.1);
%[SDiix,SDiiy,SDiireps] = SteepestDescend(f,1,2,0.01,'constant',1);
%[SDiiix,SDiiiy,SDiiireps] = SteepestDescend(f,1,2,0.01,'constant',2);
[SDivx,SDivy,SDivreps] = SteepestDescend(f,1,2,0.01,'constant',10);


% [x,y,k] = SteepestDescendP(f,start_x,start_y,acc_e,gamma_constant,sk)
% ITEM 2
[SDP2x,SDP2y,SDP2reps] = SteepestDescendP(f,8,3,0.01,0.1,15);


% ITEM 3
[SDP3x,SDP3y,SDP3reps] = SteepestDescendP(f,-5,7,0.02,0.3,20);


% ITEM 4
[SDP4x,SDP4y,SDP4reps] = SteepestDescendP(f,11,3,0.01,0.01,0.1);


% end Minimize_3