OPENQASM 2.0;
include "qelib1.inc";
gate gate_U3_t q0,q1,q2 { sx q0; rz(-pi) q1; sx q1; rz(-pi/2) q1; cx q1,q0; rz(-0.9853981633974489) q0; sx q1; rz(2.5561944901923463) q1; cx q1,q0; rz(0.9853981633974491) q0; sx q1; cx q1,q0; rz(-pi) q0; sx q0; rz(-pi/2) q1; sx q1; rz(-pi) q1; rz(-pi) q2; sx q2; rz(-pi/2) q2; cx q2,q1; rz(-0.8000000000000002) q1; sx q2; rz(2.3707963267948977) q2; cx q2,q1; rz(0.8000000000000002) q1; sx q2; cx q2,q1; sx q1; rz(pi/2) q1; cx q1,q0; rz(0.5853981633974495) q0; sx q1; rz(2.1561944901923473) q1; cx q1,q0; rz(0.5853981633974499) q0; sx q1; cx q1,q0; rz(-pi) q0; sx q1; sx q1; rz(-pi/2) q1; sx q2; sx q2; rz(-pi/2) q2; }
qreg q63[24];
creg c15[24];
x q63[0];
x q63[2];
x q63[4];
x q63[6];
x q63[8];
x q63[10];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[0],q63[1],q63[2];
gate_U3_t q63[4],q63[5],q63[6];
gate_U3_t q63[8],q63[9],q63[10];
gate_U3_t q63[3],q63[14],q63[15];
gate_U3_t q63[7],q63[18],q63[19];
gate_U3_t q63[11],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
gate_U3_t q63[2],q63[3],q63[4];
gate_U3_t q63[6],q63[7],q63[8];
gate_U3_t q63[10],q63[11],q63[0];
gate_U3_t q63[1],q63[12],q63[13];
gate_U3_t q63[5],q63[16],q63[17];
gate_U3_t q63[9],q63[20],q63[21];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
barrier q63[0],q63[1],q63[2],q63[3],q63[4],q63[5],q63[6],q63[7],q63[8],q63[9],q63[10],q63[11],q63[12],q63[13],q63[14],q63[15],q63[16],q63[17],q63[18],q63[19],q63[20],q63[21],q63[22],q63[23];
measure q63[0] -> c15[0];
measure q63[1] -> c15[1];
measure q63[2] -> c15[2];
measure q63[3] -> c15[3];
measure q63[4] -> c15[4];
measure q63[5] -> c15[5];
measure q63[6] -> c15[6];
measure q63[7] -> c15[7];
measure q63[8] -> c15[8];
measure q63[9] -> c15[9];
measure q63[10] -> c15[10];
measure q63[11] -> c15[11];
measure q63[12] -> c15[12];
measure q63[13] -> c15[13];
measure q63[14] -> c15[14];
measure q63[15] -> c15[15];
measure q63[16] -> c15[16];
measure q63[17] -> c15[17];
measure q63[18] -> c15[18];
measure q63[19] -> c15[19];
measure q63[20] -> c15[20];
measure q63[21] -> c15[21];
measure q63[22] -> c15[22];
measure q63[23] -> c15[23];
