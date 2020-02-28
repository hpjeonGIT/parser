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
ID: [0-9]+;
