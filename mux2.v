// Release date : 2016.06.19
// File         : Mux2 
// Project      : None
// For          : DICS summer Camp 2016
// Creator(s)   : Yang, Yu-Xiang (M10412034@yuntech.edu.tw)
// 
//
//
//  Description: 
//   parameter 2 to 1 Mux code 

module Mux2 #(parameter WIDTH = 32)(
    input  sel,
    input  [(WIDTH-1):0] in0, in1,
    output [(WIDTH-1):0] out
    );

    assign out = (sel) ? in1 : in0;

endmodule

