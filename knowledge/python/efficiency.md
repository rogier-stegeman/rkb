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
my_list = [item for item in iterable if item <10]
```

</td>
</tr>
</table>

#### Dictionary comprehension:
<table>
<tr>
<td>

```python
# Instead of
my_dict = {}
for k, v in orgiginal_dict.items():
    if v < 10:
        my_dict[k] = v
```

</td>
<td>

```python
# Use
my_dict = {k: v for (k, v) in original_dict.items() if v < 10}
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
