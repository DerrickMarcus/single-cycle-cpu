INIT:
    addi    $a0,    $zero,  0   # a0 = 0
    addi    $a1,    $zero,  32  # a1 = 32
    addi    $s0,    $zero,  0   # s0 = 0
LOOP:
    lw      $t0,    0($a0)      # t0 = a0地址的值
    lw      $t1,    4($a0)      # t1 = a0地址+4的值
    mul     $t2,    $t0,    $t1 # t2 = t0 * t1
    add     $s0,    $s0,    $t2 # s0 = s0 + t2
    addi    $a0,    $a0,    8   # a0 = a0 + 8
    beq     $a0,    $a1,    L1  # if a0 == a1, goto L1
    j       LOOP
L1: 
    sw      $s0,    0($a1)      # a1地址的值 = s0
END:
    j       END