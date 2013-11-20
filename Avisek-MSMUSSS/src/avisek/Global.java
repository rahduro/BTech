package avisek;

import java.math.*;
import java.util.*;
import java.io.*;

public class Global {

    private static Global Glob1=new Global();

    public static Global MakeGlobal()
    {
        return Glob1;
    }    
    int no_participants;
    int no_secret;
    int Prime_Bit;
    String Database_Path;
    Secret[] scrt_arry;
    BigInteger prime;
    BigInteger x[];

    public void Set_Params(int bit,int no_par,int no_sec,String path)
    {
        prime=BigInteger.probablePrime(bit, new Random());
        no_participants=no_par;
        no_secret=no_sec;
        Prime_Bit=bit;

        scrt_arry=new Secret[no_sec];
        x=new BigInteger[no_par];
        Database_Path=path;
    }
    public void Assign_X(BigInteger[] x_input)
    {
        x=Arrays.copyOf(x_input, no_participants);
    }
    public static boolean isNumber(String num)
    {
        try
        {
          Integer.parseInt(num);
        }catch(NumberFormatException nfe) { return false; }
        return true;
    }
    
    public static boolean isBigInt(String num)
    {
       try
        {
            new BigInteger(num);
        }catch(NumberFormatException nfe) { return false; }
        return true;        
    }

    public static void Make_File(File n,String s,int p)
    {
        try
        {
            FileWriter f = new FileWriter(n);
            f.write("Secret "+p+" is :\n"+s);
            f.close();
        }
        catch(Exception e){}
    }
}
