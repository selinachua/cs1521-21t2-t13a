.text
main:
    li $t0, 1


.data
u: .space 4    # int u;
v: .word 42    # int v = 42;
w: .space 1    # char w;
x: .byte 'a'    # char x = 'a';
y: .space 8    # double y;
z: .space 80    # int z[20]; 

# int p[4] = {0, 1, 2, 3}
p: .word 0, 1, 2, 3