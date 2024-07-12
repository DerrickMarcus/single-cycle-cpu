清华大学2024春季学期课程《数字逻辑与处理器基础》大作业二：MIPS32指令集单周期处理器

主要任务：完成代码填空，运行简单的汇编代码；添加自造的新指令，完成神经网络加速单元设计。使用 Vivado 工具进行综合和静态时序分析。



文件结构如下：

```
.
|-- README.md
|-- accelerator				添加神经网络加速单元
|   |-- prj
|   `-- user
|       |-- data			约束文件和数据文件
|       |   |-- 2.asm
|       |   |-- 3.asm
|       |   |-- Data-q2-q3.txt
|       |   |-- Inst-q2.txt
|       |   |-- Inst-q3.txt
|       |   `-- xdc_for_both.xdc
|       |-- sim				仿真文件
|       |   `-- test_cpu.v
|       `-- src				源代码文件
|           |-- ALU.v
|           |-- ALUControl.v
|           |-- CPU.v
|           |-- Control.v
|           |-- DataMemory.v
|           |-- InstructionMemory.v
|           `-- RegisterFile.v
|-- report.pdf				实验报告
|-- single-cycle			单周期处理器
|   |-- prj
|   `-- user
|       |-- data			约束文件和数据文件
|       |   |-- 1-1.asm
|       |   |-- 1-2.asm
|       |   |-- Data-q1.txt
|       |   |-- Inst-q1-1.txt
|       |   |-- Inst-q1-2.txt
|       |   `-- xdc_for_both.xdc
|       |-- sim				仿真文件
|       |   `-- test_cpu.v
|       `-- src				源代码文件
|           |-- ALU.v
|           |-- ALUControl.v
|           |-- CPU.v
|           |-- Control.v
|           |-- DataMemory.v
|           |-- InstructionMemory.v
|           `-- RegisterFile.v
`-- 单周期处理器大作业_2024.pdf		实验指导书
```



**声明：仅供参考，请独立完成，禁止抄袭等学术不端行为**