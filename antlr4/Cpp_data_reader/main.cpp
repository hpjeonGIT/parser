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
  std::vector<std::string> texts, values;
  virtual void exitRow(CUSTOMParser::RowContext *ctx) override {
      auto t = ctx->TEXT();
      if (t.size() > 0) {
          texts.push_back(t[0]->getText());
      }
      auto v = ctx->VALUE();
      if (v) values.push_back(v->getText());
  }

};

/*
(gdb) ptype ctx
type = class CUSTOMParser::RowContext : public antlr4::ParserRuleContext {
  public:
    RowContext(antlr4::ParserRuleContext *, size_t);
    virtual size_t getRuleIndex(void) const;
    antlr4::tree::TerminalNode * VALUE(void);
Python Exception <class 'gdb.error'> No type named antlr4::tree::TerminalNode*.:
    std::vector<antlr4::tree::TerminalNode*, std::allocator<antlr4::tree::TerminalNode*> > TEXT(void);
    antlr4::tree::TerminalNode * TEXT(size_t);
    std::vector<antlr4::tree::TerminalNode*, std::allocator<antlr4::tree::TerminalNode*> > WS(void);
    antlr4::tree::TerminalNode * WS(size_t);
    antlr4::tree::TerminalNode * SHARP_COMMENT(void);
    antlr4::tree::TerminalNode * LINE_COMMENT(void);
    std::vector<antlr4::tree::TerminalNode*, std::allocator<antlr4::tree::TerminalNode*> > COMMENT(void);
    antlr4::tree::TerminalNode * COMMENT(size_t);
    std::vector<antlr4::tree::TerminalNode*, std::allocator<antlr4::tree::TerminalNode*> > ANY(void);
    antlr4::tree::TerminalNode * ANY(size_t);
    virtual void enterRule(antlr4::tree::ParseTreeListener *);
    virtual void exitRule(antlr4::tree::ParseTreeListener *);
} *
*/


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
  if (loader.texts.size() != loader.values.size()) {
      std::cout << "Something is wrong. Parsing pair not matching\n";
      throw;
  }
  std::cout << "\n\n## Final results of parsing:\n";
  for (size_t i=0; i < loader.texts.size(); i++) {
      std::cout << loader.texts[i] << " = " << loader.values[i] << std::endl;
  }
  return 0;
}
