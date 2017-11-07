# CP Commands

z/VM "Control Program" commands for use with Linux

# define storage

Use the `define storage` command to change the size of your virtual machines memory (internal storage).

    vmcp def stor 1G

This command may reset your virtual machine so should be issued when you have access to the virtual console or should be stack with an IPL command.


