Old-hat perhaps, but Grant Searle's "Simple Z80" in its 32k format is a great computer, reminding me very much
of my old Nascom-1 back in 1978. It has a true 'Retro' feel and is quick, easy and cheap to make using 
not-too-hard-to-find parts, and Jeff Tranter has kindly made his PCB available for it via Easyeda.

As designed, its a BASIC-only machine which is brilliant for playing Star Trek, but I always like to have 
raw access with a machine-code monitor - such as the T2 in my old Nascom and NAS-SYS in later models.

The RC2014 Mini/Micro is essentially a Grant Searle clone so this apples to those computers too.

The 8k BASIC has had a few redundant routines removed, such as cassette handling, keyboard and screen display, 
so its actually slightly smaller than its original 8k. In fact within the ROM, the interpreter finishes at 
address 1DB7 hex and 1DB8 to 1FFF are unused - leaving 584 ROM bytes free!

Within the confines of the 8k EEPROM there would be room for a modest monitor if I kept it simple. On the 
other hand it had to have all the essential commands to be of any genuine benefit - in fact its all worked out 
very nicely although it is an 'only just' fit!

The update is in three parts, first within the interrupt I/O driver the "Warm or Cold?" signon message has been 
extended to "Warm, Cold or Monitor?" and in the BASIC code, the command 'monitor' has been enabled. For the monitor 
itself I tried a different cross-assembler this time, AZ80, and I quite like it as it has no syntax peculiarities unlike some :-)
With the addition of an 'era typical' monitor, the 32k "Simple Z80" becomes a really handy little hobby computer 
with much more of a "Nascommy" feel, and it presents the opportunity to try a few machine-code routines, 
hand-coded or cross-assembled elsewhere. I've had great fun with mine, thank you Grant & Jeff!

A new 8k rom image suitable for the 27C64 EPROM or as in my case an AT28B64 EEPROM is posted on http://philg.uk in the 
'retro' section, along with a brief PDF document which details everything you see here plus a page on calling 
M/C routines from BASIC and passing parameters to & fro.
All thats necessary is to update the ROM and press reset!

Here's a slightly-out-of-date video, its been tidied since:

https://youtu.be/mvZ_L-rdgBQ

Cheers
Phil