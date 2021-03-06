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
- ignore_comment
    - c++ code + flex + bison
    - If sharp (#) is found in the line, the following tokens are ignored until a new line
    - `make`
    - `./just_parse`
	```    
	Bison found an int: 90
	Bison found a float: 1.234
	Bison found a float: 23.4
	ignore iamcomment
	Bison found an int: 4
	Bison found an int: 5
	Bison found an int: 6
	ignore iamcomment
	Bison found a string: this
	Bison found a string: is
	Bison found a string: text
	ignore iamcomment
	Bison found an int: 111
	ignore iamcomment
	Bison found an int: 123
	ignore iamcomment
	ignore 456
	```
- block_identifier
    - Ref: http://fhoerni.free.fr/comp/bison_flex.html
    - c++ code + flex + bison
    - Can check begin/end/{/}
    - A sample input file:
	```
	procedure Validate {
			begin {
					DoThis
					Dothat
			}
			end {
					CleanUp
			}
	}
	```
    - `make`
    - `./just_parse`
	```    
	Procedure : Validate
		Part : begin
			Keyword : DoThis
			Keyword : Dothat
		Part : end
			Keyword : CleanUp
	```
- parse_input
    - Will read `input.dat`
    - Any comments which begin with `#` will be ignored
    - Data tokens/values within `sim_start` and `sim_end` are parsed
	```
	# Some comment here
        sim_start
           time_step = 1.0   # unit would be sec
           # distance_x = 11.3 # this will not be parsed
           distance_x = 10.0 # description of distance
           # Some comment here
           E = 200.e9 # comment - elastic modules
	sim_end
	# Last comment here
	```
	- `distance_x` will be parsed as 10.0, not 11.3
	- `make`
		- Note that `<vector>` and `<string>` are injected into parser.tab.h in the Make process in order to use STL
	- `./just_parse`
	```
	-
	time_step= 1
	distance_x= 10
	E= 2e+11
	```
    - Not sure at this moment why `-` is printed in the first line
    - Using STL - push_back() into values caused memory corruption?
    - Adjusted using C array of string, removing all STL
    ```
    $ make
    flex parser.l
    bison -d parser.y
    g++ -g -std=c++14 -o just_parse main.cpp lex.yy.c  parser.tab.c -lfl
    $ ./just_parse 
    time_step = 1.200000 
    distancexx = 13.100000 
    E_11 = 200000000000.000000 
    nu_23 = 0.300000 
    rho = 7700.000000 
    90g = 4.100000 
    ```    
