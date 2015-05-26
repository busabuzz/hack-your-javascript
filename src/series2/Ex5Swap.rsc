module series2::Ex5Swap

extend javascript::Syntax;

syntax Statement
  = "swap" Id "," Id ";"
  | "printIf" Expression ";"
  ;
  
Statement desugar((Statement)`swap <Id x>, <Id y>;`)
  = (Statement)`(function() { var tmp = <Id x>; <Id x> = <Id y>; <Id y> = tmp; })();`;
  
Statement desugar((Statement)`printIf <Expression e>;`)
  = (Statement)`{let tmp = <Expression e>; if (tmp) console.log(tmp); }`;
