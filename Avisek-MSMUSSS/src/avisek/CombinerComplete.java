/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package avisek;

import java.io.*;
import java.util.*;
import java.math.*;

/**
 *
 * @author Rahduro
 */
public class CombinerComplete {
    public int bit_prime;
    public int Secret_No;
    public int Access_No;
    public int Num_Access;
    public String Path;
    public String[] hashes;
    public int[] part_id;
    public int[] check;
    public SortedMap<Integer, Integer> id = new TreeMap<Integer, Integer>();
    public BigInteger M[][];
    public BigInteger U[];
    public BigInteger B[][];
    public BigInteger prime;
    public int str_len;
    public int Participant_No;
    public StringBuffer True_Secret;

    private static CombinerComplete inst = new CombinerComplete();

    public static CombinerComplete MakeComb()
    {
        return inst;
    }
    public void SetParams(int sn,int an,String inp)
    {
        Secret_No=sn;
        Access_No=an;
        Path=inp;
        try
        {
            File f = new File(Path);
            Scanner S = new Scanner(f);

            S.findInLine("Bits of Prime : ");
            bit_prime=S.nextInt();
            S.nextLine();

            S.findInLine("Prime Used : ");
            prime=S.nextBigInteger();
            S.nextLine();

            S.findInLine("Length of the Secret : ");
            str_len=S.nextInt();
            S.nextLine();

            S.findInLine("Number of Access Structure : ");
            Num_Access=S.nextInt();
            S.nextLine();
            S.nextLine();

            for(int i=1;i<Access_No;i++)
            {
                S.nextLine();
                S.nextLine();

                S.findInLine("Number of Participants in Access Structure :");
                int n = S.nextInt();

                S.nextLine();
                S.nextLine();
                S.nextLine();

                for(int j=0;j<n;j++)
                {
                    S.nextLine();
                    S.nextLine();
                    S.nextLine();
                    S.nextLine();
                }
                S.nextLine();
            }
            S.nextLine();
            S.nextLine();

            S.findInLine("Number of Participants in Access Structure :");
            Participant_No=S.nextInt();
            S.nextLine();
            part_id = new int[Participant_No];
            check = new int[Participant_No];
            U = new BigInteger[Participant_No];
            S.findInLine("Participants : ");

            for(int i=0;i<Participant_No;i++)
            {
                int temp=S.nextInt();
                id.put(temp, i);
                part_id[i]=temp;
                check[i]=0;

            }
            S.nextLine();
            S.nextLine();

            hashes = new String[Participant_No];
            M = new BigInteger[Participant_No][str_len];
            B = new BigInteger[Participant_No][str_len];
            for(int i=0;i<Participant_No;i++)
            {
                S.findInLine(":");
                hashes[i] = S.next();

                S.nextLine();
                S.nextLine();
                for(int j=0;j<str_len;j++)
                {
                    M[i][j]=S.nextBigInteger();
                }
                S.nextLine();
                S.nextLine();
            }
        }
        catch(Exception e)
        {
            System.out.println("IO Error : "+e);
        }
    }

    public void decrypt()
    {
        for(int i=0;i<Participant_No;i++)
        {
            for(int j=0;j<str_len;j++)
            {
                B[i][j] = M[i][j].add(U[i]);
            }
        }
        True_Secret = Shamir.join(part_id, B, Participant_No, prime);
        System.out.println(True_Secret);
    }
}
