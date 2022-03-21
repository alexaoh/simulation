import java.io.*;


public class Main {

     public static int n=3000;
     public static double antics[] = new double[30000];
   
     public static void ini() { 
             for(int i=0;i<6000;i++)
             antics[i]=i;
     }
     
     public static double genrand() {
         double a,b;
         //Parametritzacio
         double j = 4;
         double k = 400;
         double m = 2147483647;
        
         a=antics[n-(int)j];
         b=antics[n-(int)k];
         
         antics[n]=((a*b)%m);
         
         n++;
         return antics[n-1]/m;
    }
    
    public static void main(String[] args) {
       ini();
       try
       {       
            File out=new File("fib_lagged_out.txt");
            FileWriter writer=new FileWriter(out,true);
            writer.write("");
            for(int i=0;i<200;i++) {
                writer.append(Double.toString(genrand()) + '\n');
            }
            writer.close();
        }
        catch(IOException e) 
        {
            System.out.println("Error al escribir");
        }
   }
} 
