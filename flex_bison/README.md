## Sample files for flex/bison
- Ref: https://www.joinc.co.kr/w/Site/Development/Env/Yacc
- Ref: https://cs.calvin.edu/courses/cs/214/adams/labs/02/
- https://aquamentus.com/flex_bison.html

## Folder description
- word_number
    - Using flex
    - `make`
    - `./word_number`
```
123
NUMBER

abc
WORD

abc123
WORD

123abc
NUMBER
WORD
```
    - ctrl+d to exit
- thermostat
    - Using flex + bison
    - `make`
    - `./thermo`
```
heat on
	Heat turned on
heat off
	Heat turned off
target temperature 100
	Temperature set 100
target any 10
error: syntax error
```
- calc
    - Using flex + bison
    - `make`
    - `./calc`
```
1-5
resut= -4
2*(1+2)
resut= 6
```
    - ctrl+d to exit

- read_txt
    - c++ code + flex only
    - `make`
    - `./just_read`
```
Found an integer:90
Found a floating-point number:23.4
Found an integer:4
Found an integer:5
Found an integer:6
Found a string: this
Found a string: is
Found a string: text
Found a string: comment
Found a string: here
```
- read_dat
    - c++ code + flex + bison
    - `make`
    - `./just_read`

