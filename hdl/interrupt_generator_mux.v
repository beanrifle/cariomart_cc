module interupt_generator_mux (
    input PCLK, // clock
    input PRESERN, // system reset
    //APB3 BUS INTERFACE
    input PSEL, // peripheral select
    input PENABLE, // distinguishes access phase
    output wire PREADY, // peripheral ready signal
    output wire PSLVERR, // error signal
    input PWRITE, // read/write control bit
    input [31:0] PADDR, // IO address
    input wire [31:0] PWDATA, // (processor) bus is writing data to
    // this device 32 bits
    output reg [31:0] PRDATA, // (processor) bus is reading data from this device
    // *** Your Code (inputs & outputs)
    input button,
    input source,
    output out0,
    output out1,
    output reg interrupt,
    output reg debug_led
);
    assign PSLVERR = 0; //assumes no error generation
    assign PREADY = 1; //assumes zero wait
    wire write_enable = (PENABLE && PWRITE && PSEL); //decodes APB3 write cycle
    wire read_enable = (!PWRITE && PSEL); //decode APB3 read cycle
    wire MUX_WRITE = (write_enable && PADDR[7:0] == 8'h00);

    reg select;
    reg last_button_state, db;
    reg [31:0] debounce_counter;

    // Mux using select
    assign out0 = (select) ? 1 : source;
    assign out1 = (select) ? source : 1;

    // Interrupt generation
    always @(posedge PCLK) 
    begin
        if (!db && button && !last_button_state) begin
            db = 1;
            debounce_counter = 32'h0000ffff;
        end
        
        if (debounce_counter > 0) debounce_counter = debounce_counter - 1;
        else if (db && button) begin
            interrupt = 1;
            debug_led = !debug_led;
            db = 0;
        end
        else interrupt = 0;

        last_button_state = button;
    end

    // Writes to change MUX source
    always @(posedge PCLK)
    begin
        if(!PRESERN) select = 0;
        else if(MUX_WRITE) select = PWDATA[0];
    end

endmodule