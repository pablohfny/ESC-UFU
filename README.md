# ESC-UFU

Para utilizadores de Windows:
[Link para download do iverilog](https://bleyer.org/icarus/)

New-Alias -Name "iverilog" C:\iverilog\bin\iverilog.exe;
New-Alias -Name "vvp" C:\iverilog\bin\vvp.exe;
New-Alias -Name "gtkwave" C:\iverilog\gtkwave\bin\gtkwave.exe;

Para utilizadores de Mac:

brew install icarus-verilog

# Comandos

Para compilar o código:
```
iverilog -o <nome do arquivo de saída> <nome do arquivo de entrada>
```

Para executar o código:
```
vvp <nome do arquivo de saída>
```

Para visualizar o waveform:
```
gtkwave <nome do arquivo de saída>
```
