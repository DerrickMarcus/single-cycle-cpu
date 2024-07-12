
module ALUControl(
        input  [4 -1:0] ALUOp      ,
        input  [6 -1:0] Funct      ,
        output reg [5 -1:0] ALUCtl ,
        output Sign
    );

    // Add your code below (for question 2 and question 3)
    // funct number for different operation
    parameter aluAND = 5'b00000;
    parameter aluOR  = 5'b00001;
    parameter aluADD = 5'b00010;
    parameter aluSUB = 5'b00110;
    parameter aluSLT = 5'b00111;
    parameter aluNOR = 5'b01100;
    parameter aluXOR = 5'b01101;
    parameter aluSLL = 5'b10000;
    parameter aluSRL = 5'b11000;
    parameter aluSRA = 5'b11001;
    parameter aluMUL = 5'b11010; //mul
    // for question 2 and 3:
    parameter aluMAC = 5'b11011; //mac
    parameter aluRELU = 5'b11100; //relu

    // Sign means whether the ALU treats the input as a signed number or an unsigned number
    assign Sign = (ALUOp[2:0] == 3'b010)? ~Funct[0]: ~ALUOp[3];

    // set aluFunct
    reg [4:0] aluFunct;
    always @(*)
    case (Funct)
        6'b00_0000:
            aluFunct <= aluSLL; //sll
        6'b00_0010:
            aluFunct <= aluSRL; //srl
        6'b00_0011:
            aluFunct <= aluSRA; //sra
        6'b10_0000:
            aluFunct <= aluADD; //add
        6'b10_0001:
            aluFunct <= aluADD; //addu
        6'b10_0010:
            aluFunct <= aluSUB; //sub
        6'b10_0011:
            aluFunct <= aluSUB; //subu
        6'b10_0100:
            aluFunct <= aluAND; //and
        6'b10_0101:
            aluFunct <= aluOR; //or
        6'b10_0110:
            aluFunct <= aluXOR; //xor
        6'b10_0111:
            aluFunct <= aluNOR; //nor
        6'b10_1010:
            aluFunct <= aluSLT; //slt
        6'b10_1011:
            aluFunct <= aluSLT; //sltu
        // for question2: mac
        6'b10_1101:
            aluFunct <= aluMAC; //mac:0x2e
        // for question3: relu
        6'b10_1110:
            aluFunct <= aluRELU; //relu:0x2d
        default:
            aluFunct <= aluADD;
    endcase

    // set ALUCtrl
    always @(*)
    case (ALUOp[2:0])
        3'b000:
            ALUCtl <= aluADD;
        3'b001:
            ALUCtl <= aluSUB; //beq
        3'b100:
            ALUCtl <= aluAND; //andi
        3'b101:
            ALUCtl <= aluSLT; //slti, sltiu
        3'b010:
            ALUCtl <= aluFunct;
        3'b110:
            ALUCtl <= aluMUL; //mul
        default:
            ALUCtl <= aluADD;
    endcase
    // Add your code above (for question 2 and question 3)

endmodule
