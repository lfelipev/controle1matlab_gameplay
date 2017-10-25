num = [ 3 ]
den = [ 1 3.2 3 ]

sys = tf(num,den)

sys_z1 = c2d(sys, 0.1, 'tustin')
sys_z2 = c2d(sys, 0.8, 'zoh')

tz = feedback(sys_z1, 1)
step(tz)
%%
s = tf('s')
G = 1/(s*(s+1)^2)
bode(G)



%%
s = tf('s');
G1 = 100*(537)/((s+100)*(s+36)*s);
G2 = G1+1;
%%
pzmap(G1)
figure
%%
%pzmap(G2)
figure
nyquist(G1)
figure
bode(G1)
figure
rlocus(G1)
figure
step(feedback(G1,1))
%%
g = (s+1)/(s+0.1)*0.1;
bode(g)

%%
x = 0:0.001:1;


a = 2 * x;
b = sqrt(sqrt(1+4*x.^4)-2*x.^2);

mf = atan(a./b);

plot(x, mf*180/pi,x,100*x)
figure
mup = 100.*exp(-(x.*pi./sqrt(1-x.^2)));
plot(x,mup)