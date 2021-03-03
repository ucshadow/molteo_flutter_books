# Composed widgets

Most of the often used Widgets were overwritten using composition to facilitate easily changing
some implementation aspects in the whole app without changing each widget (where it was coded)
individually. As an example, if I want that all the text inside the app to start with a ~ from now
on, I can go into a_text and change line 16 to 

return Text(data ? "~" + data: """, textAlign: textAlign ?? TextAlign.left, style: style);

It takes some time to get used to using the new names but makes implementing changes to a group
of widgets of the same time in the app easy and convenient.