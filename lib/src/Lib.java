import java.awt.Toolkit;

public class Lib {

    public static void main(String[] args) {
        random(0, 10);
    }

    public static int random(int max, int min){
        return (int) Math.floor(Math.random() * (max - min + 1)) + min;
    }

    public static int parseInt(String s){
        return Integer.parseInt(s);
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
