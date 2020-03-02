# Python Efficiency

#### List comprehension:
<table>
<tr>
<td>

```python
# Instead of
my_list = []
for item in iterable:
    if item < 10:
        my_list.append(item)
```

</td>
<td>

```python
# Use
my_list = [item for item in iterable if item <20]
```

</td>
</tr>
</table>

#### Generator comprehension:
Works the same way as list comprehensions but with parantheses: 
```python
>>> text = open("bigdata.txt", "r")
>>> lines = (line for line in text if line.startswith("2020-01-01"))
<generator object <genexpr> at 0x10fe3d550>
```
