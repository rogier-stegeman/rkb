To add cell to VSCode Python file, type:
`#%%`

Delete folder:
```python
import shutil
try:
    shutil.rmtree(path)
except FileNotFoundError:
    print("Folder not found")
```

Split on last occurrence:
[.rpartition()](https://docs.python.org/3/library/stdtypes.html#str.rpartition)
```python
>>> "This is, a text, as you can see,O O O O B I O O".rpartition(",")
("This is, a text, as you can see", ",", "O O O O B I O O")
```
