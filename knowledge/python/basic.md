Delete folder:
```python
import shutil
try:
    shutil.rmtree(path)
except FileNotFoundError:
    print("Folder not found")
```
