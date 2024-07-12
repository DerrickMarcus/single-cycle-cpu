
module Control(
        input  [6 -1:0] OpCode   ,
        input  [6 -1:0] Funct    ,
        output [2 -1:0] PCSrc    ,
        output Branch            ,
        output RegWrite          ,
        output [2 -1:0] RegDst   ,
        output MemRead           ,
        output MemWrite          ,
        output [2 -1:0] MemtoReg ,
        output ALUSrc1           ,
        output ALUSrc2           ,
        output ExtOp             ,
        output LuOp              ,
        output [4 -1:0] ALUOp    ,
        // for question3:
        output RegWrite2

    );

    // Add your code below (for question 2 and question 3)

    // Your code below (for question 1)
    //
    //
    // PCSrc: 1-j,jal. 2-jr. 0-branch,else
    assign PCSrc[1:0] = (OpCode == 6'h02 || OpCode == 6'h03)? 1 : (OpCode == 6'h0 && Funct == 6'h08) ? 2 : 0;

    // branch: 1-beq. 0-else
    assign Branch = (OpCode == 6'h04) ? 1'b1 : 1'b0;

    // RegWrite: 0-sw,beq,j,jr. 1-else
    assign RegWrite = (OpCode == 6'h2b || OpCode == 6'h04 || OpCode == 6'h02 || (OpCode == 6'h0 && Funct == 6'h08)) ? 0 : 1;

    // RegDst: 0-lw,lui,addi,addiu,andi,slti,sltiu. 2-jal. 1-else
    assign RegDst = (OpCode == 6'h23 || OpCode == 6'h0f || OpCode == 6'h08 || OpCode == 6'h09 || OpCode == 6'h0c || OpCode == 6'h0a || OpCode == 6'h0b) ? 0 : (OpCode == 6'h03) ? 2 : 1;

    // MemRead: 1-lw. 0-else
    assign MemRead = (OpCode == 6'h23) ? 1 : 0;

    // MemWrite: 1-sw. 0-else
    assign MemWrite = (OpCode == 6'h2b) ? 1 : 0;

    // MemtoReg: 1-lw. 2-jal. 0-else
    assign MemtoReg = (OpCode == 6'h23) ? 1 : (OpCode == 6'h03 || (OpCode == 6'h00 && Funct == 6'h09)) ? 2 : 0;

    // ALUSrc1: 1-sll,srl,sra. 0-else
    assign ALUSrc1 = (OpCode == 6'h00 && (Funct == 6'h00 || Funct == 6'h02 || Funct == 6'h03)) ? 1 : 0;

    // ALUSrc2: 1-lw,sw,lui,addi,addiu,andi,slti,sltiu. 0-else
    assign ALUSrc2 = (OpCode == 6'h23 || OpCode == 6'h2b || OpCode == 6'h0f || OpCode == 6'h08 || OpCode == 6'h09 || OpCode == 6'h0c || OpCode == 6'h0a || OpCode == 6'h0b) ? 1 : 0;

    // ExtOp: 0-andi. 1-else
    assign ExtOp = (OpCode == 6'h0c) ? 0 : 1;

    // LuOp: 1-lui. 0-else
    assign LuOp = (OpCode == 6'h0f) ? 1 : 0;
    //
    //
    // Your code above (for question 1)

    // set ALUOp
    assign ALUOp[2:0] =
           (OpCode == 6'h00)? 3'b010:
           (OpCode == 6'h04)? 3'b001: //beq
           (OpCode == 6'h0c)? 3'b100: //andi
           (OpCode == 6'h0a || OpCode == 6'h0b)? 3'b101: //slti, sltiu
           (OpCode == 6'h1c && Funct == 6'h02)? 3'b110:	//mul
           3'b000;


    assign ALUOp[3] = OpCode[0];

    // question3:relu
    assign RegWrite2 = (OpCode == 6'h0 && Funct == 6'h2e) ? 1 : 0;

    // Add your code above (for question 2 and question 3)

endmodule
