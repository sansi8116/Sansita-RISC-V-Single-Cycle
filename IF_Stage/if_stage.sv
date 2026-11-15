
module if_stage (
    input  logic        clk,
    input  logic        reset,
    input  logic        stall,
    input  logic        and_out,
    input  logic [31:0] pc_signed_offset,

    output logic [31:0] address,
    output logic [31:0] pc_new
);

    // Calculate the next sequential address
    assign pc_new = address + 32'd4;

    // Update the Program Counter
    always_ff @(posedge clk or posedge reset) begin

        if (reset) begin
            address <= 32'h8000_0000;
        end

        else if (!stall) begin
            if (and_out) begin
                address <= pc_signed_offset;
            end
            else begin
                address <= pc_new;
            end
        end

    end

endmodule
