////////
// 
//	top.v
//
//	Board Test Code
//	
//	Simple binary counter and test circuit
//
//	Chuck Pateros
//	University of San Diego
//	2022-08-18
//
////////


// look in upduino3.pcf for the mapping of signals to UPduino board pins
module top (
    input CLK,         // 12MHz clock provided by UPduino board
    output [3:0] DBG,  // LEDs installed into breadboard (active high)
    output [2:0] RGB   // RGB LED is built into UPduino board (active low)
);
 

    ////////
    // make a simple counter circuit 
    ////////

    // keep track of count
    reg [27:0] counter;

 
    // increment the counter every clock
    always @(posedge CLK) begin
        counter <= counter + 1;
        if (&counter[16:10])
        	RGB <= counter[23:21];
        else
        	RGB <= 3'b111;
    end

    // Use debug LEDs to show count
    assign DBG = counter[26:23];
    
endmodule

