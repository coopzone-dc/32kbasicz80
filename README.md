These are few BASIC programs, as text, you can upload them by cut-n-past if needed.

Depending of your board etc, you may need to set a character delay of end of line delay in your terminal software.

There is an example machine code included. Read the note to help understand it:-

IMPORTANT NOTES

Integers in this version of BASIC are SIGNED - ie. -32768 to +32767. This includes memory locations when peek, poke, deek,doke commands are issued (etc.)
So, to refer to location "n" above 32767, you must provide the 2's compliment number instead (ie."n-65536") otherwise you will get an "?FC Error" message.


Have fun

