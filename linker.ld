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

    .init :
    {
        . = ALIGN(4);
        KEEP(*(.init))
    } > FLASH

    .fini :
    {
        . = ALIGN(4);
        KEEP(*(.fini))
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

    .init_array :
    {
        . = ALIGN(4);
        PROVIDE_HIDDEN (__init_array_start = .);
        KEEP(*(SORT(.init_array.*)))
        KEEP(*(.init_array))
        PROVIDE_HIDDEN (__init_array_end = .);
        . = ALIGN(4);
    } > FLASH

    .fini_array :
    {
        . = ALIGN(4);
        PROVIDE_HIDDEN (__fini_array_start = .);
        KEEP(*(SORT(.fini_array.*)))
        KEEP(*(.fini_array))
        PROVIDE_HIDDEN (__fini_array_end = .);
        . = ALIGN(4);
    } > FLASH

    .data :
    {
        . = ALIGN(4);
        _sdata = .;
        *(.data)
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    } > RAM AT > FLASH

    _sidata = LOADADDR(.data);

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