# Steps
- antlr4 CSV2.g4 
- javac CSV2*.java
- grun CSV2 file -tree input.csv 
```
Warning: TestRig moved to org.antlr.v4.gui.TestRig; calling automatically
(file (hdr (row (field Name) , (field  occupation) , (field  id) , (field  factor) \n)) (row (field kim) , (field  scientist) , (field  0123 ) , (field  0.5) \n) (row (field jane) , (field  engineer ) , (field  494) , (field  0.12) \n) (row (field Shery) , (field  secretary ) , (field  102) , (field  0.35) \n) (row field \n))
```
- For java gui, use `grun CSV2 file -gui input.csv`
