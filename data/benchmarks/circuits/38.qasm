OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(pi/2,-pi/2,pi/2) q0; }
gate r_139920838526096(param0,param1) q0 { u3(0.8024352329610455,0,0) q0; }
gate r_139920830881680(param0,param1) q0 { u3(-0.8024352329610455,0,0) q0; }
gate r_139920832078672(param0,param1) q0 { u3(2.542845008681111,0,0) q0; }
gate r_139920830509776(param0,param1) q0 { u3(-pi/2,-pi/2,pi/2) q0; }
gate r_139920830497296(param0,param1) q0 { u3(-pi/2,-pi/2,pi/2) q0; }
gate r_139920830497488(param0,param1) q0 { u3(-2.542845008681111,0,0) q0; }
gate r_139920832053840(param0,param1) q0 { u3(1.3638357396854643,0,0) q0; }
gate r_139920833222608(param0,param1) q0 { u3(-1.558260257159202,0,0) q0; }
gate r_139920833230928(param0,param1) q0 { u3(1.558260257159202,0,0) q0; }
gate r_139920831446480(param0,param1) q0 { u3(-1.3638357396854643,0,0) q0; }
gate r_139920837910480(param0,param1) q0 { u3(-2.337097454819308,0,0) q0; }
gate r_139920837905488(param0,param1) q0 { u3(2.337097454819308,0,0) q0; }
gate r_139920837892176(param0,param1) q0 { u3(2.9544652942582452,0,0) q0; }
gate r_139920830818192(param0,param1) q0 { u3(-2.9544652942582452,0,0) q0; }
gate r_139921726519888(param0,param1) q0 { u3(-pi/2,-pi/2,pi/2) q0; }
gate r_139921726514256(param0,param1) q0 { u3(-pi/2,-pi/2,pi/2) q0; }
gate r_139921729334288(param0,param1) q0 { u3(2.163374401342307,0,0) q0; }
gate r_139921742524560(param0,param1) q0 { u3(-2.163374401342307,0,0) q0; }
gate r_139921726345360(param0,param1) q0 { u3(-2.4380562413169056,0,0) q0; }
gate r_139921726342352(param0,param1) q0 { u3(-2.4380562413169056,0,0) q0; }
gate r_139920838152080(param0,param1) q0 { u3(3.13867238604331,0,0) q0; }
gate r_139920838157392(param0,param1) q0 { u3(-3.13867238604331,0,0) q0; }
gate r_139920838159696(param0,param1) q0 { u3(-0.8320894149877217,0,0) q0; }
gate r_139920838163088(param0,param1) q0 { u3(0.8320894149877217,0,0) q0; }
gate r_139921729179728(param0,param1) q0 { u3(-1.1488774514656144,0,0) q0; }
gate r_139921729177616(param0,param1) q0 { u3(-1.1488774514656144,0,0) q0; }
qreg q[10];
u(1.3363522515478463,1.6910083546977117,0.8313621818597076) q[1];
u(0,0,-pi/4) q[1];
u1(-pi/2) q[2];
u2(0,pi) q[2];
u1(-pi/2) q[2];
u3(0,0,pi/2) q[3];
r(pi/2,0) q[3];
reset q[6];
cx q[1],q[6];
u(0,0,pi/4) q[6];
cx q[1],q[6];
u1(pi/2) q[1];
u2(0,pi) q[1];
u1(pi/2) q[1];
u(0,0,-pi/4) q[6];
u(0,0,5.844651669818395) q[6];
u3(0,0,2.8901683850254933) q[6];
cx q[7],q[0];
u3(5.867244729981201,0,0) q[0];
u1(-pi/2) q[0];
u2(0,pi) q[0];
u1(-pi/2) q[0];
u3(0,0,-2.476268286821335) q[0];
cx q[6],q[0];
u(-0.9548083333887415,0,-2.8901683850254933) q[0];
cx q[6],q[0];
u(0.9548083333887415,5.366436671846828,0) q[0];
id q[0];
u3(0,0,2.8209427350428187) q[0];
u3(0,0,pi/2) q[0];
u3(0,0,-0.6795109975329257) q[6];
u(0,0,5.9588397583173975) q[7];
u3(0,0,-pi/2) q[7];
u1(pi/2) q[8];
u2(0,pi) q[8];
u1(pi/4) q[8];
cx q[4],q[8];
u3(0.5147702157500667,-pi/2,pi/2) q[4];
u(0,0,2.1232366041717934) q[4];
r_139920838526096(0.8024352329610455,pi/2) q[4];
cx q[7],q[4];
r_139920830881680(-0.8024352329610455,pi/2) q[4];
cx q[7],q[4];
u(pi/2,2.8365582733139125,5.103089921701481) q[4];
u2(0,pi) q[4];
u(0,0,2.0381127328750264) q[7];
u1(-pi/4) q[8];
u2(0,pi) q[8];
u1(-pi/2) q[8];
u3(0,0,6.27793303108583) q[8];
r_139920832078672(2.542845008681111,pi/2) q[8];
cx q[9],q[5];
r(pi/2,0) q[5];
cx q[3],q[5];
u1(1.2656555893545849) q[5];
cx q[3],q[5];
r_139920830509776(-pi/2,0) q[3];
u(5.989368665444012,4.936714982173949,6.207412112827042) q[3];
u1(pi/2) q[3];
u2(0,pi) q[3];
u1(pi/2) q[3];
u2(0,pi) q[3];
r_139920830497296(-pi/2,0) q[5];
u1(-pi/2) q[5];
u2(0,pi) q[9];
cx q[2],q[9];
cx q[2],q[8];
r_139920830497488(-2.542845008681111,pi/2) q[8];
cx q[2],q[8];
u1(-pi/2) q[2];
cx q[8],q[2];
u1(pi/2) q[2];
cx q[2],q[3];
u3(0,0,-pi/4) q[2];
u3(pi/2,0,pi) q[2];
u2(0,pi) q[3];
cx q[3],q[4];
u(0,0,-pi/4) q[3];
u2(0,pi) q[4];
cx q[4],q[0];
u(-1.8970647338281024,0,0) q[0];
cx q[4],q[0];
u(1.8970647338281024,-pi/2,0) q[0];
u3(0,0,-pi/4) q[8];
u(0,0,-pi/4) q[8];
cx q[8],q[7];
u(0,0,pi/4) q[7];
cx q[8],q[7];
u(0,0,-pi/4) q[7];
u(pi/2,2.988361185258131,1.8041402965913267) q[7];
u(0.6919367735292655,3.2977951246613593,-3.2977951246613593) q[7];
u2(0,pi) q[9];
cx q[9],q[5];
u1(pi/2) q[5];
reset q[5];
u3(0,0,1.4645944558309987) q[5];
cx q[5],q[6];
u(-1.8982744823163087,0,-1.4645944558309987) q[6];
cx q[5],q[6];
u(2.294381594687443,2.6165480156816665,-2.6165480156816665) q[5];
cx q[3],q[5];
u(0,0,pi/4) q[5];
cx q[3],q[5];
cx q[0],q[3];
cx q[3],q[0];
u3(4.4878039999500405,-pi/2,pi/2) q[0];
u3(0,0,-pi/4) q[3];
reset q[3];
u1(pi/2) q[3];
u(0,0,-pi/4) q[5];
u(4.183721843226928,4.269152309815347,2.769290670463145) q[5];
u3(0,0,pi/2) q[5];
u(1.8982744823163087,2.1441054533639243,0) q[6];
u3(0,0,-2.4524281431191377) q[6];
h q[9];
cx q[1],q[9];
rz(-pi/4) q[9];
cx q[1],q[9];
u3(pi,0,pi) q[1];
h q[9];
h q[9];
cx q[1],q[9];
rz(-pi/4) q[9];
cx q[1],q[9];
u3(0,0,pi/2) q[1];
u(4.28432348522672,2.057306382677725,-2.057306382677725) q[1];
u3(2.547134962533273,0,0) q[1];
u3(pi/2,0,pi) q[1];
u3(0,0,pi/4) q[1];
h q[9];
u3(0,0,-pi/4) q[9];
u3(0,0,3.4918867967844114) q[9];
cx q[9],q[6];
u(-0.1793304403817942,0,-3.4918867967844114) q[6];
cx q[9],q[6];
u(0.1793304403817942,5.944314939903549,0) q[6];
cx q[6],q[8];
h q[6];
cx q[8],q[6];
tdg q[6];
cx q[9],q[6];
t q[6];
cx q[8],q[6];
tdg q[6];
t q[8];
cx q[9],q[6];
t q[6];
h q[6];
cx q[9],q[8];
tdg q[8];
t q[9];
cx q[9],q[8];
cx q[6],q[8];
cx q[6],q[2];
cx q[2],q[6];
u3(0,0,-pi/4) q[2];
u3(0,0,pi/4) q[2];
u3(0,0,5.53243133151812) q[2];
u(0,0,5.1144512434847) q[8];
u3(pi/2,0,pi) q[8];
u3(0,0,pi/4) q[8];
cx q[6],q[8];
u3(0,0,-pi/4) q[8];
u3(pi/2,0,pi) q[8];
cx q[7],q[8];
u3(0,0,pi/4) q[8];
cx q[9],q[1];
u3(0,0,-pi/4) q[1];
cx q[4],q[1];
u3(0,0,pi/4) q[1];
cx q[9],q[1];
u3(0,0,-pi/4) q[1];
u3(pi/2,0,pi) q[1];
cx q[4],q[1];
cx q[1],q[4];
cx q[4],q[1];
u3(0,0,2.955738991255158) q[1];
cx q[1],q[5];
u1(-pi/2) q[4];
u3(0,0,-2.955738991255158) q[5];
cx q[1],q[5];
u(3.4109557334999248,-1.1794897580188528,1.1794897580188528) q[1];
u3(0,0,4.254791011520216) q[1];
u3(0,0,2.955738991255158) q[5];
u3(0,0,-0.5181483731622993) q[5];
cx q[2],q[5];
u(-2.2444998644319223,0,-5.53243133151812) q[5];
cx q[2],q[5];
u(2.2444998644319223,6.05057970468042,0) q[5];
u3(0,0,-0.5839183052130987) q[5];
cx q[1],q[5];
u(-1.5867395281020662,0,-4.254791011520216) q[5];
cx q[1],q[5];
u1(-1.9321677930423493) q[1];
u1(pi/2) q[1];
u(1.5867395281020662,4.838709316733315,0) q[5];
r_139920832053840(1.3638357396854643,pi/2) q[5];
cx q[9],q[8];
u3(0,0,-pi/4) q[8];
cx q[7],q[8];
u3(0,0,pi) q[7];
u1(pi/2) q[7];
u2(0,pi) q[7];
cx q[7],q[3];
cx q[3],q[7];
u2(0,pi) q[3];
u3(0,0,-pi/2) q[7];
u1(-pi/2) q[7];
sdg q[7];
h q[7];
sdg q[7];
u1(pi/2) q[7];
cx q[7],q[1];
r_139920833222608(-1.558260257159202,pi/2) q[1];
r_139920833230928(1.558260257159202,pi/2) q[7];
cx q[7],q[1];
u1(-pi/2) q[1];
u1(1.9321677930423493) q[1];
u(0,0,3.939832114596016) q[1];
u(0,0,pi/4) q[1];
u1(-pi/2) q[7];
s q[7];
h q[7];
s q[7];
u1(pi/2) q[7];
u(0,0,pi/4) q[7];
u3(0,0,pi/4) q[8];
cx q[9],q[8];
u3(0,0,-pi/4) q[8];
u3(pi/2,0,pi) q[8];
u3(0,0,pi/4) q[8];
cx q[6],q[8];
cx q[6],q[4];
u1(pi/2) q[4];
u3(3.1677089011227517,0,0) q[4];
id q[6];
u3(pi/2,0,pi) q[6];
u3(0,0,pi/4) q[6];
cx q[4],q[6];
u3(0,0,-pi/4) q[6];
cx q[2],q[6];
u3(0,0,pi/2) q[2];
u3(0,0,pi/4) q[6];
cx q[4],q[6];
u(0,0,4.449191177392547) q[4];
u3(0,0,0.4224406208686878) q[4];
u3(0,0,-pi/4) q[6];
u3(pi/2,0,pi) q[6];
u(3.032736185990351,3.311073701367303,0.6138361322824701) q[6];
u(0,0,0.007001214228399277) q[6];
u3(0,0,-pi/4) q[8];
u3(pi/2,0,pi) q[8];
u(0,0,0.16907357387568148) q[8];
u3(0,0,pi/4) q[8];
u(0,0,3.02902596674961) q[8];
u(0,0,2.2487301021307147) q[8];
cx q[9],q[0];
cx q[0],q[9];
cx q[9],q[0];
u3(0,0,1.0218235665003823) q[0];
cx q[0],q[3];
cx q[3],q[0];
u(pi/2,0.22875506393578132,5.207172094559432) q[0];
cx q[3],q[5];
r_139920831446480(-1.3638357396854643,pi/2) q[5];
cx q[3],q[5];
u(0,0,2.784352081390442) q[3];
u(0,0,5.574430841148138) q[3];
cx q[3],q[6];
u(0,0,2.6658210635451245) q[5];
u(-2.2496295746844193,0,-5.574430841148138) q[6];
cx q[3],q[6];
cx q[3],q[5];
cx q[5],q[3];
cx q[3],q[5];
u(3.3068031489237413,5.856331882275547,3.4610588456637568) q[5];
u(4.47259067900223,4.1835011017275,-4.1835011017275) q[5];
id q[5];
u(2.2496295746844193,5.567429626919739,0) q[6];
u1(-pi/2) q[6];
sdg q[6];
h q[6];
sdg q[6];
u1(pi/2) q[6];
cx q[7],q[0];
u(0,0,-pi/4) q[0];
cx q[7],q[0];
u(0,0,pi/4) q[0];
u1(-5.0217011845501895) q[0];
u1(pi/2) q[0];
cx q[6],q[0];
r_139920837910480(-2.337097454819308,pi/2) q[0];
r_139920837905488(2.337097454819308,pi/2) q[6];
cx q[6],q[0];
u1(-pi/2) q[0];
u1(5.0217011845501895) q[0];
u3(0,0,4.604130080498782) q[0];
u(0,0,-0.46028175423532147) q[0];
u1(-pi/2) q[6];
s q[6];
h q[6];
s q[6];
u1(pi/2) q[6];
u3(0,0,-pi/4) q[9];
u(0,0,1.3396223711694397) q[9];
cx q[8],q[9];
u(-0.04356297840210317,0,-2.2487301021307147) q[9];
cx q[8],q[9];
u(4.562067974890499,5.281429904638732,2.816339228330092) q[8];
id q[8];
cx q[1],q[8];
u(0,0,-pi/4) q[8];
cx q[1],q[8];
u(3.5710151957784046,-1.003496232896534,1.003496232896534) q[1];
u(0,0,pi/4) q[8];
u1(2.265400901848987) q[8];
cx q[6],q[8];
u1(-2.265400901848987) q[8];
cx q[6],q[8];
r_139920837892176(2.9544652942582452,pi/2) q[6];
u(3.632691319327059,5.690089794791585,4.8786460567851195) q[8];
u(0,0,2.0139394537272755) q[8];
u(0.04356297840210317,0.9091077309612752,0) q[9];
cx q[9],q[2];
u(-3.127534438509626,0,0) q[2];
cx q[9],q[2];
u(3.127534438509626,-pi/2,0) q[2];
u3(0,0,pi/4) q[2];
u3(0,0,-0.052963623633329016) q[9];
cx q[4],q[9];
u(-2.7268139067492365,0,-0.4224406208686878) q[9];
cx q[4],q[9];
u3(0,0,1.6127796871075797) q[4];
cx q[4],q[3];
u3(0,0,-1.6127796871075797) q[3];
cx q[4],q[3];
u3(0,0,1.6127796871075797) q[3];
u3(pi/2,0,pi) q[3];
u3(0,0,pi/4) q[3];
u(0,0,1.9504992123001195) q[4];
u(0,0,4.462129526205596) q[4];
cx q[4],q[0];
u(-0.8046149289156886,0,-4.462129526205596) q[0];
cx q[4],q[0];
u(0.8046149289156886,4.922411280440918,0) q[0];
u2(0,pi) q[4];
u(2.7268139067492365,0.4754042445020168,0) q[9];
u2(0,pi) q[9];
h q[9];
cx q[2],q[9];
tdg q[9];
cx q[7],q[9];
t q[9];
cx q[2],q[9];
t q[2];
tdg q[9];
cx q[7],q[9];
cx q[7],q[2];
tdg q[2];
t q[7];
cx q[7],q[2];
cx q[2],q[3];
u3(0,0,-pi/4) q[3];
cx q[1],q[3];
cx q[1],q[4];
u3(0,0,pi/4) q[3];
cx q[2],q[3];
u3(0,0,-pi/4) q[3];
u3(pi/2,0,pi) q[3];
u(0,0,-pi/4) q[3];
cx q[3],q[2];
u(0,0,pi/4) q[2];
cx q[3],q[2];
u(0,0,-pi/4) q[2];
u3(0,0,pi/2) q[2];
u3(0,0,1.1209409316799799) q[3];
u1(-pi/4) q[4];
cx q[5],q[2];
u(-1.52398459840767,0,0) q[2];
cx q[5],q[2];
u(1.52398459840767,-pi/2,0) q[2];
u(0,0,1.9612662031034316) q[2];
u3(0,0,2.98943122936313) q[2];
u(0,0,-pi/4) q[2];
u2(0,pi) q[5];
u3(pi/2,0,pi) q[7];
cx q[8],q[7];
u(0,0,-2.0139394537272755) q[7];
cx q[8],q[7];
u(0,0,2.0139394537272755) q[7];
u3(0,0,0.9293162572233653) q[7];
cx q[3],q[7];
u(-0.5609918670754317,0,-1.1209409316799799) q[7];
cx q[3],q[7];
u(0.5609918670754317,0.19162467445661455,0) q[7];
cx q[3],q[7];
cx q[7],q[3];
r(pi/2,0) q[3];
t q[9];
h q[9];
u2(0,pi) q[9];
cx q[9],q[6];
r_139920830818192(-2.9544652942582452,pi/2) q[6];
cx q[9],q[6];
cx q[6],q[4];
u1(pi/4) q[4];
cx q[1],q[4];
u1(pi/4) q[1];
u1(-pi/4) q[4];
cx q[6],q[4];
u1(pi/4) q[4];
u2(0,pi) q[4];
u3(0,0,3.975184915631382) q[4];
cx q[6],q[1];
u1(-pi/4) q[1];
u1(pi/4) q[6];
cx q[6],q[1];
u3(0,0,-pi/4) q[1];
cx q[8],q[6];
cx q[6],q[8];
cx q[8],q[6];
cx q[6],q[1];
cx q[1],q[6];
r(pi/2,0) q[6];
cx q[3],q[6];
u1(2.257307391950452) q[6];
cx q[3],q[6];
r_139921726519888(-pi/2,0) q[3];
u(0,0,2.62541266050989) q[3];
u(0,0,4.512243084710336) q[3];
r_139921726514256(-pi/2,0) q[6];
u2(0,pi) q[8];
cx q[8],q[5];
u1(4.427965191496025) q[5];
cx q[8],q[5];
u2(0,pi) q[5];
u3(0,0,0.24015465586888932) q[5];
u1(-pi/2) q[5];
u2(0,pi) q[8];
u1(pi/2) q[9];
u2(0,pi) q[9];
u1(pi/4) q[9];
cx q[0],q[9];
u3(0,0,pi/2) q[0];
u3(3.959012821129444,0,0) q[0];
u3(0,0,pi) q[0];
cx q[0],q[6];
cx q[6],q[0];
u(pi,0,pi) q[0];
u1(1.0909005062424733) q[0];
u1(pi/2) q[6];
u2(0,pi) q[6];
u1(pi/2) q[6];
u1(-pi/4) q[9];
u2(0,pi) q[9];
u1(-pi/2) q[9];
u3(0,0,-1.5516550730476155) q[9];
cx q[4],q[9];
u(-2.2617742864698145,0,-3.975184915631382) q[9];
cx q[4],q[9];
u3(0,0,-pi/4) q[4];
u1(pi/2) q[4];
u2(0,pi) q[4];
u1(pi/4) q[4];
cx q[1],q[4];
u(4.188582833497451,4.001340686997898,3.1771509453749824) q[1];
u1(-pi/4) q[4];
u2(0,pi) q[4];
u1(-pi/2) q[4];
u(0,0,0.6362844641430117) q[4];
cx q[3],q[4];
u(-1.5991714231244765,0,-4.512243084710336) q[4];
cx q[3],q[4];
u1(pi/2) q[3];
u2(0,pi) q[3];
u1(pi/4) q[3];
u(1.5991714231244765,3.875958620567325,0) q[4];
u3(1.599151598547387,-pi/2,pi/2) q[4];
u3(0,0,-pi/2) q[4];
u3(0,0,pi/2) q[4];
u(2.2617742864698145,5.526839988678997,0) q[9];
u(0,0,3.903991303687975) q[9];
u2(0,pi) q[9];
h q[9];
cx q[8],q[9];
tdg q[9];
cx q[7],q[9];
t q[9];
cx q[8],q[9];
t q[8];
tdg q[9];
cx q[7],q[9];
cx q[7],q[8];
t q[7];
tdg q[8];
cx q[7],q[8];
cx q[7],q[5];
u1(pi/2) q[5];
cx q[5],q[3];
u1(-pi/4) q[3];
u2(0,pi) q[3];
u1(-pi/2) q[3];
u2(0,pi) q[3];
u3(2.739194291672164,-pi/2,pi/2) q[5];
u1(-pi/2) q[5];
u2(0,pi) q[5];
u1(-pi/2) q[5];
reset q[5];
u(2.2608083296549353,2.252718481278367,1.9784388358732288) q[5];
u(3.2019275609214035,2.015633816664088,3.2744447406444586) q[5];
u2(0,pi) q[5];
u3(0,0,pi/2) q[7];
u3(0,0,pi/2) q[8];
u1(-pi/2) q[8];
u2(0,pi) q[8];
u1(-pi/2) q[8];
u1(-pi/2) q[8];
sdg q[8];
h q[8];
sdg q[8];
u1(pi/2) q[8];
t q[9];
h q[9];
u2(0,pi) q[9];
cx q[2],q[9];
u(0,0,pi/4) q[9];
cx q[2],q[9];
u(0,0,1.3129081013641608) q[2];
cx q[2],q[1];
u(0,0,-1.3129081013641608) q[1];
cx q[2],q[1];
u(0,0,1.3129081013641608) q[1];
cx q[1],q[3];
reset q[2];
u3(0,0,-pi/2) q[2];
u(0,0,0.9405315597405147) q[2];
u1(-pi/4) q[3];
cx q[6],q[3];
u1(pi/4) q[3];
cx q[1],q[3];
u1(pi/4) q[1];
u1(-pi/4) q[3];
cx q[6],q[3];
u1(pi/4) q[3];
u2(0,pi) q[3];
u(pi,0,pi) q[3];
cx q[6],q[1];
u1(-pi/4) q[1];
u1(pi/4) q[6];
cx q[6],q[1];
cx q[6],q[1];
cx q[1],q[6];
u(0,0,6.017244157131045) q[1];
h q[6];
cx q[3],q[6];
rz(-pi/4) q[6];
cx q[3],q[6];
u3(pi,0,pi) q[3];
h q[6];
h q[6];
cx q[3],q[6];
rz(-pi/4) q[6];
cx q[3],q[6];
u3(2.9599509696884296,0,0) q[3];
u3(4.402854605055467,-pi/2,pi/2) q[3];
u1(-pi/2) q[3];
u2(0,pi) q[3];
u1(-pi/2) q[3];
u(5.184668608832538,0.28999536477667487,-0.28999536477667487) q[3];
h q[6];
u(0,0,0.7020698772059781) q[6];
u1(pi/2) q[6];
u2(0,pi) q[6];
u1(pi/2) q[6];
u1(pi/4) q[6];
cx q[6],q[5];
u1(-pi/4) q[5];
cx q[6],q[5];
u1(pi/4) q[5];
u2(0,pi) q[5];
reset q[5];
u3(2.704895567574255,-pi/2,pi/2) q[6];
u(0,0,-pi/4) q[9];
cx q[9],q[7];
u(-1.3248543622941475,0,0) q[7];
cx q[9],q[7];
u(1.3248543622941475,-pi/2,0) q[7];
cx q[7],q[0];
u1(-1.0909005062424733) q[0];
cx q[7],q[0];
u2(0,pi) q[7];
cx q[0],q[7];
h q[0];
u2(0,pi) q[7];
cx q[7],q[0];
rz(-pi/4) q[0];
cx q[7],q[0];
h q[0];
h q[0];
u3(pi,0,pi) q[7];
cx q[7],q[0];
rz(-pi/4) q[0];
cx q[7],q[0];
h q[0];
r_139921729334288(2.163374401342307,pi/2) q[0];
cx q[1],q[0];
r_139921742524560(-2.163374401342307,pi/2) q[0];
cx q[1],q[0];
u2(0,pi) q[0];
u1(2.132869139422791) q[1];
u1(pi/2) q[1];
u1(1.1855735352747396) q[9];
u1(pi/2) q[9];
cx q[8],q[9];
r_139921726345360(-2.4380562413169056,pi/2) q[8];
r_139921726342352(-2.4380562413169056,pi/2) q[9];
cx q[8],q[9];
u1(-pi/2) q[8];
s q[8];
h q[8];
s q[8];
u1(pi/2) q[8];
u3(0,0,-pi/4) q[8];
reset q[8];
u(1.3197038211473073,1.3010312842286524,5.2175165119687215) q[8];
u(pi,0,pi) q[8];
u3(0,0,2.127464147238044) q[8];
u(pi/2,1.7519587220938122,4.4932416926983345) q[8];
u1(-pi/2) q[9];
u1(-1.1855735352747396) q[9];
cx q[9],q[4];
u(-0.8606408520510105,0,0) q[4];
cx q[9],q[4];
cx q[2],q[9];
u(0.8606408520510105,-pi/2,0) q[4];
u3(1.9850865920717444,0,0) q[4];
u1(pi/4) q[4];
u(0,0,-0.9405315597405147) q[9];
cx q[2],q[9];
r_139920838152080(3.13867238604331,pi/2) q[2];
cx q[7],q[2];
r_139920838157392(-3.13867238604331,pi/2) q[2];
cx q[7],q[2];
u1(-3.8923986856218873) q[2];
u1(pi/2) q[2];
u1(-pi/2) q[7];
sdg q[7];
h q[7];
sdg q[7];
u1(pi/2) q[7];
cx q[7],q[2];
r_139920838159696(-0.8320894149877217,pi/2) q[2];
r_139920838163088(0.8320894149877217,pi/2) q[7];
cx q[7],q[2];
u1(-pi/2) q[2];
u1(3.8923986856218873) q[2];
u2(0,pi) q[2];
u1(-pi/2) q[7];
s q[7];
h q[7];
s q[7];
u1(pi/2) q[7];
u2(0,pi) q[7];
u(0,0,0.9405315597405147) q[9];
u2(0,pi) q[9];
cx q[4],q[9];
u1(-pi/4) q[9];
cx q[4],q[9];
u1(-pi/2) q[4];
sdg q[4];
h q[4];
sdg q[4];
u1(pi/2) q[4];
cx q[4],q[1];
r_139921729179728(-1.1488774514656144,pi/2) q[1];
r_139921729177616(-1.1488774514656144,pi/2) q[4];
cx q[4],q[1];
u1(-pi/2) q[1];
u1(-2.132869139422791) q[1];
id q[1];
u(0,0,1.596300297748756) q[1];
u1(-pi/2) q[4];
s q[4];
h q[4];
s q[4];
u1(pi/2) q[4];
u2(0,pi) q[4];
cx q[7],q[4];
u1(0.007006508595771769) q[4];
cx q[7],q[4];
u2(0,pi) q[4];
u3(0,0,pi) q[4];
u2(0,pi) q[7];
u1(pi/4) q[9];
u2(0,pi) q[9];
cx q[9],q[0];
u2(0,pi) q[0];
u3(0,0,0.9492150522194798) q[0];
cx q[9],q[2];
u1(1.1228523819715814) q[2];
cx q[9],q[2];
u2(0,pi) q[2];
