grammar CUSTOM;

file: hdr row+ ;
hdr: row;

//row: field('='field)* '\r'? '\n' ;
row: TEXT+WS* '='+ WS* VALUE '\r'? '\n' 
| TEXT+WS* '='+ WS* VALUE SHARP_COMMENT
| TEXT+WS* '='+ WS* VALUE LINE_COMMENT
| SHARP_COMMENT
| COMMENT+ANY* '\n'
| LINE_COMMENT
| '\n'
;

field
: TEXT
;



VALUE
: MIN? INT 
| MIN? INT+'.'INT* EXP?
| MIN? INT EXP
;

//TEXT: ~[,\n\r"]+;
TEXT: [a-zA-Z]+'_'*[a-zA-Z0-9]*;
MIN: '-';
fragment INT :   '0' | [1-9] [0-9]* ; // no leading zeros
fragment EXP :   [Ee] [+\-]? INT ; // \- since - means "range" inside [...]

WS: [ \t]+ -> skip ;
ANY: ~[\r\n] ;
COMMENT: '/*' .*? '*/'  -> skip ;
LINE_COMMENT : '//'+.*?'\r'?'\n' -> skip ;
SHARP_COMMENT : '#'+.*?'\r'?'\n' -> skip ;
