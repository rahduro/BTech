package verifiableimage;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigInteger;
import java.util.Random;
import javax.imageio.ImageIO;

public class DivideCode {

    public static void divison(File f,int k,int n,int encpkey,int watkey,String path) throws IOException
    {
        BufferedImage b = ImageIO.read(f);

        int pix[]=new int[b.getHeight()*b.getWidth()];

        b.getRGB(0, 0, b.getWidth(), b.getHeight(), pix, 0, b.getWidth());

        System.out.println("picture read is done");
        int seq[] = new int[3*pix.length];

        int j = 0;
        for(int i=0;i<pix.length;i++)
        {
            int mask=(1<<8)-1;
            seq[j++] = pix[i]&mask;
            seq[j++] = (pix[i]&(mask<<8))>>8;
            seq[j++] = (pix[i]&(mask<<16))>>16;
        }
        for(int i=0;i<100;i++)
        {
            System.out.print(seq[i]+" ");
        }
        System.out.println();
        encrypt(seq,encpkey);

        for(int i=0;i<100;i++)
        {
            System.out.print(seq[i]+" ");
        }

        System.out.println();

        String hash = md5.md5Input(Integer.toString(encpkey), 128);

        FileWriter hashfile=new FileWriter("hash.txt");

        hashfile.write("Hash of Encryption Key : "+hash+"\n");

        hashfile.close();

        BigInteger prime= BigInteger.valueOf(7996369);

        System.out.println("secret is to be divided");
        int id[]=new int[n];
        for(int i=0;i<n;i++)
        {
            id[i]=i+1;
        }

        BigInteger  bigdb[][]=Shamir.divide(id, seq, k, n, prime);

        System.out.println("secret divided");

        int db[][]=new int[n][seq.length];

        for(int i=0;i<n;i++)
        {
            for(j=0;j<seq.length;j++)
            {
                db[i][j]=(bigdb[i][j].intValue())<<1;
            }
        }

        System.out.println("Array divided");

        embedWatermark(db,watkey, encpkey, (db[0].length-2));

        System.out.println("watermark embeded");
        int wat[]=new int[1];

        wat[0]=watkey;

        prime=BigInteger.valueOf(10007);

        BigInteger watdb[][]=Shamir.divide(id, wat, k, n, prime);

         for(int i=0;i<n;i++)
         {
             db[i][0]=((watdb[i][0].intValue())|(id[i]<<16));
             System.out.println(watdb[i][0].intValue() + " " + db[i][0]);
         }

        createShares(db, path, b.getWidth(), b.getHeight()*3);
    }
    public static void encrypt(int[] a,int key)
    {
        int mask;
        Random r=new Random(key);

        //mask = mask&(key%256);
        for(int i=0;i<a.length;i++)
        {
            mask=(r.nextInt(256));
            a[i] = a[i]^mask;
        }
    }

    public static void embedWatermark(int [][]mat,int watkey,int enkey,int range)
    {
        Random r = new Random(watkey);

        int bitarr[]=numtoarr(enkey);

        int strlen=32;

        for(int i=0;i<strlen;i++)
        {
            int num=r.nextInt(range)+1;

            for(int j=0;j<mat.length;j++)
            {
                if(bitarr[i]==1)
                {
                     mat[j][num]=mat[j][num]|1;
                     
                }
                else
                {
                    mat[j][num]=mat[j][num]|0;
                }
            }
        }


    }

    public static int[] numtoarr(int num)
    {
        int ans[]=new int[32];

        for(int i=0;i<32;i++)
        {
            if((num&(1<<i))==(1<<i))
                ans[i]=1;
            else
                ans[i]=0;
        }


        return ans;
    }


    public static void createShares(int db[][],String path,int w,int h)
    {

        for(int i=0;i<db.length;i++)
        {
            BufferedImage c=new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);
            c.setRGB(0, 0, w, h, db[i], 0, w);
            try
            {
            ImageIO.write(c, "BMP", new File(path+"\\Share"+Integer.toString(i+1)+".bmp"));
            }
            catch(Exception e)
            {
            }            
        }
    }
}
