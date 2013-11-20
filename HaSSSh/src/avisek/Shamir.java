package avisek;

import java.io.*;
import java.util.*;
import java.math.*;

public class Shamir {

    public static BigInteger[][] divide(int[] SecV,String SecS,int k,int n,BigInteger p)
    {
        int[] coeff = new int[k-1];
        Random R = new Random();
        BigInteger range = p.mod(BigInteger.valueOf(2147483647));
        for(int i=0;i<k-1;i++)
        {
            coeff[i]=R.nextInt(range.intValue());
            //System.out.println(coeff[i]);
        }


        BigInteger[][] share = new BigInteger[n][SecS.length()];
        for(int m=0;m<SecS.length();m++)
        {
            for(int i=0;i<n;i++)
            {
                BigInteger temp= BigInteger.valueOf(SecS.charAt(m));
                BigInteger x;
                for(int j=0;j<k-1;j++)
                {
                    x = BigInteger.valueOf(SecV[i]);
                    x = x.modPow(BigInteger.valueOf(j+1), p);
                    x = x.multiply(BigInteger.valueOf(coeff[j]));
                    x = x.mod(p);

                    temp=temp.add(x);
                }
                share[i][m]=temp.mod(p);
            }
        }
        return share;
    }
    public static StringBuffer join(int[] SecV,BigInteger[][] y,int k, BigInteger p)
    {
        int len=y[0].length; //getting the length of the string

        StringBuffer sec =new StringBuffer();

        for(int i=0;i<len;i++)
        {
            BigInteger B = BigInteger.ZERO;
            for(int j=0;j<k;j++)
            {
                BigInteger num = BigInteger.ONE,den = BigInteger.ONE;
                for(int l=0;l<k;l++)
                {
                    if(l!=j)
                    {
                        num=num.multiply(BigInteger.valueOf(SecV[l]));
                        den=den.multiply(BigInteger.valueOf(SecV[l]-SecV[j]));
                    }
                }
                num=num.mod(p);
                den=den.modInverse(p);
                num=num.multiply(den);
                num=num.multiply(y[j][i]);
                B=B.add(num);
            }
            B=B.mod(p);
            sec.append((char)B.intValue());
        }
        return sec;
    }
    public static void main(String[] args)
    {
        String s = "A Quick Brown Fox Jumps Over The Lazy Dog";
        int[] i = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};

        BigInteger p = BigInteger.probablePrime(1024, new Random());

        System.out.println(p);

        BigInteger[][] B = Shamir.divide(i,s,7,15,p);
        for(int m=0;m<3;m++)
        {
            for(int h=0;h<3;h++)
                System.out.print(B[m][h]+" ");
             System.out.println();
        }
        System.out.println(Shamir.join(i,B,7,p));
    }
}
