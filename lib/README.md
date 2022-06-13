## Container Vs Column / Row

### Container
- Takes exactly one child widget
- Rich alignment & styling options
- Flexible width (e.g child width, available width, ...)
- `Perfect for custom styling & alignment`

### Column /Row
- Takes multiple (unlimited) child widgets
- Alignment but no styling options
- Always takes full available height (column) /width (row)
- Should use if widgets sit next to / above each other

### ListView
ListView is same with Column but it has `SingleChildScrollView` default property. 
Then it holds all of the items list.
In ListView, ListView.builder() builds widgets as required (i.e when they can be seen) not holding more items list.
So ListView.builder() gets more performance.

### keyboardType of TextField
```
// TextInputType.number not working in ios devices
keyboardType:
const TextInputType.numberWithOptions(decimal: true),

```