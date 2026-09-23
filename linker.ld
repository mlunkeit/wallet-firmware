ENTRY(Reset_Handler)

MEMORY
{
    FLASH   (rx) : ORIGIN = 0x08000000, LENGTH = 384k /* Programmable part: read + execute */
    NVM     (r)  : ORIGIN = 0x08060000, LENGTH = 128k /* Non volatile memory: read only */
    RAM     (rw) : ORIGIN = 0x20000000, LENGTH = 128k /* Random access memory: read + write */
}

_estack = ORIGIN(RAM) + LENGTH(RAM);

SECTIONS
{
    .vector_table :
    {
        . = ALIGN(4);
        KEEP(*(.isr_vector))
        . = ALIGN(4);
    } > FLASH

    .text :
    {
        . = ALIGN(4);
        _stext = .;
        *(.text)
        *(.text*)
        *(.rodata)
        *(.rodata*)
        . = ALIGN(4);
        _etext = .;
    } > FLASH

    .idata : /* Initialized variables in Flash */
    {
        . = ALIGN(4);
        _sidata = .;
    } > FLASH

    .data : AT(_sidata)
    {
        . = ALIGN(4);
        _sdata = .;
        *(.data)
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    } > RAM

    .bss :
    {
        . = ALIGN(4);
        _sbss = .;
        *(.bss)
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
    } > RAM

    .key_storage :
    {
        . = ALIGN(4);
        _skeys = .;
        KEEP(*(.key_storage))
        . = ALIGN(4);
        _ekeys = .;
    } > NVM
}