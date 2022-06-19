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
Wstart0:
    iload 0
    ldc 6
   if_icmpgt Wend0
    getstatic java/lang/System/out Ljava/io/PrintStream;
    iload 0
    invokevirtual java/io/PrintStream/println(I)V

    iload 0
    ldc 1
    iadd
    istore 0
    iload 0
    ldc 3
   if_icmplt Iend0
    ;getstatic Lib;
    ldc 1
    invokestatic Lib/colorBackground(I)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "deu"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "certo"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

    ;getstatic Lib;
    invokestatic Lib/resetStyle()V

Iend0:
   goto Wstart0
Wend0:
    ldc 10
    istore 0
Wstart1:
    iload 0
    ldc 6
   if_icmplt Wend1
    getstatic java/lang/System/out Ljava/io/PrintStream;
    iload 0
    invokevirtual java/io/PrintStream/println(I)V

    iload 0
    ldc 1
    isub
    istore 0
   goto Wstart1
Wend1:
    return
.limit locals 10
.limit stack 10
.end method
