## Reading simple data input and lexing
- antlr4 -Dlanguage=Cpp CUSTOM.g4 -o generated_cpp
- make
- ./a.exe input.model 
```
[@0,0:14='time_step = 1.0',<5>,1:0]
[@1,15:15='\n',<3>,1:15]
[@2,16:29='size_x = 1000.',<5>,2:0]
[@3,30:30='\n',<3>,2:14]
[@4,31:46='size_y = 1235.30',<5>,3:0]
[@5,47:47='\n',<3>,3:16]
[@6,48:63='size_z = 1.376e5',<5>,4:0]
[@7,64:64='\n',<3>,4:16]
[@8,65:64='<EOF>',<-1>,5:0]
(row (field time_step = 1.0) \n)
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
