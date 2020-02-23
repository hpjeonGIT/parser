#include <iostream>
#include <strstream>
#include <string>
#include "antlr4-runtime.h"
#include "ExprLexer.h"
#include "ExprParser.h"

class MyParserErrorListener: public antlr4::BaseErrorListener {
  virtual void syntaxError(
      antlr4::Recognizer *recognizer,
      antlr4::Token *offendingSymbol,
      size_t line,
      size_t charPositionInLine,
      const std::string &msg,
      std::exception_ptr e) override {
    std::ostrstream s;
    s << "Line(" << line << ":" << charPositionInLine << ") Error(" << msg << ")";
    throw std::invalid_argument(s.str());
  }
};

int main(int argc, char *argv[]) {
  antlr4::ANTLRInputStream input(argv[1]);
  ExprLexer lexer(&input);
  antlr4::CommonTokenStream tokens(&lexer);

  MyParserErrorListener errorListner;

  tokens.fill();
  // Only if you want to list the tokens
  // for (auto token : tokens.getTokens()) {
  //  std::cout << token->toString() << std::endl;
  // }
  
  ExprParser parser(&tokens);
  parser.removeErrorListeners();
  parser.addErrorListener(&errorListner);
  try {
    antlr4::tree::ParseTree* tree = parser.main();
    std::cout << tree->toStringTree() << std::endl;
    return 0;
  } catch (std::invalid_argument &e) {
    std::cout << e.what() << std::endl;
    return 10;
  }
}
