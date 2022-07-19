## Most Important Widgets

- ## App/Page Setup
    - MaterialApp / CupertinoApp
    - Scaffold / CupertinoPageScaffold
- ## Layout
    - Container
    - Row
    - Column
- ## Row/Column Children
    - Flexible (Row)
    - Expanded (Column)
- ## Content Containers
    - Stack
    - Card
- ## Repeat Elements
    - ListView
    - GridView
    - ListTile
- ## Content Types
    - Text
    - Image
    - Icon
- ## User Input
    - TextField
    - RaisedButton/FlatButton
    - GestureDetector / InkWell (meaning touch to the screen)

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

ListView is same with Column but it has `SingleChildScrollView` default property. Then it holds all
of the items list. In ListView, ListView.builder() builds widgets as required (i.e when they can be
seen) not holding more items list. So ListView.builder() gets more performance.

### keyboardType of TextField

```
// TextInputType.number not working in ios devices
keyboardType:
const TextInputType.numberWithOptions(decimal: true),

```

### Globally Defined Color Theme

```
In Material App main.dart, create theme property and ThemeDate() object
In ThemeData() object , create your desire colors

theme: ThemeData(
  primarySwatch: Colors.green,
  primary
)

when u wanna use this theme --> Theme.of(context).primaryColor

primarySwatch is automatically set up this color to all of the primary color,border,text,floatingAction as primary
Or if u wanna different primary color,primary border or primary text, 
use specific theme color like hoverColor,focusColor,secondaryColor
```

### Using Custom Fonts

```
u can create as your desire, this is an example of folder structure.
Create assets in main project folder, go to the pubspec.yaml file and 
configure font.
And then use as string u typed in pubspec.yaml file -> fontFamily: 'OpenSans'
```

### Using Customize Theme

```
In theme property of MaterialApp, u can customize all of cardTheme,textTheme,appBarTheme,chipTheme and so on.
After u customize themeData, use it --> Theme.of(context).textTheme.headline2 blah blah ...
```

### Using Image

``` 
Go to the pubspec.yaml file and configure your assets
```

### GestureDetector , Modal

`to detect the user's touching on the screen use GestureDetector --> use GestureDetector`

`when u wanna open modal if u clicked --> use showModalBottomSheet widget`

`when u wanna off modal --> use Navigator.of(context).pop()`

### DateTime && Intl(Internationalization)

You need to read about the dateTime. Go under the link and do legend.
[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)

For Intl , read under the link. There is DateFormat and Number Format. It may useful your upcoming
project.
[Intl](https://api.flutter.dev/flutter/intl/intl-library.html)

### Flexible Widget

A widget that controls how a child of a Row, Column, or Flex flexes. Using a Flexible widget gives a
child of a Row, Column, or Flex the flexibility to expand to fill the available space in the main
axis
(e.g., horizontally for a Row or vertically for a Column), but, unlike Expanded, Flexible does not
require the child to fill the available space.

### Expanded Widget

Using an Expanded widget makes a child of a Row, Column, or Flex expand to fill the available space
along the main axis
(e.g., horizontally for a Row or vertically for a Column).

### FittedBox Widget

It's look like js object-fit property. Scales and positions its child within itself according to
fit.

### ListTile Widget

A single fixed-height row that typically contains some text as well as a leading or trailing icon.

### FractionallySizedBox Widget

A widget that sizes its child to a fraction of the total available space.

### showModalBottomSheet keyboard issues solving blog

[Here](https://blog.sombex.com/2021/06/move-bottomsheet-along-with-keyboard-in-flutter.html)

#### Others --> Positioned, Alignment,
