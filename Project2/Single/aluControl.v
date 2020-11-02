`ifndef __VE370__ALU__CONTROL__
`define __VE370__ALU__CONTROL__
module aluControl(
    input [1:0] ALUOp,
    input [5:0] funct,
    output reg [3:0] ALUControl
);

always @(ALUOp, funct) begin
    case (ALUOp)
        2'b00: // addi/lw/sw
        ALUControl = 4'b0010;
        2'b01: // beq
        ALUControl = 4'b0110;
        2'b10: begin 
            case (funct)
                6'b100000: // add
                ALUControl = 4'b0010;
                6'b100010: // sub
                ALUControl = 4'b0110;
                6'b100100: // and
                ALUControl = 4'b0000;
                6'b100101: // or
                ALUControl = 4'b0001;
                6'b101010: // slt
                ALUControl = 4'b0111;
                default: 
                ALUControl = 4'b0000;
            endcase
        end
        2'b11:
        ALUControl = 4'b0000;
        default: ALUControl = 4'b0000;
    endcase
end

endmodule 
`endif