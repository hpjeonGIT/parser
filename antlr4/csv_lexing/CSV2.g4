grammar CSV2;

file: hdr row+ ;
hdr: row;

row: field(','field)* '\r'? '\n' ;

field
: TEXT
| ID
|
;

TEXT: ~[,\n\r"]+;
ID: DIGIT+;
FACTOR: DIGIT+'.'DIGIT*;
DIGIT:[0-0];
