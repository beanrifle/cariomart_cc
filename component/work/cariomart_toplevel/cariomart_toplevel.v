//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Dec 03 23:13:05 2019
// Version: v11.8 SP1 11.8.1.12
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// cariomart_toplevel
module cariomart_toplevel(
    // Inputs
    MSS_RESET_N,
    UART_0_RXD,
    UART_1_RXD,
    button,
    source,
    // Outputs
    UART_0_TXD,
    UART_1_TXD,
    debug_led,
    out0,
    out1
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  MSS_RESET_N;
input  UART_0_RXD;
input  UART_1_RXD;
input  button;
input  source;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output UART_0_TXD;
output UART_1_TXD;
output debug_led;
output out0;
output out1;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          button;
wire          cariomart_mss_0_FAB_CLK;
wire          cariomart_mss_0_M2F_RESET_N;
wire          cariomart_mss_0_MSS_MASTER_APB_PENABLE;
wire   [31:0] cariomart_mss_0_MSS_MASTER_APB_PRDATA;
wire          cariomart_mss_0_MSS_MASTER_APB_PREADY;
wire          cariomart_mss_0_MSS_MASTER_APB_PSELx;
wire          cariomart_mss_0_MSS_MASTER_APB_PSLVERR;
wire   [31:0] cariomart_mss_0_MSS_MASTER_APB_PWDATA;
wire          cariomart_mss_0_MSS_MASTER_APB_PWRITE;
wire   [31:0] CoreAPB3_0_APBmslave0_PADDR;
wire          CoreAPB3_0_APBmslave0_PENABLE;
wire   [31:0] CoreAPB3_0_APBmslave0_PRDATA;
wire          CoreAPB3_0_APBmslave0_PREADY;
wire          CoreAPB3_0_APBmslave0_PSELx;
wire          CoreAPB3_0_APBmslave0_PSLVERR;
wire   [31:0] CoreAPB3_0_APBmslave0_PWDATA;
wire          CoreAPB3_0_APBmslave0_PWRITE;
wire          debug_led_net_0;
wire          interupt_generator_mux_0_interrupt;
wire          MSS_RESET_N;
wire          out0_net_0;
wire          out1_net_0;
wire          source;
wire          UART_0_RXD;
wire          UART_0_TXD_net_0;
wire          UART_1_RXD;
wire          UART_1_TXD_net_0;
wire          UART_1_TXD_net_1;
wire          UART_0_TXD_net_1;
wire          debug_led_net_1;
wire          out0_net_1;
wire          out1_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire          VCC_net;
wire   [31:0] IADDR_const_net_0;
wire   [31:0] PRDATAS1_const_net_0;
wire   [31:0] PRDATAS2_const_net_0;
wire   [31:0] PRDATAS3_const_net_0;
wire   [31:0] PRDATAS4_const_net_0;
wire   [31:0] PRDATAS5_const_net_0;
wire   [31:0] PRDATAS6_const_net_0;
wire   [31:0] PRDATAS7_const_net_0;
wire   [31:0] PRDATAS8_const_net_0;
wire   [31:0] PRDATAS9_const_net_0;
wire   [31:0] PRDATAS10_const_net_0;
wire   [31:0] PRDATAS11_const_net_0;
wire   [31:0] PRDATAS12_const_net_0;
wire   [31:0] PRDATAS13_const_net_0;
wire   [31:0] PRDATAS14_const_net_0;
wire   [31:0] PRDATAS15_const_net_0;
wire   [31:0] PRDATAS16_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [31:20]cariomart_mss_0_MSS_MASTER_APB_PADDR_0_31to20;
wire   [19:0] cariomart_mss_0_MSS_MASTER_APB_PADDR_0_19to0;
wire   [31:0] cariomart_mss_0_MSS_MASTER_APB_PADDR_0;
wire   [19:0] cariomart_mss_0_MSS_MASTER_APB_PADDR;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net               = 1'b0;
assign VCC_net               = 1'b1;
assign IADDR_const_net_0     = 32'h00000000;
assign PRDATAS1_const_net_0  = 32'h00000000;
assign PRDATAS2_const_net_0  = 32'h00000000;
assign PRDATAS3_const_net_0  = 32'h00000000;
assign PRDATAS4_const_net_0  = 32'h00000000;
assign PRDATAS5_const_net_0  = 32'h00000000;
assign PRDATAS6_const_net_0  = 32'h00000000;
assign PRDATAS7_const_net_0  = 32'h00000000;
assign PRDATAS8_const_net_0  = 32'h00000000;
assign PRDATAS9_const_net_0  = 32'h00000000;
assign PRDATAS10_const_net_0 = 32'h00000000;
assign PRDATAS11_const_net_0 = 32'h00000000;
assign PRDATAS12_const_net_0 = 32'h00000000;
assign PRDATAS13_const_net_0 = 32'h00000000;
assign PRDATAS14_const_net_0 = 32'h00000000;
assign PRDATAS15_const_net_0 = 32'h00000000;
assign PRDATAS16_const_net_0 = 32'h00000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign UART_1_TXD_net_1 = UART_1_TXD_net_0;
assign UART_1_TXD       = UART_1_TXD_net_1;
assign UART_0_TXD_net_1 = UART_0_TXD_net_0;
assign UART_0_TXD       = UART_0_TXD_net_1;
assign debug_led_net_1  = debug_led_net_0;
assign debug_led        = debug_led_net_1;
assign out0_net_1       = out0_net_0;
assign out0             = out0_net_1;
assign out1_net_1       = out1_net_0;
assign out1             = out1_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign cariomart_mss_0_MSS_MASTER_APB_PADDR_0_31to20 = 12'h0;
assign cariomart_mss_0_MSS_MASTER_APB_PADDR_0_19to0 = cariomart_mss_0_MSS_MASTER_APB_PADDR[19:0];
assign cariomart_mss_0_MSS_MASTER_APB_PADDR_0 = { cariomart_mss_0_MSS_MASTER_APB_PADDR_0_31to20, cariomart_mss_0_MSS_MASTER_APB_PADDR_0_19to0 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------cariomart_mss
cariomart_mss cariomart_mss_0(
        // Inputs
        .UART_1_RXD  ( UART_1_RXD ),
        .MSS_RESET_N ( MSS_RESET_N ),
        .UART_0_RXD  ( UART_0_RXD ),
        .MSSPRDATA   ( cariomart_mss_0_MSS_MASTER_APB_PRDATA ),
        .MSSPREADY   ( cariomart_mss_0_MSS_MASTER_APB_PREADY ),
        .MSSPSLVERR  ( cariomart_mss_0_MSS_MASTER_APB_PSLVERR ),
        .FABINT      ( interupt_generator_mux_0_interrupt ),
        // Outputs
        .UART_1_TXD  ( UART_1_TXD_net_0 ),
        .UART_0_TXD  ( UART_0_TXD_net_0 ),
        .MSSPADDR    ( cariomart_mss_0_MSS_MASTER_APB_PADDR ),
        .MSSPSEL     ( cariomart_mss_0_MSS_MASTER_APB_PSELx ),
        .MSSPENABLE  ( cariomart_mss_0_MSS_MASTER_APB_PENABLE ),
        .MSSPWRITE   ( cariomart_mss_0_MSS_MASTER_APB_PWRITE ),
        .MSSPWDATA   ( cariomart_mss_0_MSS_MASTER_APB_PWDATA ),
        .FAB_CLK     ( cariomart_mss_0_FAB_CLK ),
        .M2F_RESET_N ( cariomart_mss_0_M2F_RESET_N ) 
        );

//--------CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.1.100
CoreAPB3 #( 
        .APB_DWIDTH      ( 32 ),
        .APBSLOT0ENABLE  ( 1 ),
        .APBSLOT1ENABLE  ( 0 ),
        .APBSLOT2ENABLE  ( 0 ),
        .APBSLOT3ENABLE  ( 0 ),
        .APBSLOT4ENABLE  ( 0 ),
        .APBSLOT5ENABLE  ( 0 ),
        .APBSLOT6ENABLE  ( 0 ),
        .APBSLOT7ENABLE  ( 0 ),
        .APBSLOT8ENABLE  ( 0 ),
        .APBSLOT9ENABLE  ( 0 ),
        .APBSLOT10ENABLE ( 0 ),
        .APBSLOT11ENABLE ( 0 ),
        .APBSLOT12ENABLE ( 0 ),
        .APBSLOT13ENABLE ( 0 ),
        .APBSLOT14ENABLE ( 0 ),
        .APBSLOT15ENABLE ( 0 ),
        .FAMILY          ( 18 ),
        .IADDR_OPTION    ( 0 ),
        .MADDR_BITS      ( 12 ),
        .SC_0            ( 0 ),
        .SC_1            ( 0 ),
        .SC_2            ( 0 ),
        .SC_3            ( 0 ),
        .SC_4            ( 0 ),
        .SC_5            ( 0 ),
        .SC_6            ( 0 ),
        .SC_7            ( 0 ),
        .SC_8            ( 0 ),
        .SC_9            ( 0 ),
        .SC_10           ( 0 ),
        .SC_11           ( 0 ),
        .SC_12           ( 0 ),
        .SC_13           ( 0 ),
        .SC_14           ( 0 ),
        .SC_15           ( 0 ),
        .UPR_NIBBLE_POSN ( 2 ) )
CoreAPB3_0(
        // Inputs
        .PRESETN    ( GND_net ), // tied to 1'b0 from definition
        .PCLK       ( GND_net ), // tied to 1'b0 from definition
        .PADDR      ( cariomart_mss_0_MSS_MASTER_APB_PADDR_0 ),
        .PWRITE     ( cariomart_mss_0_MSS_MASTER_APB_PWRITE ),
        .PENABLE    ( cariomart_mss_0_MSS_MASTER_APB_PENABLE ),
        .PWDATA     ( cariomart_mss_0_MSS_MASTER_APB_PWDATA ),
        .PSEL       ( cariomart_mss_0_MSS_MASTER_APB_PSELx ),
        .PRDATAS0   ( CoreAPB3_0_APBmslave0_PRDATA ),
        .PREADYS0   ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERRS0  ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .PRDATAS1   ( PRDATAS1_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS1   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS1  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS2   ( PRDATAS2_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS2   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS2  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS3   ( PRDATAS3_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS3   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS3  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS4   ( PRDATAS4_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS4   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS4  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS5   ( PRDATAS5_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS5   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS5  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS6   ( PRDATAS6_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS6   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS6  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS7   ( PRDATAS7_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS7   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS7  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS8   ( PRDATAS8_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS8   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS8  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS9   ( PRDATAS9_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS9   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS9  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS10  ( PRDATAS10_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS10  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS10 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS11  ( PRDATAS11_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS11  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS11 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS12  ( PRDATAS12_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS12  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS12 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS13  ( PRDATAS13_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS13  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS13 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS14  ( PRDATAS14_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS14  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS14 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS15  ( PRDATAS15_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS15  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS15 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS16  ( PRDATAS16_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS16  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS16 ( GND_net ), // tied to 1'b0 from definition
        .IADDR      ( IADDR_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .PRDATA     ( cariomart_mss_0_MSS_MASTER_APB_PRDATA ),
        .PREADY     ( cariomart_mss_0_MSS_MASTER_APB_PREADY ),
        .PSLVERR    ( cariomart_mss_0_MSS_MASTER_APB_PSLVERR ),
        .PADDRS     ( CoreAPB3_0_APBmslave0_PADDR ),
        .PWRITES    ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PENABLES   ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PWDATAS    ( CoreAPB3_0_APBmslave0_PWDATA ),
        .PSELS0     ( CoreAPB3_0_APBmslave0_PSELx ),
        .PSELS1     (  ),
        .PSELS2     (  ),
        .PSELS3     (  ),
        .PSELS4     (  ),
        .PSELS5     (  ),
        .PSELS6     (  ),
        .PSELS7     (  ),
        .PSELS8     (  ),
        .PSELS9     (  ),
        .PSELS10    (  ),
        .PSELS11    (  ),
        .PSELS12    (  ),
        .PSELS13    (  ),
        .PSELS14    (  ),
        .PSELS15    (  ),
        .PSELS16    (  ) 
        );

//--------interupt_generator_mux
interupt_generator_mux interupt_generator_mux_0(
        // Inputs
        .PCLK      ( cariomart_mss_0_FAB_CLK ),
        .PRESERN   ( cariomart_mss_0_M2F_RESET_N ),
        .PSEL      ( CoreAPB3_0_APBmslave0_PSELx ),
        .PENABLE   ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PWRITE    ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PADDR     ( CoreAPB3_0_APBmslave0_PADDR ),
        .PWDATA    ( CoreAPB3_0_APBmslave0_PWDATA ),
        .button    ( button ),
        .source    ( source ),
        // Outputs
        .PREADY    ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERR   ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .PRDATA    ( CoreAPB3_0_APBmslave0_PRDATA ),
        .out0      ( out0_net_0 ),
        .out1      ( out1_net_0 ),
        .interrupt ( interupt_generator_mux_0_interrupt ),
        .debug_led ( debug_led_net_0 ) 
        );


endmodule
