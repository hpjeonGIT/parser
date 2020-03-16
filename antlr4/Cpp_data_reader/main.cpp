#include <iostream>
#include "antlr4-runtime.h"
#include "generated_cpp/CUSTOMParser.h"
#include "generated_cpp/CUSTOMListener.h"
#include "generated_cpp/CUSTOMLexer.h"
#include "generated_cpp/CUSTOMBaseListener.h"

int main(int argc, const char* argv[]) {
  std::ifstream stream;
  stream.open(argv[1]);
  antlr4::ANTLRInputStream input(stream);
  CUSTOMLexer lexer(&input);
  antlr4::CommonTokenStream tokens(&lexer);
  tokens.fill();
  for (auto token : tokens.getTokens()) {
    std::cout << "tokens=" <<  token->toString() << std::endl;
  }
    
  CUSTOMParser parser(&tokens);
  antlr4::tree::ParseTree *tree = parser.file();
  std::cout << "Parser = " << tree->toStringTree(&parser) 
            << std::endl;
  CUSTOMBaseListener listener;
  antlr4::tree::ParseTreeWalker::DEFAULT.walk(&listener, tree);

/*
  for (auto row : listener.rows()) {
    std::cout << row->toString() << std::endl;
  }
*/
  return 0;
}
