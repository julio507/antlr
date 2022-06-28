.source Test.j
.class  public Test
.super  java/lang/Object

.method public <init>()V
    aload_0
    invokenonvirtual java/lang/Object/<init>()V
    return
.end method

.method public static main([Ljava/lang/String;)V

    ldc 0
    istore 0
    ldc 1
    istore 1
    ldc 0
    istore 2
   goto FuncEnd"sorteiaNumero"
FuncStart"sorteiaNumero":
    ldc 0
    ldc 10
    ;getstatic Lib;
    invokestatic Lib/random(II)I

    istore 0
   goto FuncResume"sorteiaNumero"
FuncEnd"sorteiaNumero":
Wstart0:
    iload 1
    ldc 1
   if_icmpne Wend0
   goto FuncStart"sorteiaNumero"
FuncResume"sorteiaNumero":
    ldc 0
    istore 4
    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Pensei um numero de 1 a 10"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

Wstart1:
    iload 4
    ldc 0
   if_icmpne Wend1
    iload 2
    ldc 1
    iadd
    istore 2
    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Chuta um valor ai"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

    ;getstatic Lib;
    invokestatic Lib/readInput()Ljava/lang/String;

    astore 6
    aload 6
    ;getstatic Lib;
    invokestatic Lib/parseInt(Ljava/lang/String;)I

    istore 7
    iload 7
    iload 0
   if_icmpge Iend0
    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Chutou baixo"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

Iend0:
    iload 7
    iload 0
   if_icmple Iend1
    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Chutou alto"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

Iend1:
    iload 7
    iload 0
   if_icmpne Iend2
    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Acertou!"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Tentativas:"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    iload 2
    invokevirtual java/io/PrintStream/println(I)V

    ldc 1
    istore 4
Iend2:
   goto Wstart1
Wend1:
    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Para jogar novamente precione 1"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

    ;getstatic Lib;
    invokestatic Lib/readInput()Ljava/lang/String;

    astore 9
    aload 9
    ;getstatic Lib;
    invokestatic Lib/parseInt(Ljava/lang/String;)I

    istore 1
   goto Wstart0
Wend0:
    return
.limit locals 10
.limit stack 10
.end method
