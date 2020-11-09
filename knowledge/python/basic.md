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
>>> "This is, a text, as you can see!O O O O B I O O".rpartition("!")
("This is, a text, as you can see", "!", "O O O O B I O O")
```

Sort dictionary:
```python
>>> data = {'z': 'Lorem', 'x': 'ipsum', 'a': 'dolor'}
>>> sorted_data = {k: data[k] for k in sorted(data) }
{'a': 'dolor', 'x': 'ipsum', 'z': 'Lorem'}
```
