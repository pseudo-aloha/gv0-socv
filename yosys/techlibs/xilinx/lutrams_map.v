
module \$__XILINX_RAM16X1D (CLK1, A1ADDR, A1DATA, B1ADDR, B1DATA, B1EN);
	parameter [15:0] INIT = 16'bx;
	parameter CLKPOL2 = 1;
	input CLK1;

	input [3:0] A1ADDR;
	output A1DATA;

	input [3:0] B1ADDR;
	input B1DATA;
	input B1EN;

	RAM16X1D #(
		.INIT(INIT),
		.IS_WCLK_INVERTED(!CLKPOL2)
	) _TECHMAP_REPLACE_ (
		.DPRA0(A1ADDR[0]),
		.DPRA1(A1ADDR[1]),
		.DPRA2(A1ADDR[2]),
		.DPRA3(A1ADDR[3]),
		.DPO(A1DATA),

		.A0(B1ADDR[0]),
		.A1(B1ADDR[1]),
		.A2(B1ADDR[2]),
		.A3(B1ADDR[3]),
		.D(B1DATA),
		.WCLK(CLK1),
		.WE(B1EN)
	);
endmodule

module \$__XILINX_RAM32X1D (CLK1, A1ADDR, A1DATA, B1ADDR, B1DATA, B1EN);
	parameter [31:0] INIT = 32'bx;
	parameter CLKPOL2 = 1;
	input CLK1;

	input [4:0] A1ADDR;
	output A1DATA;

	input [4:0] B1ADDR;
	input B1DATA;
	input B1EN;

	RAM32X1D #(
		.INIT(INIT),
		.IS_WCLK_INVERTED(!CLKPOL2)
	) _TECHMAP_REPLACE_ (
		.DPRA0(A1ADDR[0]),
		.DPRA1(A1ADDR[1]),
		.DPRA2(A1ADDR[2]),
		.DPRA3(A1ADDR[3]),
		.DPRA4(A1ADDR[4]),
		.DPO(A1DATA),

		.A0(B1ADDR[0]),
		.A1(B1ADDR[1]),
		.A2(B1ADDR[2]),
		.A3(B1ADDR[3]),
		.A4(B1ADDR[4]),
		.D(B1DATA),
		.WCLK(CLK1),
		.WE(B1EN)
	);
endmodule

module \$__XILINX_RAM64X1D (CLK1, A1ADDR, A1DATA, B1ADDR, B1DATA, B1EN);
	parameter [63:0] INIT = 64'bx;
	parameter CLKPOL2 = 1;
	input CLK1;

	input [5:0] A1ADDR;
	output A1DATA;

	input [5:0] B1ADDR;
	input B1DATA;
	input B1EN;

	RAM64X1D #(
		.INIT(INIT),
		.IS_WCLK_INVERTED(!CLKPOL2)
	) _TECHMAP_REPLACE_ (
		.DPRA0(A1ADDR[0]),
		.DPRA1(A1ADDR[1]),
		.DPRA2(A1ADDR[2]),
		.DPRA3(A1ADDR[3]),
		.DPRA4(A1ADDR[4]),
		.DPRA5(A1ADDR[5]),
		.DPO(A1DATA),

		.A0(B1ADDR[0]),
		.A1(B1ADDR[1]),
		.A2(B1ADDR[2]),
		.A3(B1ADDR[3]),
		.A4(B1ADDR[4]),
		.A5(B1ADDR[5]),
		.D(B1DATA),
		.WCLK(CLK1),
		.WE(B1EN)
	);
endmodule

module \$__XILINX_RAM128X1D (CLK1, A1ADDR, A1DATA, B1ADDR, B1DATA, B1EN);
	parameter [127:0] INIT = 128'bx;
	parameter CLKPOL2 = 1;
	input CLK1;

	input [6:0] A1ADDR;
	output A1DATA;

	input [6:0] B1ADDR;
	input B1DATA;
	input B1EN;

	RAM128X1D #(
		.INIT(INIT),
		.IS_WCLK_INVERTED(!CLKPOL2)
	) _TECHMAP_REPLACE_ (
		.DPRA(A1ADDR),
		.DPO(A1DATA),

		.A(B1ADDR),
		.D(B1DATA),
		.WCLK(CLK1),
		.WE(B1EN)
	);
endmodule


module \$__XILINX_RAM32X6SDP (CLK1, A1ADDR, A1DATA, B1ADDR, B1DATA, B1EN);
	parameter [32*6-1:0] INIT = {32*6{1'bx}};
	parameter CLKPOL2 = 1;
	input CLK1;

	input [4:0] A1ADDR;
	output [5:0] A1DATA;

	input [4:0] B1ADDR;
	input [5:0] B1DATA;
	input B1EN;

	wire [1:0] DOD_unused;

	RAM32M #(
		.INIT_A({INIT[187:186], INIT[181:180], INIT[175:174], INIT[169:168], INIT[163:162], INIT[157:156], INIT[151:150], INIT[145:144], INIT[139:138], INIT[133:132], INIT[127:126], INIT[121:120], INIT[115:114], INIT[109:108], INIT[103:102], INIT[ 97: 96], INIT[ 91: 90], INIT[ 85: 84], INIT[ 79: 78], INIT[ 73: 72], INIT[ 67: 66], INIT[ 61: 60], INIT[ 55: 54], INIT[ 49: 48], INIT[ 43: 42], INIT[ 37: 36], INIT[ 31: 30], INIT[ 25: 24], INIT[ 19: 18], INIT[ 13: 12], INIT[  7:  6], INIT[  1:  0]}),
		.INIT_B({INIT[189:188], INIT[183:182], INIT[177:176], INIT[171:170], INIT[165:164], INIT[159:158], INIT[153:152], INIT[147:146], INIT[141:140], INIT[135:134], INIT[129:128], INIT[123:122], INIT[117:116], INIT[111:110], INIT[105:104], INIT[ 99: 98], INIT[ 93: 92], INIT[ 87: 86], INIT[ 81: 80], INIT[ 75: 74], INIT[ 69: 68], INIT[ 63: 62], INIT[ 57: 56], INIT[ 51: 50], INIT[ 45: 44], INIT[ 39: 38], INIT[ 33: 32], INIT[ 27: 26], INIT[ 21: 20], INIT[ 15: 14], INIT[  9:  8], INIT[  3:  2]}),
		.INIT_C({INIT[191:190], INIT[185:184], INIT[179:178], INIT[173:172], INIT[167:166], INIT[161:160], INIT[155:154], INIT[149:148], INIT[143:142], INIT[137:136], INIT[131:130], INIT[125:124], INIT[119:118], INIT[113:112], INIT[107:106], INIT[101:100], INIT[ 95: 94], INIT[ 89: 88], INIT[ 83: 82], INIT[ 77: 76], INIT[ 71: 70], INIT[ 65: 64], INIT[ 59: 58], INIT[ 53: 52], INIT[ 47: 46], INIT[ 41: 40], INIT[ 35: 34], INIT[ 29: 28], INIT[ 23: 22], INIT[ 17: 16], INIT[ 11: 10], INIT[  5:  4]}),
		.INIT_D(64'bx),
		.IS_WCLK_INVERTED(!CLKPOL2)
	) _TECHMAP_REPLACE_ (
		.ADDRA(A1ADDR),
		.ADDRB(A1ADDR),
		.ADDRC(A1ADDR),
		.DOA(A1DATA[1:0]),
		.DOB(A1DATA[3:2]),
		.DOC(A1DATA[5:4]),
		.DOD(DOD_unused),

		.ADDRD(B1ADDR),
		.DIA(B1DATA[1:0]),
		.DIB(B1DATA[3:2]),
		.DIC(B1DATA[5:4]),
		.DID(2'b00),
		.WCLK(CLK1),
		.WE(B1EN)
	);
endmodule

module \$__XILINX_RAM64X3SDP (CLK1, A1ADDR, A1DATA, B1ADDR, B1DATA, B1EN);
	parameter [64*3-1:0] INIT = {64*3{1'bx}};
	parameter CLKPOL2 = 1;
	input CLK1;

	input [5:0] A1ADDR;
	output [2:0] A1DATA;

	input [5:0] B1ADDR;
	input [2:0] B1DATA;
	input B1EN;

	wire DOD_unused;

	RAM64M #(
		.INIT_A({INIT[189], INIT[186], INIT[183], INIT[180], INIT[177], INIT[174], INIT[171], INIT[168], INIT[165], INIT[162], INIT[159], INIT[156], INIT[153], INIT[150], INIT[147], INIT[144], INIT[141], INIT[138], INIT[135], INIT[132], INIT[129], INIT[126], INIT[123], INIT[120], INIT[117], INIT[114], INIT[111], INIT[108], INIT[105], INIT[102], INIT[ 99], INIT[ 96], INIT[ 93], INIT[ 90], INIT[ 87], INIT[ 84], INIT[ 81], INIT[ 78], INIT[ 75], INIT[ 72], INIT[ 69], INIT[ 66], INIT[ 63], INIT[ 60], INIT[ 57], INIT[ 54], INIT[ 51], INIT[ 48], INIT[ 45], INIT[ 42], INIT[ 39], INIT[ 36], INIT[ 33], INIT[ 30], INIT[ 27], INIT[ 24], INIT[ 21], INIT[ 18], INIT[ 15], INIT[ 12], INIT[  9], INIT[  6], INIT[  3], INIT[  0]}),
		.INIT_B({INIT[190], INIT[187], INIT[184], INIT[181], INIT[178], INIT[175], INIT[172], INIT[169], INIT[166], INIT[163], INIT[160], INIT[157], INIT[154], INIT[151], INIT[148], INIT[145], INIT[142], INIT[139], INIT[136], INIT[133], INIT[130], INIT[127], INIT[124], INIT[121], INIT[118], INIT[115], INIT[112], INIT[109], INIT[106], INIT[103], INIT[100], INIT[ 97], INIT[ 94], INIT[ 91], INIT[ 88], INIT[ 85], INIT[ 82], INIT[ 79], INIT[ 76], INIT[ 73], INIT[ 70], INIT[ 67], INIT[ 64], INIT[ 61], INIT[ 58], INIT[ 55], INIT[ 52], INIT[ 49], INIT[ 46], INIT[ 43], INIT[ 40], INIT[ 37], INIT[ 34], INIT[ 31], INIT[ 28], INIT[ 25], INIT[ 22], INIT[ 19], INIT[ 16], INIT[ 13], INIT[ 10], INIT[  7], INIT[  4], INIT[  1]}),
		.INIT_C({INIT[191], INIT[188], INIT[185], INIT[182], INIT[179], INIT[176], INIT[173], INIT[170], INIT[167], INIT[164], INIT[161], INIT[158], INIT[155], INIT[152], INIT[149], INIT[146], INIT[143], INIT[140], INIT[137], INIT[134], INIT[131], INIT[128], INIT[125], INIT[122], INIT[119], INIT[116], INIT[113], INIT[110], INIT[107], INIT[104], INIT[101], INIT[ 98], INIT[ 95], INIT[ 92], INIT[ 89], INIT[ 86], INIT[ 83], INIT[ 80], INIT[ 77], INIT[ 74], INIT[ 71], INIT[ 68], INIT[ 65], INIT[ 62], INIT[ 59], INIT[ 56], INIT[ 53], INIT[ 50], INIT[ 47], INIT[ 44], INIT[ 41], INIT[ 38], INIT[ 35], INIT[ 32], INIT[ 29], INIT[ 26], INIT[ 23], INIT[ 20], INIT[ 17], INIT[ 14], INIT[ 11], INIT[  8], INIT[  5], INIT[  2]}),
		.INIT_D(64'bx),
		.IS_WCLK_INVERTED(!CLKPOL2)
	) _TECHMAP_REPLACE_ (
		.ADDRA(A1ADDR),
		.ADDRB(A1ADDR),
		.ADDRC(A1ADDR),
		.DOA(A1DATA[0]),
		.DOB(A1DATA[1]),
		.DOC(A1DATA[2]),
		.DOD(DOD_unused),

		.ADDRD(B1ADDR),
		.DIA(B1DATA[0]),
		.DIB(B1DATA[1]),
		.DIC(B1DATA[2]),
		.DID(1'b0),
		.WCLK(CLK1),
		.WE(B1EN)
	);
endmodule

module \$__XILINX_RAM32X2Q (CLK1, A1ADDR, A1DATA, A2ADDR, A2DATA, A3ADDR, A3DATA, B1ADDR, B1DATA, B1EN);
	parameter [63:0] INIT = 64'bx;
	parameter CLKPOL2 = 1;
	input CLK1;

	input [4:0] A1ADDR, A2ADDR, A3ADDR;
	output [1:0] A1DATA, A2DATA, A3DATA;

	input [4:0] B1ADDR;
	input [1:0] B1DATA;
	input B1EN;

	RAM32M #(
		.INIT_A(INIT),
		.INIT_B(INIT),
		.INIT_C(INIT),
		.INIT_D(INIT),
		.IS_WCLK_INVERTED(!CLKPOL2)
	) _TECHMAP_REPLACE_ (
		.ADDRA(A1ADDR),
		.ADDRB(A2ADDR),
		.ADDRC(A3ADDR),
		.DOA(A1DATA),
		.DOB(A2DATA),
		.DOC(A3DATA),

		.ADDRD(B1ADDR),
		.DIA(B1DATA),
		.DIB(B1DATA),
		.DIC(B1DATA),
		.DID(B1DATA),
		.WCLK(CLK1),
		.WE(B1EN)
	);
endmodule

module \$__XILINX_RAM64X1Q (CLK1, A1ADDR, A1DATA, A2ADDR, A2DATA, A3ADDR, A3DATA, B1ADDR, B1DATA, B1EN);
	parameter [63:0] INIT = 64'bx;
	parameter CLKPOL2 = 1;
	input CLK1;

	input [5:0] A1ADDR, A2ADDR, A3ADDR;
	output A1DATA, A2DATA, A3DATA;

	input [5:0] B1ADDR;
	input B1DATA;
	input B1EN;

	RAM64M #(
		.INIT_A(INIT),
		.INIT_B(INIT),
		.INIT_C(INIT),
		.INIT_D(INIT),
		.IS_WCLK_INVERTED(!CLKPOL2)
	) _TECHMAP_REPLACE_ (
		.ADDRA(A1ADDR),
		.ADDRB(A2ADDR),
		.ADDRC(A3ADDR),
		.DOA(A1DATA),
		.DOB(A2DATA),
		.DOC(A3DATA),

		.ADDRD(B1ADDR),
		.DIA(B1DATA),
		.DIB(B1DATA),
		.DIC(B1DATA),
		.DID(B1DATA),
		.WCLK(CLK1),
		.WE(B1EN)
	);
endmodule
