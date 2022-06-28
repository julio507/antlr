grammar Amimir;

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
        AmimirLexer lexer = new AmimirLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        AmimirParser parser = new AmimirParser(tokens);

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
FUNC: 'func';
RANDOM: 'random';
PARSEINT: 'parseInt';

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
                System.out.println(".limit locals " + stackCounter );
                System.out.println(".limit stack " + stackCounter);
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
		| func
		| call
        | random
        | parseInt
	);

parseInt:
    PARSEINT OPEN_P factor CLOSE_P {
        System.out.println("    ;getstatic Lib;");
        System.out.println("    invokestatic Lib/parseInt(Ljava/lang/String;)I\n");
    };

random:
    RANDOM OPEN_P factor ',' factor CLOSE_P{
        System.out.println("    ;getstatic Lib;");
        System.out.println("    invokestatic Lib/random(II)I\n");
    };

call:
	NL CHARS OPEN_P CLOSE_P {
        System.out.println( "   goto FuncStart" + $CHARS.text );
        System.out.println( "FuncResume" + $CHARS.text + ":" );
    };

func:
	NL FUNC ' ' CHARS OPEN_P CLOSE_P OPEN_C {
        System.out.println( "   goto FuncEnd" + $CHARS.text );  
        System.out.println( "FuncStart" + $CHARS.text + ":" );
    } (statement)* CLOSE_C {
        System.out.println( "   goto FuncResume" + $CHARS.text );  
        System.out.println( "FuncEnd" + $CHARS.text + ":" );
    };

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
        final int w = whileCount++;
        System.out.println( "Wstart" + w + ":" ); 
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
            System.out.println( "   if_icmpne Wend" + w );
        }

        else if( $op.type == NOTEQUALS )
        {
            System.out.println( "   if_icmpeq Wend" + w );
        }

        else if( $op.type == MORETHAN )
        {
            System.out.println( "   if_icmple Wend" + w );
        }

        else if( $op.type == LESSTHAN )
        {
            System.out.println( "   if_icmpge Wend" + w );
        }

        else if( $op.type == MOREEQUALTHAN )
        {
            System.out.println( "   if_icmplt Wend" + w );
        }

        else if( $op.type == LESSEQUALTHAN )
        {
            System.out.println( "   if_icmpgt Wend" + w );
        }

    } CLOSE_P OPEN_C (statement)* CLOSE_C {
    System.out.println( "   goto Wstart" + w );  
    System.out.println( "Wend" + w + ":" );
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
        final int i = ifCount++;        

        if( $op.type == EQUALS )
        {
            System.out.println( "   if_icmpne Iend" + i );
        }

        else if( $op.type == NOTEQUALS )
        {
            System.out.println( "   if_icmpeq Iend" + i );
        }
        
        else if( $op.type == MORETHAN )
        {
            System.out.println( "   if_icmple Iend" + i );
        }

        else if( $op.type == LESSTHAN )
        {
            System.out.println( "   if_icmpge Iend" +i );
        }

        else if( $op.type == MOREEQUALTHAN )
        {
            System.out.println( "   if_icmplt Iend" + i );
        }

        else if( $op.type == LESSEQUALTHAN )
        {
            System.out.println( "   if_icmpgt Iend" + i );
        }
    } CLOSE_P OPEN_C (statement)* CLOSE_C {
        System.out.println( "Iend" + i + ":" );
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
    } CLOSE_P NL {
        System.out.println("    invokestatic Lib/playSound()V\n");
    };

input:
	INPUT {
        System.out.println("    ;getstatic Lib;");
        System.out.println("    invokestatic Lib/readInput()Ljava/lang/String;\n");
    } OPEN_P CLOSE_P;

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
    } ( expression | random | parseInt ) NL { 
        System.out.println("    istore "+s); 
        stackCounter++ ;
    }
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
    } (string | input) NL { 
        System.out.println("    astore "+s); 
        stackCounter++ ;
    };

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
