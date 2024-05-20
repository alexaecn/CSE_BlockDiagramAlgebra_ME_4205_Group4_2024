%Clear
clear
clc
close all

syms t s

%% Given

G1_n = [0 0 1];
G1_d = [1 0 0];

G2_n = [0 1];
G2_d = [1 1];

G3_n = [0 1];
G3_d = [1 0];

G4_n = [0 1];
G4_d = [2 0];

H1_n = [0 1];
H1_d = [1 0];

H2_n = [0 1];
H2_d = [1 -1];

H3_n = [0 1];
H3_d = [1 -2];

G1 = tf(G1_n, G1_d)
G2 = tf(G2_n, G2_d)
G3 = tf(G3_n, G3_d)
G4 = tf(G4_n, G4_d)
H1 = tf(H1_n, H1_d)
H2 = tf(H2_n, H2_d)
H3 = tf(H3_n, H3_d)

%% Reduction of Block Diagrams

TF_d1_2 = conv(G3_d,G4_d);
TF_d2_2 = conv(TF_d1_2,H3_d);

TF_d3_2 = conv(G2_d,G3_d);
TF_d4_2 = conv(TF_d1_2,H2_d);

TF_d5_2 = conv(G1_d,G2_d);
TF_d6_2 = conv(TF_d1_2,G3_d);
TF_d7_2 = conv(TF_d1_2,H1_d);

TF_d14_1 = conv(TF_d2_2,TF_d4_2);
TF_d15_1 = conv(TF_d14_1,TF_d7_2);

TF_d_2 = TF_d15_1;

TF_n1_1 = conv(G1_n,G2_n);
TF_n2_1 = conv(TF_n1_1,G3_n);
TF_n_1 = conv(TF_n2_1,G4_n);

TF_n1_2 = conv(G1_d,G2_d);
TF_n2_2 = conv(TF_n1_2,G3_d);
TF_n_2 = conv(TF_n2_2,G4_d);

TF_d1_1 = conv(G3_n,G4_n);
TF_d2_1 = conv(TF_d1_1,H3_n);

TF_d8_1 = conv(TF_d2_1,TF_d4_2);
TF_d9_1 = conv(TF_d8_1,TF_d7_2);

TF_d3_1 = conv(G2_n,G3_n);
TF_d4_1 = conv(TF_d1_1,H2_n);

TF_d10_1 = conv(TF_d4_1,TF_d2_2);
TF_d11_1 = conv(TF_d10_1,TF_d7_2);

TF_d5_1 = conv(G1_n,G2_n);

TF_d6_1 = conv(TF_d1_1,G3_n);
TF_d7_1 = conv(TF_d1_1,H1_n);

TF_d12_1 = conv(TF_d7_1,TF_d2_2);
TF_d13_1 = conv(TF_d12_1,TF_d4_2);

TF_d14_1 = conv(TF_d2_2,TF_d4_2);

TF_d_1 = [2 -6 4 3 -7 6 -5 2];

TF_num = conv(TF_n_1,TF_d_2);
TF_den = conv(TF_n_2,TF_d_1);

TF = tf(TF_num, TF_den)

%%STEP RESPONSE
step(TF, 0:0.1:10)