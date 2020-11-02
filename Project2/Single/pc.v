`ifndef __VE370__PC__
`define __VE370__PC__
module pc(
    input clock,
    input [31:0] next,
    output reg [31:0] pres
);

initial begin
    pres = 32'b0;
end

always @(posedge clock) begin
    pres = next;
end

endmodule 
`endif