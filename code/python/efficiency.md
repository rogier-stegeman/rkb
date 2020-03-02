<link href="style.css" rel="stylesheet"></link>
<style>
    .tableSubheader {
        background-color: lightgrey;
        font-weight: bold;
    }
</style>

# Python Efficiency

<table>
<th>Instead of</th>
<th>Use</th>
<tr class="tableSubheader">
    <td>List creation with append</td>
    <td>List Comprehension</td>
</tr>
<tr>
<td>

```python
my_list = []
for item in iterable:
    if item < 10:
        my_list.append(item)
```

</td>
<td>

```python
my_list = [item for item in iterable if item <20]
```

</td>
</tr>

<tr class="tableSubheader">
    <td>Reading file normally</td>
    <td>Generator Comprehension</td>
</tr>
<tr>
<td>

Works the same way as list comprehensions but with parantheses: 
```python
>>> text = open("bigdata.txt", "r")
>>> lines = (line for line in text if line.startswith("2020-01-01"))
<generator object <genexpr> at 0x10fe3d550>
```
</td>
<td>

Works the same way as list comprehensions but with parantheses: 
```python
>>> text = open("bigdata.txt", "r")
>>> lines = (line for line in text if line.startswith("2020-01-01"))
<generator object <genexpr> at 0x10fe3d550>
```
</td>
</tr>
</table>

