## Reading simple data input and lexing
- antlr4 -Dlanguage=Cpp CUSTOM.g4 -o generated_cpp
- make
- ./a.exe input.model
``` 
tokens=[@0,9:9='\n',<2>,2:0]
tokens=[@1,10:18='time_step',<4>,3:0]
tokens=[@2,20:20='=',<6>,3:10]
tokens=[@3,22:24='1.0',<3>,3:12]
tokens=[@4,25:25='\n',<2>,3:15]
tokens=[@5,26:31='size_x',<4>,4:0]
tokens=[@6,33:33=':',<6>,4:7]
tokens=[@7,35:39='1000.',<3>,4:9]
tokens=[@8,40:40='\n',<2>,4:14]
tokens=[@9,63:63='\n',<2>,7:2]
tokens=[@10,100:105='size_y',<4>,9:0]
tokens=[@11,107:107='=',<6>,9:7]
tokens=[@12,109:113='111.2',<3>,9:9]
tokens=[@13,114:114='\n',<2>,9:14]
tokens=[@14,131:136='size_z',<4>,11:0]
tokens=[@15,137:137='=',<6>,11:6]
tokens=[@16,138:145='-1.376e5',<3>,11:7]
tokens=[@17,146:146='\n',<2>,11:15]
tokens=[@18,165:164='<EOF>',<-1>,13:0]
Parser = (file (hdr (row \n)) (row time_step = 1.0 \n) (row size_x : 1000. \n) (row \n) (row size_y = 111.2 \n) (row size_z = -1.376e5 \n))  
  
  
## Final results of parsing:
time_step = 1.0
size_x = 1000.
size_y = 111.2
size_z = -1.376e5
```
- Ref: https://riptutorial.com/Download/antlr.pdf
- Ref: http://ati.ttu.ee/~kjans/antlr/introduction_to_antlr4_presentation.pdf
- Ref: https://github.com/77027subbu/Antlr-JSON-CSV/blob/master/CSV/LoadCSV.java

- Basically  `antlr4::tree::ParseTreeWalker::DEFAULT.walk(&listener, tree);` does nothing as the generated CUSTOMBaseListener.h has nothing
```
 virtual void enterFile(CUSTOMParser::FileContext * /*ctx*/) override { }
```
- Edit such as:
```
 virtual void enterFile(CUSTOMParser::FileContext * /*ctx*/) override { 
    std::cout << "jeonb entering file " << std::endl;     }
```
- Then recompile (without generating. Run make), and re-run. Then you can see how walk() works.


## Comparsion to java code
```java
ExprParser parser = new ExprParser(tokens);
ParseTree tree = parser.file(); 
System.out.println(tree.toStringTree(parser));
```
```C++
CUSTOMParser parser(&tokens);
antlr4::tree::ParseTree *tree = parser.file();
std::cout << "Parser = " << tree->toStringTree(&parser)<< std::endl;
```
