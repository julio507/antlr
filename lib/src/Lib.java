import java.awt.Toolkit;

public class Lib {

    public static void main(String[] args) {
        playSound();
    }

    public static String readInput(){
        return System.console().readLine();
    }

    public static void playSound(){
        Toolkit.getDefaultToolkit().beep();
    }

    public static void colorLine(int color) {
        System.out.print("\u001B[" + ( color + 30 ) + "m" );
    }

    public static void colorBackground( int color ){
        System.out.print( "\u001B["+ ( color + 40 ) +"m" );
    }

    public static void resetStyle()
    {
        System.out.println( "\u001B[0m" );
    }
}
