grammar Exp;

/*---------------- COMPILER INTERNALS ----------------*/

@header
{
    //import java.util.ArrayList;
}

@members
{
    //private static ArrayList<String> symbol_table;

    public static void main(String[] args) throws Exception
    {
        ANTLRInputStream input = new ANTLRInputStream(System.in);
        ExpLexer lexer = new ExpLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        ExpParser parser = new ExpParser(tokens);

        //symbol_table = new ArrayList<String>();        
        parser.program();
        //System.out.println("symbols: " + symbol_table);
    }
}

/*---------------- LEXER RULES ----------------*/

PLUS      : '+' ;
MINUS     : '-' ;
TIMES     : '*' ;
OVER      : '/' ;
REMAINDER : '%' ;
OPEN_C    : '{' ;
CLOSE_C   : '}' ;
OPEN_P    : '(' ;
CLOSE_P   : ')' ;
ATTRIB    : '=' ;

FUNC      : 'func' ;
MAIN      : 'main' ;
PRINT     : 'print' ;

VAR     : 'a'..'z'+ ;
NUM     : '0'..'9'+ ;
NL      : ('\r')? '\n' ;
SPACE   : (' '|'\t')+ { skip(); } ;

IF      : 'if';

/*---------------- PARSER RULES ----------------*/

program
    :  main
    ;

main
    :  FUNC MAIN OPEN_P CLOSE_P OPEN_C
            {
                System.out.println(".source Test.j");
                System.out.println(".class  public Test");
                System.out.println(".super  java/lang/Object\n");
                System.out.println(".method public <init>()V");
                System.out.println("    aload_0");
                System.out.println("    invokenonvirtual java/lang/Object/<init>()V");
                System.out.println("    return");
                System.out.println(".end method\n");
                System.out.println(".method public static main([Ljava/lang/String;)V\n");
            }
        ( if_statement | statement )* CLOSE_C NL
            {
                System.out.println("    return");
                System.out.println(".limit stack 10");
                System.out.println(".end method");
            }
    ;

condition
    : term ATTRIB term
    ;

if_statement
    : IF OPEN_P condition CLOSE_P OPEN_C expression CLOSE_C
    ;

statement
    : NL | PRINT OPEN_P 
            {   System.out.println("    getstatic java/lang/System/out Ljava/io/PrintStream;");}
      expression CLOSE_P NL
            {   System.out.println("    invokevirtual java/io/PrintStream/println(I)V\n");  }
    ;

expression
    :   term ( op = ( PLUS | MINUS ) term 
            { System.out.println(($op.type == PLUS) ? "    iadd" : "    isub"); }
        )*
    ;

term    
    :   factor ( op = ( TIMES | OVER ) factor 
             { System.out.println(($op.type == TIMES) ? "    imul" : "    idiv"); }
        )*
    ;
    
factor
    :   NUM
        { System.out.println("    ldc " + $NUM.text); }
    |   OPEN_P expression CLOSE_P
    ;

