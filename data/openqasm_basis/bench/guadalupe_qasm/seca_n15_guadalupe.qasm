OPENQASM 2.0;
include "qelib1.inc";
qreg q[15];
creg c[11];
rz(pi) q[0];
rz(pi/2) q[0];
sx q[0];
rz(pi/2) q[0];
barrier q[1],q[4],q[10],q[7],q[3],q[0],q[6],q[9],q[5],q[2],q[8];
cx q[0],q[1];
cx q[1],q[0];
cx q[0],q[1];
cx q[2],q[3];
cx q[3],q[2];
cx q[2],q[3];
cx q[1],q[2];
cx q[1],q[4];
cx q[3],q[5];
cx q[4],q[1];
cx q[1],q[4];
cx q[1],q[2];
cx q[2],q[1];
cx q[1],q[2];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
cx q[5],q[3];
cx q[3],q[5];
cx q[6],q[7];
cx q[7],q[6];
cx q[6],q[7];
cx q[4],q[7];
cx q[4],q[1];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
rz(pi) q[1];
cx q[1],q[2];
cx q[1],q[2];
cx q[2],q[1];
cx q[1],q[2];
cx q[2],q[3];
cx q[3],q[5];
cx q[5],q[3];
cx q[3],q[5];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
cx q[4],q[7];
rz(pi/2) q[4];
sx q[4];
rz(pi/2) q[4];
rz(pi) q[4];
cx q[1],q[4];
cx q[4],q[1];
cx q[1],q[4];
cx q[1],q[0];
rz(pi/2) q[0];
sx q[0];
rz(pi/2) q[0];
cx q[1],q[2];
cx q[2],q[1];
cx q[1],q[2];
cx q[2],q[3];
cx q[3],q[5];
rz(pi/2) q[4];
sx q[4];
rz(pi/2) q[4];
cx q[1],q[4];
cx q[1],q[2];
cx q[2],q[1];
cx q[1],q[2];
cx q[1],q[0];
rz(pi/2) q[0];
sx q[0];
rz(pi/2) q[0];
rz(pi/2) q[4];
sx q[4];
rz(pi/2) q[4];
cx q[5],q[3];
cx q[3],q[5];
rz(pi/2) q[3];
sx q[3];
rz(pi/2) q[3];
cx q[2],q[3];
cx q[1],q[2];
cx q[2],q[1];
cx q[1],q[2];
rz(pi/2) q[3];
sx q[3];
rz(pi/2) q[3];
cx q[3],q[5];
cx q[5],q[3];
cx q[3],q[5];
rz(pi/2) q[3];
sx q[3];
rz(pi/2) q[3];
cx q[2],q[3];
rz(pi/2) q[3];
sx q[3];
rz(pi/2) q[3];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
rz(pi) q[7];
cx q[7],q[6];
cx q[7],q[10];
cx q[10],q[7];
cx q[7],q[10];
cx q[6],q[7];
cx q[7],q[6];
cx q[6],q[7];
cx q[8],q[11];
cx q[11],q[8];
cx q[8],q[11];
cx q[10],q[12];
cx q[12],q[10];
cx q[10],q[12];
cx q[7],q[10];
cx q[10],q[7];
cx q[7],q[10];
rz(pi/2) q[10];
sx q[10];
rz(pi/2) q[10];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
cx q[11],q[14];
cx q[14],q[11];
cx q[11],q[14];
cx q[13],q[14];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
cx q[12],q[10];
rz(pi/2) q[10];
sx q[10];
rz(pi/2) q[10];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
rz(pi/2) q[14];
sx q[14];
rz(pi/2) q[14];
cx q[13],q[14];
rz(pi/2) q[14];
sx q[14];
rz(pi/2) q[14];
barrier q[0],q[4],q[6],q[10],q[1],q[2],q[13],q[9],q[5],q[3],q[14];
cx q[6],q[7];
cx q[7],q[6];
cx q[6],q[7];
cx q[7],q[10];
cx q[10],q[7];
cx q[7],q[10];
cx q[10],q[12];
cx q[12],q[10];
cx q[10],q[12];
rz(pi/2) q[9];
sx q[9];
rz(pi/2) q[9];
cx q[8],q[9];
cx q[9],q[8];
cx q[8],q[9];
cx q[8],q[11];
cx q[11],q[8];
cx q[8],q[11];
cx q[11],q[14];
cx q[14],q[11];
cx q[11],q[14];
cx q[13],q[14];
cx q[14],q[13];
cx q[13],q[14];
cx q[13],q[12];
barrier q[0],q[4],q[12],q[7],q[1],q[2],q[14],q[13],q[5],q[3],q[11];
cx q[1],q[2];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
cx q[10],q[12];
cx q[12],q[10];
cx q[10],q[12];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
cx q[2],q[1];
cx q[1],q[2];
cx q[1],q[4];
cx q[4],q[1];
cx q[1],q[4];
cx q[7],q[10];
cx q[10],q[7];
cx q[7],q[10];
cx q[4],q[7];
rz(pi/2) q[4];
sx q[4];
rz(pi/2) q[4];
measure q[4] -> c[0];
measure q[7] -> c[9];
cx q[7],q[10];
cx q[10],q[7];
cx q[7],q[10];
cx q[10],q[12];
cx q[10],q[12];
cx q[12],q[10];
cx q[10],q[12];
rz(pi/2) q[10];
sx q[10];
rz(pi/2) q[10];
cx q[4],q[7];
cx q[7],q[4];
cx q[4],q[7];
cx q[7],q[10];
rz(pi/2) q[10];
sx q[10];
rz(pi/2) q[10];
barrier q[0],q[1],q[10],q[4],q[2],q[7],q[14],q[12],q[5],q[3],q[11];
cx q[0],q[1];
cx q[1],q[0];
cx q[0],q[1];
cx q[13],q[14];
cx q[14],q[13];
cx q[13],q[14];
cx q[11],q[14];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
cx q[14],q[11];
cx q[11],q[14];
cx q[4],q[7];
cx q[7],q[4];
cx q[4],q[7];
cx q[1],q[4];
cx q[4],q[1];
cx q[1],q[4];
cx q[0],q[1];
cx q[1],q[0];
cx q[0],q[1];
cx q[2],q[1];
cx q[2],q[3];
cx q[3],q[2];
cx q[2],q[3];
cx q[3],q[5];
rz(pi/2) q[5];
sx q[5];
rz(pi/2) q[5];
cx q[7],q[10];
cx q[10],q[7];
cx q[7],q[10];
cx q[12],q[10];
rz(pi/2) q[10];
sx q[10];
rz(pi/2) q[10];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
cx q[13],q[14];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
cx q[12],q[10];
rz(pi/2) q[10];
sx q[10];
rz(pi/2) q[10];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
rz(pi/2) q[14];
sx q[14];
rz(pi/2) q[14];
cx q[13],q[14];
rz(pi/2) q[13];
sx q[13];
rz(pi/2) q[13];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
cx q[10],q[12];
rz(-pi/4) q[12];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
rz(pi/2) q[14];
sx q[14];
rz(pi/2) q[14];
cx q[14],q[13];
rz(pi/4) q[13];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
cx q[10],q[12];
rz(pi/4) q[10];
rz(-pi/4) q[12];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
cx q[10],q[12];
cx q[12],q[10];
cx q[10],q[12];
cx q[14],q[13];
cx q[13],q[14];
cx q[14],q[13];
cx q[13],q[14];
cx q[13],q[12];
rz(-pi/4) q[12];
rz(pi/4) q[13];
cx q[13],q[12];
rz(pi/4) q[14];
rz(pi/2) q[14];
sx q[14];
rz(pi/2) q[14];
cx q[7],q[4];
cx q[4],q[7];
cx q[7],q[4];
cx q[4],q[7];
cx q[1],q[4];
cx q[4],q[1];
cx q[1],q[4];
cx q[1],q[2];
cx q[1],q[4];
cx q[2],q[3];
cx q[3],q[2];
cx q[2],q[3];
cx q[4],q[1];
cx q[1],q[4];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
cx q[2],q[1];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
cx q[2],q[3];
cx q[3],q[2];
cx q[2],q[3];
rz(pi/2) q[2];
sx q[2];
rz(pi/2) q[2];
cx q[3],q[5];
rz(pi/2) q[3];
sx q[3];
rz(pi/2) q[3];
rz(pi/2) q[5];
sx q[5];
rz(pi/2) q[5];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
cx q[4],q[7];
cx q[1],q[4];
cx q[4],q[1];
cx q[1],q[4];
cx q[1],q[2];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
cx q[1],q[4];
rz(pi/2) q[2];
sx q[2];
rz(pi/2) q[2];
cx q[4],q[1];
cx q[1],q[4];
cx q[1],q[2];
cx q[2],q[1];
cx q[1],q[2];
cx q[1],q[4];
cx q[2],q[3];
rz(-pi/4) q[3];
rz(-pi/4) q[4];
cx q[5],q[3];
rz(pi/4) q[3];
cx q[2],q[3];
rz(pi/4) q[2];
rz(-pi/4) q[3];
cx q[5],q[3];
cx q[3],q[5];
cx q[5],q[3];
cx q[3],q[5];
cx q[3],q[2];
rz(-pi/4) q[2];
rz(pi/4) q[3];
cx q[3],q[2];
rz(pi/4) q[5];
rz(pi/2) q[5];
sx q[5];
rz(pi/2) q[5];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
cx q[7],q[4];
rz(pi/4) q[4];
cx q[1],q[4];
rz(pi/4) q[1];
rz(-pi/4) q[4];
cx q[7],q[4];
cx q[4],q[7];
cx q[7],q[4];
cx q[4],q[7];
cx q[4],q[1];
rz(-pi/4) q[1];
rz(pi/4) q[4];
cx q[4],q[1];
rz(pi/4) q[7];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
barrier q[4],q[2],q[7],q[12],q[5],q[0],q[14],q[10],q[3],q[1],q[13];
rz(pi/2) q[14];
sx q[14];
rz(pi/2) q[14];
rz(pi/2) q[14];
sx q[14];
rz(pi/2) q[14];
cx q[13],q[14];
cx q[14],q[13];
cx q[13],q[14];
cx q[12],q[13];
rz(-pi/4) q[13];
cx q[14],q[13];
rz(pi/4) q[13];
cx q[12],q[13];
rz(pi/4) q[12];
rz(-pi/4) q[13];
cx q[14],q[13];
cx q[13],q[14];
cx q[14],q[13];
cx q[13],q[14];
cx q[13],q[12];
rz(-pi/4) q[12];
rz(pi/4) q[13];
cx q[13],q[12];
rz(pi/4) q[14];
rz(pi/2) q[14];
sx q[14];
rz(pi/2) q[14];
rz(pi/2) q[14];
sx q[14];
rz(pi/2) q[14];
rz(pi/2) q[5];
sx q[5];
rz(pi/2) q[5];
rz(pi/2) q[5];
sx q[5];
rz(pi/2) q[5];
cx q[3],q[5];
cx q[5],q[3];
cx q[3],q[5];
cx q[2],q[3];
rz(-pi/4) q[3];
cx q[5],q[3];
rz(pi/4) q[3];
cx q[2],q[3];
rz(pi/4) q[2];
rz(-pi/4) q[3];
cx q[5],q[3];
cx q[3],q[5];
cx q[5],q[3];
cx q[3],q[5];
cx q[3],q[2];
rz(-pi/4) q[2];
rz(pi/4) q[3];
cx q[3],q[2];
rz(pi/4) q[5];
rz(pi/2) q[5];
sx q[5];
rz(pi/2) q[5];
rz(pi/2) q[5];
sx q[5];
rz(pi/2) q[5];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
cx q[4],q[7];
cx q[7],q[4];
cx q[4],q[7];
cx q[1],q[4];
rz(-pi/4) q[4];
cx q[7],q[4];
rz(pi/4) q[4];
cx q[1],q[4];
rz(pi/4) q[1];
rz(-pi/4) q[4];
cx q[7],q[4];
cx q[4],q[7];
cx q[7],q[4];
cx q[4],q[7];
cx q[4],q[1];
rz(-pi/4) q[1];
rz(pi/4) q[4];
cx q[4],q[1];
rz(pi/4) q[7];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
barrier q[4],q[2],q[7],q[12],q[5],q[0],q[14],q[10],q[3],q[1],q[13];
rz(pi/2) q[14];
sx q[14];
rz(pi/2) q[14];
rz(pi) q[14];
cx q[11],q[14];
cx q[14],q[11];
cx q[11],q[14];
rz(pi/2) q[5];
sx q[5];
rz(pi/2) q[5];
rz(pi) q[5];
cx q[3],q[5];
cx q[5],q[3];
cx q[3],q[5];
cx q[2],q[3];
cx q[3],q[2];
cx q[2],q[3];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
rz(pi) q[7];
cx q[4],q[7];
cx q[7],q[4];
cx q[4],q[7];
cx q[1],q[4];
cx q[4],q[1];
cx q[1],q[4];
cx q[1],q[2];
cx q[1],q[2];
cx q[2],q[1];
cx q[1],q[2];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
cx q[2],q[3];
cx q[3],q[2];
cx q[2],q[3];
cx q[8],q[11];
cx q[11],q[8];
cx q[8],q[11];
cx q[5],q[8];
cx q[8],q[5];
cx q[5],q[8];
cx q[3],q[5];
cx q[2],q[3];
cx q[3],q[2];
cx q[2],q[3];
cx q[2],q[1];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
cx q[2],q[3];
cx q[3],q[2];
cx q[2],q[3];
rz(pi/2) q[5];
sx q[5];
rz(pi/2) q[5];
cx q[3],q[5];
rz(pi/2) q[3];
sx q[3];
rz(pi/2) q[3];
rz(pi/2) q[5];
sx q[5];
rz(pi/2) q[5];
cx q[5],q[3];
rz(-pi/4) q[3];
cx q[2],q[3];
cx q[3],q[2];
cx q[2],q[3];
cx q[1],q[2];
rz(pi/4) q[2];
cx q[2],q[3];
cx q[3],q[2];
cx q[2],q[3];
cx q[5],q[3];
rz(-pi/4) q[3];
cx q[2],q[3];
cx q[3],q[2];
cx q[2],q[3];
cx q[1],q[2];
cx q[1],q[2];
cx q[2],q[1];
cx q[1],q[2];
rz(pi/4) q[1];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
rz(pi/4) q[5];
cx q[3],q[5];
cx q[5],q[3];
cx q[3],q[5];
cx q[2],q[3];
rz(pi/4) q[2];
rz(-pi/4) q[3];
cx q[2],q[3];
cx q[1],q[2];
cx q[2],q[1];
cx q[1],q[2];
cx q[3],q[2];
rz(-pi/4) q[2];
cx q[1],q[2];
rz(pi/4) q[2];
cx q[3],q[2];
rz(-pi/4) q[2];
cx q[1],q[2];
rz(pi/4) q[3];
cx q[2],q[3];
cx q[3],q[2];
cx q[2],q[3];
cx q[1],q[2];
rz(pi/4) q[1];
rz(-pi/4) q[2];
cx q[1],q[2];
rz(pi/4) q[3];
rz(pi/2) q[3];
sx q[3];
rz(pi/2) q[3];
rz(pi/2) q[3];
sx q[3];
rz(pi/2) q[3];
barrier q[7],q[5],q[3],q[12],q[1],q[0],q[2],q[10],q[8],q[4],q[13];
rz(pi/2) q[3];
sx q[3];
rz(pi/2) q[3];
rz(pi) q[3];
barrier q[9],q[7],q[11],q[5],q[3],q[12],q[14],q[1],q[0],q[2],q[10],q[8],q[6],q[4],q[13];
measure q[3] -> c[10];
