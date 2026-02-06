module pipeline_reg (
    input  logic        clk,
    input  logic        rst_n,

    // Input side
    input  logic        in_valid,
    output logic        in_ready,
    input  logic [31:0] in_data,

    // Output side
    output logic        out_valid,
    input  logic        out_ready,
    output logic [31:0] out_data
);

    logic        reg_valid;
    logic [31:0] reg_data;

    // Ready when register is empty
    assign in_ready  = ~reg_valid;

    // Output valid when register has data
    assign out_valid = reg_valid;
    assign out_data  = reg_data;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            reg_valid <= 1'b0;
            reg_data  <= 32'd0;
        end
        else begin
            // Capture input data when available
            if (in_valid && in_ready) begin
                reg_data  <= in_data;
                reg_valid <= 1'b1;
            end

            // Clear data once output side accepts it
            if (out_valid && out_ready) begin
                reg_valid <= 1'b0;
            end
        end
    end

endmodule
