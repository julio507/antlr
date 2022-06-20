grammar Exp;

@header {
    //import java.util.ArrayList;
    import java.util.HashMap;
    import java.util.Map;
}

@members {
    //private static ArrayList<String> symbol_table;
    private static Map<String, Integer> stack = new HashMap<String, Integer>();
    private static Map<String, Integer> types = new HashMap<String, Integer>();
    int stackCounter = 0;
    int whileCount = 0;
    int ifCount = 0;
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

BEGIN: 'begin';
END: 'end';
ATTRIB: '=';
VAR: 'a' ..'z';
PRINT: 'print';
QUOTE: '"';
CHARS: '"' ~["]* '"';
PLAY: 'play';
INPUT: 'input';
COLORLINE: 'colorL';
COLORBACKGROUND: 'colorB';
RESETSTYLE: 'reset';
GOTO: 'goto';
LABEL: 'label';

PLUS: '+';
MINUS: '-';
TIMES: '*';
OVER: '/';
REMAINDER: '%';
OPEN_C: '{';
CLOSE_C: '}';
OPEN_P: '(';
CLOSE_P: ')';

NUM: '0' ..'9'+;
NL: ('\r')? '\n';
SPACE: (' ' | '\t')+ { skip(); };

IF: 'if';
WHILE: 'while';

EQUALS: '==';
NOTEQUALS: '!=';
MORETHAN: '>';
LESSTHAN: '<';
MOREEQUALTHAN: '>=';
LESSEQUALTHAN: '<=';

program: main;

main:
	BEGIN {
                System.out.println(".source Test.j");
                System.out.println(".class  public Test");
                System.out.println(".super  java/lang/Object\n");
                System.out.println(".method public <init>()V");
                System.out.println("    aload_0");
                System.out.println("    invokenonvirtual java/lang/Object/<init>()V");
                System.out.println("    return");
                System.out.println(".end method\n");
                System.out.println(".method public static main([Ljava/lang/String;)V\n");
            } (statement)* END NL {
                System.out.println("    return");
                System.out.println(".limit locals 10");
                System.out.println(".limit stack 10");
                System.out.println(".end method");
            };

statement: (
		ifst
		| whilest
		| print
		| assignment
		| play
		| input
		| background
		| line
		| resetstyle
		| gotoest
        | label
	);

label:
    NL LABEL OPEN_P NUM CLOSE_P {
        System.out.println( "Label" + $NUM.text + ":" ); 
    };

gotoest:
	NL GOTO OPEN_P NUM CLOSE_P {
        System.out.println( "   goto Label" + $NUM.text );  
    };

whilest:
	{
        System.out.println( "Wstart" + whileCount + ":" ); 
    } NL WHILE OPEN_P term op = (
		EQUALS
		| NOTEQUALS
		| MORETHAN
		| LESSTHAN
		| MOREEQUALTHAN
		| LESSEQUALTHAN
	) term {
        if( $op.type == EQUALS )
        {
            System.out.println( "   if_icmpne Wend" + whileCount );
        }

        else if( $op.type == NOTEQUALS )
        {
            System.out.println( "   if_icmpeq Wend" + whileCount );
        }

        else if( $op.type == MORETHAN )
        {
            System.out.println( "   if_icmple Wend" + whileCount );
        }

        else if( $op.type == LESSTHAN )
        {
            System.out.println( "   if_icmpge Wend" + whileCount );
        }

        else if( $op.type == MOREEQUALTHAN )
        {
            System.out.println( "   if_icmplt Wend" + whileCount );
        }

        else if( $op.type == LESSEQUALTHAN )
        {
            System.out.println( "   if_icmpgt Wend" + whileCount );
        }

    } CLOSE_P NL OPEN_C (statement)* CLOSE_C {
    System.out.println( "   goto Wstart" + whileCount );  
    System.out.println( "Wend" + whileCount + ":" );
    whileCount++;
};

ifst:
	NL IF OPEN_P term op = (
		EQUALS
		| NOTEQUALS
		| MORETHAN
		| LESSTHAN
		| MOREEQUALTHAN
		| LESSEQUALTHAN
	) term { 
        if( $op.type == EQUALS )
        {
            System.out.println( "   if_icmpne Iend" + ifCount );
        }

        else if( $op.type == NOTEQUALS )
        {
            System.out.println( "   if_icmpeq Iend" + ifCount );
        }
        
        else if( $op.type == MORETHAN )
        {
            System.out.println( "   if_icmple Iend" + ifCount );
        }

        else if( $op.type == LESSTHAN )
        {
            System.out.println( "   if_icmpge Iend" +ifCount );
        }

        else if( $op.type == MOREEQUALTHAN )
        {
            System.out.println( "   if_icmplt Iend" + whileCount );
        }

        else if( $op.type == LESSEQUALTHAN )
        {
            System.out.println( "   if_icmpgt Iend" + whileCount );
        }
    } CLOSE_P NL OPEN_C (statement)* CLOSE_C {
        System.out.println( "Iend" + ifCount + ":" );
        ifCount++;        
    };

resetstyle:
	NL
	| RESETSTYLE {
        System.out.println("    ;getstatic Lib;");
        System.out.println("    invokestatic Lib/resetStyle()V\n");
    } OPEN_P CLOSE_P NL;

line:
	NL
	| COLORLINE OPEN_P {
        System.out.println("    ;getstatic Lib;");
    } factor CLOSE_P NL {
        System.out.println("    invokestatic Lib/colorLine(I)V\n");
    };

background:
	NL
	| COLORBACKGROUND OPEN_P {
        System.out.println("    ;getstatic Lib;");
    } factor CLOSE_P NL {
        System.out.println("    invokestatic Lib/colorBackground(I)V\n");
    };

play:
	NL
	| PLAY OPEN_P {
        System.out.println("    ;getstatic Lib;");
    } factor CLOSE_P NL {
        System.out.println("    invokestatic Lib/playSound()V\n");
    };

input:
	NL
	| INPUT {
        System.out.println("    ;getstatic Lib;");
        System.out.println("    invokestatic Lib/readInput()Ljava/lang/String;\n");
    } OPEN_P CLOSE_P NL;

print:
	NL
	| PRINT OPEN_P {   System.out.println("    getstatic java/lang/System/out Ljava/io/PrintStream;"); 
    } VAR CLOSE_P NL {  
        if( types.get($VAR.text) == 0)
        {
            System.out.println("    iload " + stack.get($VAR.text)); 
            System.out.println("    invokevirtual java/io/PrintStream/println(I)V\n");        
        }
        else
        {
            System.out.println("    aload " + stack.get($VAR.text)); 
            System.out.println("    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V\n"); 
        }
    }
	| PRINT OPEN_P {   System.out.println("    getstatic java/lang/System/out Ljava/io/PrintStream;"); 
		} expression CLOSE_P NL {   System.out.println("    invokevirtual java/io/PrintStream/println(I)V\n"); 
    }
	| PRINT OPEN_P {
        System.out.println("    getstatic java/lang/System/out Ljava/io/PrintStream;");
    } string CLOSE_P NL {
        System.out.println("    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V\n");
    };

assignment:
	NL
	| VAR ATTRIB {
        int s = stackCounter;
        
        if( stack.containsKey( $VAR.text ) )
        {
            s = stack.get( $VAR.text );
        }

        else
        {
            stack.put($VAR.text, stackCounter);
        }

        types.put( $VAR.text, 0 );
    } expression NL { System.out.println("    istore "+s); s++ ;}
	| VAR ATTRIB {
        int s = stackCounter;
        
        if( stack.containsKey( $VAR.text ) )
        {
            s = stack.get( $VAR.text );
        }

        else
        {
            stack.put($VAR.text, stackCounter);
        }

        types.put( $VAR.text, 1 );
    } (string | input) NL { System.out.println("    astore "+s); s++ ;};

expression:
	term (
		op = (PLUS | MINUS) term { System.out.println(($op.type == PLUS) ? "    iadd" : "    isub"); 
			}
	)*;

term:
	factor (
		op = (TIMES | OVER) factor { System.out.println(($op.type == TIMES) ? "    imul" : "    idiv"); 
			}
	)*;

factor:
	NUM { System.out.println("    ldc " + $NUM.text); }
	| VAR { 
        if( types.get($VAR.text) == 0)
        {
            System.out.println("    iload " + stack.get($VAR.text)); 
        }
        else
        {
            System.out.println("    aload " + stack.get($VAR.text)); 
        }
    }
	| OPEN_P expression CLOSE_P;

string:
	CHARS {
        System.out.println("    ldc " + $CHARS.text);
    };