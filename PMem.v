// Verilog project: Verilog code for microcontroller
module PMem( input clk,
   input E, // Enable port
  input [7:0] Addr, // Address port
  output [11:0] I, // Instruction port
  // 3 special ports are used to load program to the memory
  input LE, // Load enable port 
  input[7:0] LA, // Load address port
  input [11:0] LI//Load instruction port
   );
 reg [11:0] Prog_Mem[255:0] ;
// fpga4student.com: FPGA project, Verilog project, VHDL project 
always @(posedge clk)
 begin
 if(LE == 1) begin
 Prog_Mem[LA] <= LI;
 end
 end
 assign I =  (E == 1) ?  Prog_Mem[Addr]: 0 ;
endmodule
module adder( input [7:0] In,
      output [7:0] Out
    );

assign Out = In + 1;

endmodule
module MUX1( input [7:0] In1,In2,
     input Sel,
     output [7:0] Out
    );

assign Out = (Sel==1)? In1: In2;
endmodule