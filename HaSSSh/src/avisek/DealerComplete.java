/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package avisek;

import java.io.*;
import java.math.*;
import java.util.*;


public class DealerComplete{

    Global ref= Global.MakeGlobal();
    static final String dirSep = File.separator;
    String[][][] U = new String[ref.no_secret][][];
    BigInteger[][][][] B = new BigInteger[ref.no_secret][][][];

    public void create_secret_hash()throws IOException
    {
        String file_name=ref.Database_Path+dirSep+"Secret_Hashes.txt";

        FileWriter fout = new FileWriter(file_name);
        fout.write("Bits of Prime : "+ref.Prime_Bit+"\n");
        fout.write("Number of Secret : "+Integer.toString(ref.no_secret)+"\n");

        for(int i=0;i<ref.no_secret;i++)
            fout.write("Hash of Secret "+(i+1)+" : "+md5.md5Input(ref.scrt_arry[i].Secret_String, ref.Prime_Bit)+"\n");


        fout.close();
    }

    public void create_part_database() throws IOException
    {
        String file_name=ref.Database_Path+dirSep+"Participants_database.txt";

        FileWriter fout = new FileWriter(file_name);
        fout.write("Bits of Prime : "+ref.Prime_Bit+"\n");
        fout.write("Number of Secret : "+Integer.toString(ref.no_secret)+"\n");

        int max_l=-1;
        for(int i=0;i<ref.no_secret;i++)
        {
            if(max_l<ref.scrt_arry[i].no_AccStructure)
                max_l=ref.scrt_arry[i].no_AccStructure;
        }

        fout.write("Maximum no of access structure in a secret : "+max_l+"\n");
        fout.close();
    }

    public void create_secret(int n) throws IOException
    {
        String file_name=ref.Database_Path+dirSep+"Secret"+Integer.toString(n+1)+"_Database.txt";
        FileWriter fout = new FileWriter(file_name);
        fout.write("Bits of Prime : "+ref.Prime_Bit+"\n");
        fout.write("Prime Used : "+ref.prime+"\n");
        fout.write("Length of the Secret : "+ref.scrt_arry[n].Secret_String.length()+"\n");
        fout.write("Number of Access Structure : "+Integer.toString(ref.scrt_arry[n].no_AccStructure));
        for(int i=0;i<ref.scrt_arry[n].no_AccStructure;i++)
        {
            fout.write("\n\nAccess Structure "+(i+1)+":\n\n");
            fout.write("Number of Participants in Access Structure :"+ref.scrt_arry[n].AccessStruct[i].length+"\n");
            fout.write("Participants : ");
            for(int j=0;j<ref.scrt_arry[n].AccessStruct[i].length;j++)
            {
                fout.write(ref.scrt_arry[n].AccessStruct[i][j]+" ");
            }

            fout.write("\n");
            for(int j=0;j<ref.scrt_arry[n].AccessStruct[i].length;j++)
            {
                fout.write("\nHash of Participant with ID "+ref.scrt_arry[n].AccessStruct[i][j]+": "+md5.md5Input(U[n][i][j], ref.Prime_Bit)+"\n");
                fout.write("Message (B-U) :\n");
                BigInteger temp = new BigInteger(U[n][i][j],16);
                for(int k=0;k<ref.scrt_arry[n].Secret_String.length();k++)
                {
                    fout.write(B[n][i][j][k].subtract(temp)+" ");
                }
                fout.write("\n");
            }
        }
        fout.write("\n");
        fout.close();
    }
    public void U_CaLc()
    {
        int q,v,max_l=-1;

        q=(int)Math.ceil(Math.log(ref.no_secret)/Math.log(2));

        for(int i=0;i<ref.no_secret;i++)
        {
            if(max_l<ref.scrt_arry[i].no_AccStructure)
                max_l=ref.scrt_arry[i].no_AccStructure;
        }

        v=(int)Math.ceil(Math.log(max_l)/Math.log(2));

        for(int i=0;i<ref.no_secret;i++)
        {
           U[i]=new String[ref.scrt_arry[i].no_AccStructure][];

           for(int j=0;j<ref.scrt_arry[i].no_AccStructure;j++)
           {
               U[i][j]=new String[ref.scrt_arry[i].AccessStruct[j].length];
               for(int k=0;k<ref.scrt_arry[i].AccessStruct[j].length;k++)
               {
                   String temp = to_bin(ref.x[ref.scrt_arry[i].AccessStruct[j][k]-1],ref.Prime_Bit)+to_bin(i,q)+to_bin(j,v);
                   //System.out.println(temp);
                   U[i][j][k]= md5.md5Input(temp,ref.Prime_Bit);
               }
           }
        }
    }

    public String to_bin(int n,int bit)
    {
        String a=Integer.toBinaryString(n);
        String b="";
        for(int i=0;i<bit-a.length();i++)
        {
            b=b+"0";
        }
        b=b.concat(a);
        return b;
    }
    public String to_bin(BigInteger n,int bit)
    {
        String a=n.toString(2);
        String b="";
        for(int i=0;i<bit-a.length();i++)
        {
            b=b+"0";
        }
        b=b.concat(a);
        return b;
    }

    public void B_CaLc()
    {
        for(int i=0;i<ref.no_secret;i++)
        {
            B[i]=new BigInteger[ref.scrt_arry[i].no_AccStructure][][];
            for(int j=0;j<ref.scrt_arry[i].no_AccStructure;j++)
            {
                B[i][j]=Shamir.divide(ref.scrt_arry[i].AccessStruct[j],ref.scrt_arry[i].Secret_String,ref.scrt_arry[i].AccessStruct[j].length , ref.scrt_arry[i].AccessStruct[j].length, ref.prime);
            }
        }
    }
    public static void create_files()
    {
        try
        {
            DealerComplete d = new DealerComplete();
            d.U_CaLc();
            d.B_CaLc();
            d.create_secret_hash();
            d.create_part_database();
            for(int i=0;i<d.ref.no_secret;i++)
            {
                d.create_secret(i);
            }
        }catch(IOException e){System.out.println("IO Exception : "+e);}
    }
}
