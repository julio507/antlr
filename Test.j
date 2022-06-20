.source Test.j
.class  public Test
.super  java/lang/Object

.method public <init>()V
    aload_0
    invokenonvirtual java/lang/Object/<init>()V
    return
.end method

.method public static main([Ljava/lang/String;)V

    ldc 1
    istore 0
    ;getstatic Lib;
    ldc 6
    invokestatic Lib/colorBackground(I)V

    getstatic java/lang/System/out Ljava/io/PrintStream;
    iload 0
    invokevirtual java/io/PrintStream/println(I)V

    ;getstatic Lib;
    invokestatic Lib/resetStyle()V

Wstart0:
    iload 0
    ldc 5
   if_icmpge Wend0
    iload 0
    ldc 1
    iadd
    istore 0
    getstatic java/lang/System/out Ljava/io/PrintStream;
    iload 0
    invokevirtual java/io/PrintStream/println(I)V

    ;getstatic Lib;
    iload 0
    invokestatic Lib/colorLine(I)V

   goto Wstart0
Wend0:
    ;getstatic Lib;
    invokestatic Lib/readInput()Ljava/lang/String;

    astore 0
    getstatic java/lang/System/out Ljava/io/PrintStream;
    aload 0
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

    return
.limit locals 10
.limit stack 10
.end method
