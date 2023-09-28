
.data
.balign 4
askConvert: .asciz "Convert fToC(1) or cToF(2): "
askNumber: .asciz "Enter temperature: "
scan_format: .asciz "%d"
input: .word 0
resultC: .asciz "Converted to: %d°C\n"
resultF: .asciz "Converted to: %d°F\n"

.text
.global main
.extern fToC
.extern cToF

main:
    LDR R0, =askConvert
    BL printf

    LDR R0, =scan_format
    LDR R1, =input
    BL scanf

    LDR R1, =input
    LDR R1, [R1]

    CMP R1, #1
    BEQ condition_1

    CMP R1, #2
    BEQ condition_2

    B end


condition_1:
    LDR R0, =askNumber
    BL printf

    LDR R0, =scan_format
    LDR R1, =input
    BL scanf

    LDR R1, =input
    LDR R1, [R1]

    MOV R0, R1
    BL fToC

    MOV R1, R0
    LDR R0, =resultC
    BL printf

    B end

condition_2:
    LDR R0, =askNumber
    BL printf

    LDR R0, =scan_format
    LDR R1, =input
    BL scanf

    LDR R1, =input
    LDR R1, [R1]
    MOV R0, R1
    BL cToF
    MOV R1, R0
    LDR R0, =resultF
    BL printf

    B end

end:
    MOV R0, #0
    MOV R7, #1
    SVC #0
