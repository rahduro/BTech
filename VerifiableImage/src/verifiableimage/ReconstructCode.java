package verifiableimage;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Random;
import javax.imageio.ImageIO;

public class ReconstructCode {

    public static int recon(File f[],String hash) throws IOException
    {
        BufferedImage b = ImageIO.read(f[0]);
        int k=f.length;
        int sharedb[][]=new int[f.length][b.getHeight()*b.getWidth()];
        int id[] = new int[k];
        int watShare[][] = new int[k][1];
        int encK = 0;

        for(int i=0;i<k;i++)
        {
            b = ImageIO.read(f[i]);
            b.getRGB(0, 0, b.getWidth(), b.getHeight(), sharedb[i], 0, b.getWidth());
            int mask  = (1<<24) -1;
            for(int j=0;j<sharedb[i].length;j++)
                sharedb[i][j] &= mask;
            mask = (1<<8) - 1;
            mask = mask<<16;
            id[i] = (sharedb[i][0]&mask)>>16;

            watShare[i][0] = sharedb[i][0]&((1<<16) - 1);
        }
        for(int i=0;i<k;i++)
            System.out.println(id[i]+" "+watShare[i][0]+" "+sharedb[i][0]);

        int answer[] = Shamir.join(id, INT2BIG(watShare), k, BigInteger.valueOf(10007));
        System.out.println(answer[0]);

        int watKey = answer[0];

        int enwaterMark[]=new int[k];
        ArrayList<Integer> cheater=new ArrayList<Integer>();

        System.out.println("size "+cheater.size());
        for(int i=0;i<k;i++)
        {
            enwaterMark[i]=getWatermark(watKey, sharedb[i]);
              
            if(!hash.equals(md5.md5Input(Integer.toString(enwaterMark[i]), 128)))
            {
                cheater.add(i);
            }            //ystem.out.println(encK);
        }

        if(cheater.size()!=0)
        {
            CheaterGUI chtform=new  CheaterGUI();
            chtform.setVisible(true);
            
            int arr[]=new int[cheater.size()];
            
            for(int i=0;i<cheater.size();i++)
            {
                arr[i]=cheater.get(i);
            }
            
            chtform.setdatas(f,arr);

            return 0;
        }
        else
        {
            encK = enwaterMark[0];

            for(int i=0;i<k;i++)
                for(int j=0;j<sharedb[i].length;j++)
                    sharedb[i][j] = (sharedb[i][j]>>1);

            int pic1[] = Shamir.join(id, INT2BIG(sharedb), k, BigInteger.valueOf(7996369));

            for(int i=0;i<100;i++)
            {
                System.out.print(pic1[i]+" ");
            }
            decrypt(pic1, encK);

            int pix[] = createImage(pic1);
            BufferedImage c = new BufferedImage(b.getWidth(), b.getHeight()/3, BufferedImage.TYPE_INT_RGB);
            c.setRGB(0, 0, c.getWidth(), c.getHeight(), pix, 0, c.getWidth());

            ImageIO.write(c, "BMP", new File("output.bmp"));

            return 1;
        }
        
    }
    public static BigInteger [][] INT2BIG(int [][]A)
    {
        BigInteger [][]b = new BigInteger[A.length][A[0].length];
        for(int i=0;i<A.length;i++)
            for(int j=0;j<A[0].length;j++)
            {
                b[i][j] = BigInteger.valueOf((long)A[i][j]);
            }                
        return b;
    }
    public static int getWatermark(int key,int []A)
    {
        int pixel,l = 0,range = A.length-2;
        Random r = new Random(key);
        
        for(int i=0;i<32;i++)
        {
            pixel = r.nextInt(range)+1;
            if((A[pixel]&1)==1)
            {
                l += (1<<i);
            }
        }
        System.out.println();
        return l;
    }
    public static void decrypt(int[] a,int key)
    {
        
        int mask;

        Random r=new Random(key);

        for(int i=0;i<a.length;i++)
        {
            mask=(r.nextInt(256));
            a[i] = a[i]^mask;
        }
    }
    public static int[] createImage(int []A)
    {
        int []n = new int[A.length/3];

        int k = 0;
        for(int i=0;i<n.length;i++)
        {
            n[i] = 0;
            n[i] = n[i]|A[k++];
            n[i] = n[i]|(A[k++]<<8);
            n[i] = n[i]|(A[k++]<<16);
        }
        return n;
    }
}
