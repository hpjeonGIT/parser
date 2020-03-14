grammar CUSTOM;

file: hdr row+ ;
hdr: row;

row: field('='field)* '\r'? '\n' ;

field
: TEXT
| VALUE
|
;

VALUE
: MIN? INT+'.'INT + EXP?
| MIN? INT EXP
| MIN? INT 
;

TEXT: ~[,\n\r"]+;
MIN: '-';
fragment INT :   '0' | [1-9] [0-9]* ; // no leading zeros
fragment EXP :   [Ee] [+\-]? INT ; // \- since - means "range" inside [...]
