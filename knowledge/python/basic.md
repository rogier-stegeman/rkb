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
