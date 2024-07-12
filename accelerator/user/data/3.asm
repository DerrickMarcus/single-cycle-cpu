    lw      $t0,    0($zero)
    lw      $t1,    4($zero)
    lw      $t2,    8($zero)
    lw      $t3,    12($zero)
    lw      $t4,    16($zero)
    lw      $t5,    20($zero)
    lw      $t6,    24($zero)
    lw      $t7,    28($zero)

    mac     $s0,    $t0,        $t4
    mac     $a0,    $t1,        $t5
    add     $s0,    $s0,        $a0

    mac     $s1,    $t0,        $t6
    mac     $a0,    $t1,        $t7
    add     $s1,    $s1,        $a0

    relu    $s1,    $s0

    mac     $s2,    $t2,        $t4
    mac     $a0,    $t3,        $t5
    add     $s2,    $s2,        $a0

    mac     $s3,    $t2,        $t6
    mac     $a0,    $t3,        $t7
    add     $s3,    $s3,        $a0

    relu    $s3,    $s2

    sw      $s0,    32($zero)
    sw      $s1,    36($zero)
    sw      $s2,    40($zero)
    sw      $s3,    44($zero)
END:
    j       END