% Clear
clear
clc
close all

syms t s

%% Given

G1_num = [0 0 1];
G1_den = [1 0 0];

G2_num = [0 1];
G2_den = [1 1];

G3_num = [0 1];
G3_den = [1 0];

H1_num = [0 1];
H1_den = [1 0];

H2_num = [0 1];
H2_den = [1 -1];

H3_num = [0 1];
H3_den = [1 -2];

%% Reducing Block Diagrams

GH3_num = conv(G3_num, H3_num);
GH3_den = conv(G3_den, H3_den);

TF3_add = [1 -2 1];
TF3_num = conv(GH3_den, GH3_num);
TF3_den = conv(G3_den, TF3_add);

G2_num_add = [1 2];
G2_num_sum = conv(G2_num, G2_den);
G2_den_sum = conv(G2_den, G2_num) ;

TF4_num = conv(TF3_num, G2_num_sum);
TF4_den = conv(TF3_den, G2_den_sum);

GH2_num = conv(G2_num, H2_num);
GH2_den = conv(G2_den, H2_den);

TF2_num = conv(GH2_den, GH2_num);
TF2_add = [1 0 0];
TF2_den = conv(G2_den,TF2_add);

TF1_num = conv(G1_num, TF2_num);
TF1_den = conv(G1_den, TF2_den);

TFH1_num = conv(TF1_num, H1_num);
TFH1_den = conv(TF1_den, H1_den);

TF5_add = [1 1 0 0 1 0 -1];
TF5_num = conv(TF1_num, TFH1_den);
TF5_den = conv(TF1_den, TF5_add);

TF_num = conv(TF5_num, TF4_num);
TF_den = conv(TF5_den, TF4_den);

TF = tf(TF_num, TF_den)

%Step Response
step(TF,0:0.1:20)