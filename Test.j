.source Test.j
.class  public Test
.super  java/lang/Object

.method public <init>()V
    aload_0
    invokenonvirtual java/lang/Object/<init>()V
    return
.end method

.method public static main([Ljava/lang/String;)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Amimir!!"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

    ldc 1
    istore 0
    ldc 0
    istore 1
Wstart0:
    iload 0
    ldc 1
   if_icmpne Wend0
    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Escolha uma cor!! Digite um número de 1 a 7! Valores > 7 saem do Laço de repetição."
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

    ;getstatic Lib;
    invokestatic Lib/readInput()Ljava/lang/String;

    astore 2
    aload 2
    ;getstatic Lib;
    invokestatic Lib/parseInt(Ljava/lang/String;)I

    istore 3
    iload 3
    ldc 7
   if_icmple Iend0
    ldc 0
    istore 0
    ;getstatic Lib;
    invokestatic Lib/resetStyle()V

Iend0:
    iload 3
    ldc 1
   if_icmpne Iend1
    ;getstatic Lib;
    iload 3
    invokestatic Lib/colorLine(I)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Vermelho!"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

Iend1:
    iload 3
    ldc 2
   if_icmpne Iend2
    ;getstatic Lib;
    iload 3
    invokestatic Lib/colorLine(I)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Verde!"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

Iend2:
    iload 3
    ldc 3
   if_icmpne Iend3
    ;getstatic Lib;
    iload 3
    invokestatic Lib/colorLine(I)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Amarelo!"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

Iend3:
    iload 3
    ldc 4
   if_icmpne Iend4
    ;getstatic Lib;
    iload 3
    invokestatic Lib/colorLine(I)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Azul!"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

Iend4:
    iload 3
    ldc 5
   if_icmpne Iend5
    ;getstatic Lib;
    iload 3
    invokestatic Lib/colorLine(I)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Lilás!"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

Iend5:
    iload 3
    ldc 6
   if_icmpne Iend6
    ;getstatic Lib;
    iload 3
    invokestatic Lib/colorLine(I)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Ciano!"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

Iend6:
    iload 3
    ldc 7
   if_icmpne Iend7
    ;getstatic Lib;
    iload 3
    invokestatic Lib/colorLine(I)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Branco!"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

Iend7:
   goto Wstart0
Wend0:
    ;getstatic Lib;
    ldc 4
    invokestatic Lib/colorBackground(I)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Exemplo com fundo Azul!!!"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

    ;getstatic Lib;
    invokestatic Lib/resetStyle()V

    ldc 0
    istore 5
    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Laço de repetição 1 ao 5"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

Wstart1:
    iload 5
    ldc 5
   if_icmpge Wend1
    iload 5
    ldc 1
    iadd
    istore 5
    getstatic java/lang/System/out Ljava/io/PrintStream;
    iload 5
    invokevirtual java/io/PrintStream/println(I)V

   goto Wstart1
Wend1:
    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Conta: 8*6/4"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

    ldc 8
    istore 7
    ldc 6
    istore 8
    ldc 4
    istore 9
    iload 7
    iload 8
    imul
    iload 9
    idiv
    istore 10
    getstatic java/lang/System/out Ljava/io/PrintStream;
    iload 10
    invokevirtual java/io/PrintStream/println(I)V

    ;getstatic Lib;
    ldc 4
    invokestatic Lib/colorBackground(I)V

    ;getstatic Lib;
    ldc 6
    invokestatic Lib/colorLine(I)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Beeeeeeepppp"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

    ;getstatic Lib;
    invokestatic Lib/resetStyle()V

    ;getstatic Lib;
    invokestatic Lib/playSound()V

    return
.limit locals 11
.limit stack 11
.end method
