## Installing CUDA:
1. https://www.pytorials.com/how-to-install-tensorflow-gpu-with-cuda-10-0-for-python-on-ubuntu/
2. https://www.pytorials.com/install-tensorflow-using-official-pip-pacakage/

## Fix mouse wheel speed
https://askubuntu.com/a/621140
`sudo apt install imwheel`
`nano ~/.imwheelrc`
paste:
```
".*"
None,      Up,   Button4, #
None,      Down, Button5, #
Control_L, Up,   Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L,   Up,   Shift_L|Button4
Shift_L,   Down, Shift_L|Button5
```
Replace '#' with a multiplier value e.g. 3.
`killall imwheel && imwheel -b "4 5"` or `imwheel -b "4 5"`
Open Startup Applications and add `imwheel -b "4 5"`
`-b "4 5"` Means only the scroll wheel is affected and other buttons are left alone.