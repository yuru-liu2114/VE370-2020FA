`ifndef __VE370__ALU__
`define __VE370__ALU__
module alu(
    input [3:0] ALUcontrol, 
    input [31:0] a, b, 
    output zero, 
    output reg [31:0] ALUresult 
);


initial begin
        ALUresult = 32'b0;
    end
always @(*) begin
    case (ALUcontrol)
        4'b0000: // and 
        ALUresult = a & b;
        4'b0001: // or
        ALUresult = a | b;
        4'b0010: // add
        ALUresult = a + b;
        4'b0110: // sub
        ALUresult = a - b;
        4'b0111: // slt
        ALUresult = (a < b) ? 1 : 0;
        4'b1100: // nor
        ALUresult = ~(a | b);
        default: 
        ALUresult = a & b;
    endcase
end

assign zero = (ALUresult == 0);

endmodule 
`endif