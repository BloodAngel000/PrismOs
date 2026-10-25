#include <stdint.h>

void read_buffer(void);
void read_buffer(void)
{
        
}

void kernel_main(void) {

    volatile uint16_t* vga_buffer = (volatile uint16_t*) 0xB8000;
    
    const char* str = ">_ ";

    
    for (int i = 0; str[i] != '\0'; i++) {
        vga_buffer[i] = (uint16_t) str[i] | (0x0F << 8);
    }
}
