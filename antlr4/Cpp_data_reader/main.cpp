#include <iostream>
#include <vector>
#include <string>
#include "antlr4-runtime.h"
#include "generated_cpp/CUSTOMParser.h"
#include "generated_cpp/CUSTOMListener.h"
#include "generated_cpp/CUSTOMLexer.h"
#include "generated_cpp/CUSTOMBaseListener.h"

class Loader : public CUSTOMBaseListener {
public:
  std::vector<std::string> rows;
  virtual void exitField(CUSTOMParser::FieldContext *ctx) override { rows.push_back(ctx->TEXT()->getText());}

};


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

  std::cout << "Parser = " << tree->toStringTree(&parser) << std::endl;
    
  //CUSTOMBaseListener listener;
  Loader loader;
  //antlr4::tree::ParseTreeWalker::DEFAULT.walk(&listener, tree);
  antlr4::tree::ParseTreeWalker::DEFAULT.walk(&loader, tree);

   for (auto row : loader.rows) {
       std::cout << row << std::endl;
  }
  return 0;
}
