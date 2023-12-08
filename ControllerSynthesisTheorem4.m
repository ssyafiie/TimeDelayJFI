function K=CDesignT4(A,A1,A2,B,C,l1,l2,h1,h2,d21,d22)
% This code is developed for the theorem 3 
% A, A1, A2, B and C are system matrices
% l1 and l2 are lower bound of delay 
% h1 and h2 are upper bound of delay
% d21 and d22 are upper bound of delay derivative 
%% 
n=size(A,1);
m=size(B,2);
q=size(C,1);
p=size(Bw,2);
%gamma=1e-5;
%% LMI set
setlmis([]); 
%% define unknown variables
Y=lmivar(1,[n 1]);
X=lmivar(2,[m n]);
bQ1=lmivar(1,[n 1]); % to represent $$\bar{Q}_1$$
bQ2=lmivar(1,[n 1]);
tQ1=lmivar(1,[n 1]);
tQ2=lmivar(1,[n 1]);
bR1=lmivar(1,[n 1]);
bR2=lmivar(1,[n 1]);
tR1=lmivar(1,[n 1]);
tR2=lmivar(1,[n 1]);
bS1=lmivar(1,[n 1]);
bS2=lmivar(1,[n 1]);
tS1=lmivar(1,[n 1]);
tS2=lmivar(1,[n 1]);
bT1=lmivar(1,[n 1]);
bT2=lmivar(1,[n 1]);
tT1=lmivar(1,[n 1]);
tT2=lmivar(1,[n 1]);
bU1=lmivar(1,[n 1]);
bU2=lmivar(1,[n 1]);
tU1=lmivar(1,[n 1]);
tU2=lmivar(1,[n 1]);
bW1=lmivar(1,[n 1]);
bW2=lmivar(1,[n 1]);
gamma=lmivar(1,[1 1]);
%% first matrix LMI condition
% entry (1,1)
lmiterm([1 1 1 Y],A,1,'s');     % AY+YA'
lmiterm([1 1 1 X],B,1,'s');     % BX+X'B'
lmiterm([1 1 1 bQ1],1,1); 
lmiterm([1 1 1 bQ2],1,1); 
lmiterm([1 1 1 tT1],-1,1); 
lmiterm([1 1 1 tT2],-1,1); 
% entry to (1,2)
lmiterm([1 1 2 Y],1,1);
% entry to (1,3)
lmiterm([1 1 3 Y],1,1);
% entry to (1,4)
lmiterm([1 1 4 bU1],A1,1);
% entry to (1,5)
lmiterm([1 1 5 bU2],A2,1);
% entry  (1,6)
lmiterm([1 1 6 0],Bw); %%% to define a known parameter in LMI
% entry (1,7) 
lmiterm([1 1 7 Y],1,C');
% entry (1,8) is zero
% entry (1,9) is zero
% entry (1,10)
lmiterm([1 1 10 Y],l1,A');
lmiterm([1 1 10 -X],l1,B');
% entry to (1,11)
lmiterm([1 1 11 Y],l2,A');
lmiterm([1 1 11 -X],l2,B');
% entry to (1,12)
lmiterm([1 1 12 Y],(h1-l1),A');
lmiterm([1 1 12 -X],(h1-l1),B');
% entry to (1,13)
lmiterm([1 1 13 Y],(h2-l2),A');
lmiterm([1 1 13 -X],(h2-l2),B'); 
% entry to (2,2)
lmiterm([1 2 2 tQ1],-1,1);
lmiterm([1 2 2 bT1],-1,1);
lmiterm([1 2 2 tU1],-1,1);
lmiterm([1 2 2 tR1],1,1);
lmiterm([1 2 2 tS1],1,1);
% entry to (2,3) is zeo
% entry to (2,4)
lmiterm([1 2 4 bU1],1,1);
lmiterm([1 2 4 bW1],-1,1);
% entry to (2,5) is zero
% entry to (2,6) is zero
% entry to (2,7) is zero
% entry (2,8)
lmiterm([1 2 8 bW1],1,1);
% entries (2,9) to (2,13) are zero
% entry (3,3)
lmiterm([1 3 3 tQ2],-1,1);
lmiterm([1 3 3 bT2],-1,1);
lmiterm([1 3 3 tU2],-1,1);
lmiterm([1 3 3 tR2],1,1);
lmiterm([1 3 3 tS2],1,1);
% entry (3,4) is zero
% entry (3,5)
lmiterm([1 3 5 bU2],1,1);
lmiterm([1 3 5 bW2],-1,1);
% entryies (3,6) to (3,8) are zero
% entry (3,9) 
lmiterm([1 3 9 bW2],1,1);
% entries (3,10) to (3,13) are zero
% entry (4,4)
lmiterm([1 4 4 bS1],(1-d21),-1);
lmiterm([1 4 4 bU1],-1,2);
lmiterm([1 4 4 bW1],1,1);
lmiterm([1 4 4 -bW1],1,1);
% entries (4,5) to (4,7) are zero
% entry (4,8)
lmiterm([1 4 8 bU1],1,1);
lmiterm([1 4 8 bW1],-1,1);
% entry (4,9) is zero
% entry (4,10)
lmiterm([1 4 10 bU1],A1',l1);
% entry (4,11)
lmiterm([1 4 11 bU1],A1',l2);
% entry (4,12)
lmiterm([1 4 12 bU1],A1',(h1-l1));
% entry (4,13)
lmiterm([1 4 13 bU1],A1',(h2-l2));
% entry (5,5)
lmiterm([1 5 5 bS2],(1-d22),-1);
lmiterm([1 5 5 bU2],-1,2);
lmiterm([1 5 5 bW2],1,1);
lmiterm([1 5 5 -bW2],1,1);
% entries (5,6) to (5,8) is zero
% entry (5,9)
lmiterm([1 5 9 bU2],1,1);
lmiterm([1 5 9 bW2],-1,1);
% entry (5,10)
lmiterm([1 5 10 bU2],A2',l1);
% entry (5,11)
lmiterm([1 5 11 bU2],A2',l2);
% entry (5,12)
lmiterm([1 5 12 bU2],A2',(h1-l1));
% entry (5,13)
lmiterm([1 5 13 bU2],A2',(h2-l2));
% entry (6,6)
lmiterm([1 6 6 0],-gamma^2);    %% to introduce gamma
% entries (6,7) to (6,9) are zero
% entry (6,10)
lmiterm([1 6 10 1],Bw',l1);
% entry (6,11)
lmiterm([1 6 11 1],Bw',l2);
% entry (6,12)
lmiterm([1 6 10 1],Bw',(h1-l1));
% entry (6,13)
lmiterm([1 6 10 1],Bw',(h2-l2));
% entry (7,7)
lmiterm([1 7 7 0],-eye(p));
% entry (8,8)
lmiterm([1 8 8 bR1],-1,1);
lmiterm([1 8 8 bU1],-1,1);
% entry (9,9)
lmiterm([1 9 9 bR2],-1,1);
lmiterm([1 8 8 bU2],-1,1);
% entry (10,10)
lmiterm([1 10 10 bT1],-1,l1);
% entry (11,11)
lmiterm([1 11 11 bT2],-1,l2);
% entry (12,12)
lmiterm([1 12 12 bU1],-1,(h1-l1));
% entry (13,13)
lmiterm([1 13 13 bU2],-1,(h2-l2));
%% condition 2
lmiterm([-2 1 1 bU1],1,1);
lmiterm([-2 1 2 bW1],1,1);
lmiterm([-2 2 2 bU1],1,1);
%% condition 3
lmiterm([-3 1 1 bU2],1,1);
lmiterm([-3 1 2 bW2],1,1);
lmiterm([-3 2 2 bU2],1,1);
% conditions of the positiveness 
lmiterm([-4 1 1 Y],1,1);        % Y>0
lmiterm([-5 1 1 bQ1],1,1);
lmiterm([-6 1 1 bQ2],1,1);
lmiterm([-7 1 1 tQ1],1,1);
lmiterm([-8 1 1 tQ2],1,1);
lmiterm([-9 1 1 bR1],1,1);
lmiterm([-10 1 1 bR2],1,1);
lmiterm([-11 1 1 tR1],1,1);
lmiterm([-12 1 1 tR2],1,1);
lmiterm([-13 1 1 bS1],1,1);
lmiterm([-14 1 1 bS2],1,1);
lmiterm([-15 1 1 tS1],1,1);
lmiterm([-16 1 1 tS2],1,1);
lmiterm([-17 1 1 bT1],1,1);
lmiterm([-18 1 1 bT2],1,1);
lmiterm([-19 1 1 tT1],1,1);
lmiterm([-20 1 1 tT2],1,1);
lmiterm([-21 1 1 bU1],1,1);
lmiterm([-22 1 1 bU2],1,1);
lmiterm([-23 1 1 tU1],1,1);
lmiterm([-24 1 1 tU2],1,1);
lmiterm([-25 1 1 gamma],1,1) % to bound gamma
%% solution
LMIs=getlmis;
[tmin,xfeas]=feasp(LMIs);
Yo=dec2mat(LMIs,xfeas,Y);
Xo=dec2mat(LMIs,xfeas,X);
gamma_o=dec2mat(LMIs,xfeas,gamma);
K=Xo*inv(Yo);
end