Assembler Documentation:
=======================================
Chapter 1: Getting Started
Chapter 2: quirks
Chapter 3: Using Imports
Chapter 4: Debugging

Getting Started:
=======================================

This assembler is capable of producing
machine code blobs and executing them 
from memory.

It keeps a syntax very close to MASM, but
it focuses on x64 bit instructions whenever
possible to avoid "byte ptr" and "qword ptr"
syntax extentions.

Tip: This assembler comes with an IR that 
converts MASM directly into runnable syntax
by removing most of their sugar.

Usage:

This binary comes with some built in flags and
I will be going over each one in depth.

-bytes:

This flag instructs the assembler to dump the 
bytes into a C type unsigned char, that can be 
embeded into another program.

This outputs the raw bytes and it also outputs
the size of the code.

-poly:

Poly uses my custom register shuffle to create
polymorphic shellcode stubs. 

Warning: This scrambles how registers are
interpreted and will destroy ABI.

This flag cannot be used reliably in huge
programs that need to follow any sort of ABI
rules, including passing in rcx, rdx... as 
parameters.

I prefer to use this for portions of routines
rather than writing entire programs.

-step:

Step is a command that is used for debugging, You
can head to chapter 4 to read more on this assemblers
built in debugging features.

This single steps your code.

Running It:

The syntax for running the assembler is as follows...

./assembler.exe <fileName> -flag

If no flag is passed in the assembler will just return
the result from youe code and print 8 bytes of whatver 
is returned in RAX.


Quirks:
=======================================

There are several quirks I need to go over that actually
seperate my assembler from most assemblers.

First off, r8 and r9 are swapped with r14 and r15. Meaning
my assembler actually doesnt not allow for r14 and r15 usage
and will swap them for there "twin". This may change over time.

Second, all allocation names must be a single letter. For example.

w db "hello",0
w dq 4096

It will not accept label names like "words".

Third, all jmp and call labels must be exactly 4 bytes long. 

loop: - good
woww: - good
wow: - bad
wo: - bad
them: - good

The 4th thing is all calls must go through RAX.

for example the assembler only accepts:

call rax - good
call rbx - bad

5th thing is the asm file must end with END...

You can use some of the test programs provided to get a feel 
for these "quirks".

Using Imports:
=======================================

The assembler accepts function names similar to how you provide
a label name for memory allocations.

For example:

w gf "Beep"
g gf "VirtualAlloc"

When this is done the label will have the function address stored
there at runtime. Meaning you can dereference w for example and 
get Beeps address inside a register.

lea rax, [w]
mov rax, [rax]

sub rsp, 32
call rax
add rsp, 32

Debugging:
=======================================

Now onto the debugging section... Normally asm
can be a real pain to debug because its all 
about knowing what values are in each register
at the given RIP.

The assembler includes a -step command exactly 
for this, enhancing your current workflow.

When -step is ran your code will be executed as
normal, but will actually step instruction by
instruction dumping the registers and fault
address for each instruction. This allows you
to pinpoint bugs with precision.

Catching Exceptions:

If your code does something crazy like this...

xor rax, rax
jmp rax

The assembler actually will catch the 0xC0000005
error and inform you like this.

Caught at address: 0000000000000000
RAX: 0000000000000000
RBX: 000001AACBA31400
RCX: 00007FF6DF32C7BC
RDX: 0000000000000000
RSI: 0000000000000000
RDI: 000001AACBA37CE0
RBP: 0000000000000000
RSP: 0000003B759BFDC8
R8 : 0000003B759BFD88
R9 : 0000000000000000
R10: 0000000000000000
R11: 0000000000000246
R12: 0000000000000000
R13: 0000000000000000
R14: 0000000000000000
R15: 0000000000000000
RIP: 0000000000000000
EFlags: 00010246

Giving native IDE features built right into
the assembler.
