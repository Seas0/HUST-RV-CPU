#include<stdint.h>
typedef union
{
    uint32_t _;
    struct {
        union {
            struct {
                uint8_t :1;
                uint8_t x : 7;
                uint8_t y : 7;
                uint8_t :1;
            };
            struct {
                uint8_t :1;
                uint16_t p : 14;
                uint8_t :1;
            };
        };
        uint16_t rgb555 : 15;
    };
}pixel;

void display(pixel p)
{
    asm volatile ( "addi\ta7,zero,35\n\t"
                    "mv\ta0, %0\n\t"
                    "ecall"
                    :
                    : "r"(p)
                    : "a0", "a7");
    return;
}

int main()
{
    pixel p = {.x=0,.y=0,.rgb555=0x7fff};
    for(p.p=0;p.p<128*128-1;++p.p)
            display(p);
}
