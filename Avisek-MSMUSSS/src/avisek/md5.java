package avisek;
import java.io.*;
import java.math.*;
import java.util.*;

public class md5 {

  private static long S11 = 7L;
  private static long S12 = 12L;
  private static long S13 = 17L;
  private static long S14 = 22L;
  private static long S21 = 5L;
  private static long S22 = 9L;
  private static long S23 = 14L;
  private static long S24 = 20L;
  private static long S31 = 4L;
  private static long S32 = 11L;
  private static long S33 = 16L;
  private static long S34 = 23L;
  private static long S41 = 6L;
  private static long S42 = 10L;
  private static long S43 = 15L;
  private static long S44 = 21L;

  private static char PAD[] = {128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			      0, 0, 0, 0, 0, 0, 0, 0, 0};

  long[] lngState = new long[4];


  private void transform(long x[])
  {
    long lngA = lngState[0];
    long lngB = lngState[1];
    long lngC = lngState[2];
    long lngD = lngState[3];

    /* Round 1 */
    lngA = ff (lngA, lngB, lngC, lngD, x[ 0], S11, 0xd76aa478L); /* 1 */
    lngD = ff (lngD, lngA, lngB, lngC, x[ 1], S12, 0xe8c7b756L); /* 2 */
    lngC = ff (lngC, lngD, lngA, lngB, x[ 2], S13, 0x242070dbL); /* 3 */
    lngB = ff (lngB, lngC, lngD, lngA, x[ 3], S14, 0xc1bdceeeL); /* 4 */
    lngA = ff (lngA, lngB, lngC, lngD, x[ 4], S11, 0xf57c0fafL); /* 5 */
    lngD = ff (lngD, lngA, lngB, lngC, x[ 5], S12, 0x4787c62aL); /* 6 */
    lngC = ff (lngC, lngD, lngA, lngB, x[ 6], S13, 0xa8304613L); /* 7 */
    lngB = ff (lngB, lngC, lngD, lngA, x[ 7], S14, 0xfd469501L); /* 8 */
    lngA = ff (lngA, lngB, lngC, lngD, x[ 8], S11, 0x698098d8L); /* 9 */
    lngD = ff (lngD, lngA, lngB, lngC, x[ 9], S12, 0x8b44f7afL); /* 10 */
    lngC = ff (lngC, lngD, lngA, lngB, x[10], S13, 0xffff5bb1L); /* 11 */
    lngB = ff (lngB, lngC, lngD, lngA, x[11], S14, 0x895cd7beL); /* 12 */
    lngA = ff (lngA, lngB, lngC, lngD, x[12], S11, 0x6b901122L); /* 13 */
    lngD = ff (lngD, lngA, lngB, lngC, x[13], S12, 0xfd987193L); /* 14 */
    lngC = ff (lngC, lngD, lngA, lngB, x[14], S13, 0xa679438eL); /* 15 */
    lngB = ff (lngB, lngC, lngD, lngA, x[15], S14, 0x49b40821L); /* 16 */

    /* Round 2 */
    lngA = gg (lngA, lngB, lngC, lngD, x[ 1], S21, 0xf61e2562L); /* 17 */
    lngD = gg (lngD, lngA, lngB, lngC, x[ 6], S22, 0xc040b340L); /* 18 */
    lngC = gg (lngC, lngD, lngA, lngB, x[11], S23, 0x265e5a51L); /* 19 */
    lngB = gg (lngB, lngC, lngD, lngA, x[ 0], S24, 0xe9b6c7aaL); /* 20 */
    lngA = gg (lngA, lngB, lngC, lngD, x[ 5], S21, 0xd62f105dL); /* 21 */
    lngD = gg (lngD, lngA, lngB, lngC, x[10], S22,  0x2441453L); /* 22 */
    lngC = gg (lngC, lngD, lngA, lngB, x[15], S23, 0xd8a1e681L); /* 23 */
    lngB = gg (lngB, lngC, lngD, lngA, x[ 4], S24, 0xe7d3fbc8L); /* 24 */
    lngA = gg (lngA, lngB, lngC, lngD, x[ 9], S21, 0x21e1cde6L); /* 25 */
    lngD = gg (lngD, lngA, lngB, lngC, x[14], S22, 0xc33707d6L); /* 26 */
    lngC = gg (lngC, lngD, lngA, lngB, x[ 3], S23, 0xf4d50d87L); /* 27 */
    lngB = gg (lngB, lngC, lngD, lngA, x[ 8], S24, 0x455a14edL); /* 28 */
    lngA = gg (lngA, lngB, lngC, lngD, x[13], S21, 0xa9e3e905L); /* 29 */
    lngD = gg (lngD, lngA, lngB, lngC, x[ 2], S22, 0xfcefa3f8L); /* 30 */
    lngC = gg (lngC, lngD, lngA, lngB, x[ 7], S23, 0x676f02d9L); /* 31 */
    lngB = gg (lngB, lngC, lngD, lngA, x[12], S24, 0x8d2a4c8aL); /* 32 */

    /* Round 3 */
    lngA = hh (lngA, lngB, lngC, lngD, x[ 5], S31, 0xfffa3942L); /* 33 */
    lngD = hh (lngD, lngA, lngB, lngC, x[ 8], S32, 0x8771f681L); /* 34 */
    lngC = hh (lngC, lngD, lngA, lngB, x[11], S33, 0x6d9d6122L); /* 35 */
    lngB = hh (lngB, lngC, lngD, lngA, x[14], S34, 0xfde5380cL); /* 36 */
    lngA = hh (lngA, lngB, lngC, lngD, x[ 1], S31, 0xa4beea44L); /* 37 */
    lngD = hh (lngD, lngA, lngB, lngC, x[ 4], S32, 0x4bdecfa9L); /* 38 */
    lngC = hh (lngC, lngD, lngA, lngB, x[ 7], S33, 0xf6bb4b60L); /* 39 */
    lngB = hh (lngB, lngC, lngD, lngA, x[10], S34, 0xbebfbc70L); /* 40 */
    lngA = hh (lngA, lngB, lngC, lngD, x[13], S31, 0x289b7ec6L); /* 41 */
    lngD = hh (lngD, lngA, lngB, lngC, x[ 0], S32, 0xeaa127faL); /* 42 */
    lngC = hh (lngC, lngD, lngA, lngB, x[ 3], S33, 0xd4ef3085L); /* 43 */
    lngB = hh (lngB, lngC, lngD, lngA, x[ 6], S34,  0x4881d05L); /* 44 */
    lngA = hh (lngA, lngB, lngC, lngD, x[ 9], S31, 0xd9d4d039L); /* 45 */
    lngD = hh (lngD, lngA, lngB, lngC, x[12], S32, 0xe6db99e5L); /* 46 */
    lngC = hh (lngC, lngD, lngA, lngB, x[15], S33, 0x1fa27cf8L); /* 47 */
    lngB = hh (lngB, lngC, lngD, lngA, x[ 2], S34, 0xc4ac5665L); /* 48 */

    /* Round 4 */
    lngA = ii (lngA, lngB, lngC, lngD, x[ 0], S41, 0xf4292244L); /* 49 */
    lngD = ii (lngD, lngA, lngB, lngC, x[ 7], S42, 0x432aff97L); /* 50 */
    lngC = ii (lngC, lngD, lngA, lngB, x[14], S43, 0xab9423a7L); /* 51 */
    lngB = ii (lngB, lngC, lngD, lngA, x[ 5], S44, 0xfc93a039L); /* 52 */
    lngA = ii (lngA, lngB, lngC, lngD, x[12], S41, 0x655b59c3L); /* 53 */
    lngD = ii (lngD, lngA, lngB, lngC, x[ 3], S42, 0x8f0ccc92L); /* 54 */
    lngC = ii (lngC, lngD, lngA, lngB, x[10], S43, 0xffeff47dL); /* 55 */
    lngB = ii (lngB, lngC, lngD, lngA, x[ 1], S44, 0x85845dd1L); /* 56 */
    lngA = ii (lngA, lngB, lngC, lngD, x[ 8], S41, 0x6fa87e4fL); /* 57 */
    lngD = ii (lngD, lngA, lngB, lngC, x[15], S42, 0xfe2ce6e0L); /* 58 */
    lngC = ii (lngC, lngD, lngA, lngB, x[ 6], S43, 0xa3014314L); /* 59 */
    lngB = ii (lngB, lngC, lngD, lngA, x[13], S44, 0x4e0811a1L); /* 60 */
    lngA = ii (lngA, lngB, lngC, lngD, x[ 4], S41, 0xf7537e82L); /* 61 */
    lngD = ii (lngD, lngA, lngB, lngC, x[11], S42, 0xbd3af235L); /* 62 */
    lngC = ii (lngC, lngD, lngA, lngB, x[ 2], S43, 0x2ad7d2bbL); /* 63 */
    lngB = ii (lngB, lngC, lngD, lngA, x[ 9], S44, 0xeb86d391L); /* 64 */

    lngState[0] = (lngState[0] + lngA) & 0xFFFFFFFFL;
    lngState[1] = (lngState[1] + lngB) & 0xFFFFFFFFL;
    lngState[2] = (lngState[2] + lngC) & 0xFFFFFFFFL;
    lngState[3] = (lngState[3] + lngD) & 0xFFFFFFFFL;

  }
  private static long ff(long lngA,
	 		long lngB,
			long lngC,
			long lngD,
			long lngX,
			long lngS,
			long lngAC)
  {
	lngA = (lngA + (lngB & lngC | (~lngB) & lngD) + lngX + lngAC) & 0xFFFFFFFFL;
	lngA = ((lngA << lngS) | (lngA >>> (32L-lngS))) & 0xFFFFFFFFL;
	lngA = (lngA + lngB) & 0xFFFFFFFFL;
	return(lngA);
  }
  private static long gg(long lngA,
	 		long lngB,
			long lngC,
			long lngD,
			long lngX,
			long lngS,
			long lngAC)
  {
	lngA = (lngA +  (lngB & lngD | lngC & ~lngD) + lngX + lngAC) & 0xFFFFFFFFL;
	lngA = ((lngA << lngS) | (lngA >>> (32L-lngS))) & 0xFFFFFFFFL;
	lngA = (lngA + lngB) & 0xFFFFFFFFL;
	return(lngA);
  }
  private static long hh(long lngA,
	 		long lngB,
			long lngC,
			long lngD,
			long lngX,
			long lngS,
			long lngAC)
  {
	lngA = (lngA + (lngB ^ lngC ^ lngD) + lngX + lngAC) & 0xFFFFFFFFL;
	lngA = ((lngA << lngS) | (lngA >>> (32L-lngS))) & 0xFFFFFFFFL;
	lngA = (lngA + lngB) & 0xFFFFFFFFL;
	return(lngA);
  }
  private static long ii(long lngA,
	 		long lngB,
			long lngC,
			long lngD,
			long lngX,
			long lngS,
			long lngAC)
  {
	lngA = (lngA + (lngC ^ (lngB | ~lngD)) + lngX + lngAC) & 0xFFFFFFFFL;
	lngA = ((lngA << lngS) | (lngA >>> (32L-lngS))) & 0xFFFFFFFFL;
	lngA = (lngA + lngB) & 0xFFFFFFFFL;
	return(lngA);
  }

 private void init()
  {
  	this.lngState[0] = 0x67452301L;
  	this.lngState[1] = 0xefcdab89L;
  	this.lngState[2] = 0x98badcfeL;
  	this.lngState[3] = 0x10325476L;
  }



 private StringBuffer perform(String Text)
 {
 
    char [] input = Text.toCharArray();
    ArrayList<Character> pad=new ArrayList<Character>();
    long[] x=new long[16];

    int lenbyts = Text.length();
    long lenbits = lenbyts*8;
    int rem = lenbyts%64;
    int padLen;
    if(rem<56)
    {
        padLen = 56 - rem;
    }
    else
    {
        padLen = 120 - rem;
    }

    for(int i=0;i<padLen;i++)
    {
        pad.add(PAD[i]);
    }
    pad.add( (char) (lenbits & 0xffL));
    pad.add( (char) ((lenbits >>> 8) & 0xffL));
    pad.add( (char) ((lenbits >>> 16) & 0xffL));
    pad.add( (char) ((lenbits >>> 24) & 0xffL));
    pad.add( (char) ((lenbits >>> 32) & 0xffL));
    pad.add( (char) ((lenbits >>> 40) & 0xffL));
    pad.add( (char) ((lenbits >>> 48) & 0xffL));
    pad.add( (char) ((lenbits >>> 56) & 0xffL));


    char[] temp =new char[pad.size()];

    for(int i=0;i<pad.size();i++)
        temp[i]=(char)pad.get(i);
    String ready = Text + String.copyValueOf(temp);
    init();
    for(int i=0;i<ready.length();i+=64)
    {
        int k=0;
        for(int j=i;j<i+64;j+=4)
        {
            x[k++]=ready.charAt(j) +
                       ready.charAt(j+1) * 256L +
                       ready.charAt(j+2) * 65536L +
                       ready.charAt(j+3) * 16777216L;
        }
        transform(x);

    }
    return toHexString();
}
private StringBuffer toHexString()
{
    long myByte = 0;
    StringBuffer mystring = new StringBuffer();
    for (int j = 0; j < 4; ++j)
    {
      for (int i = 0; i < 32; i += 8)
      {
         myByte = (this.lngState[j] >>> i) & 0xFFL;
         if (myByte < 16)
         {
           mystring.append("0" + Long.toHexString(myByte));
         }
         else
         {
           mystring.append(Long.toHexString(myByte));
         }
      }
    }
    return(mystring);
 }
public static String md5Input(String Text,int length)
{
    md5 ref=new md5();
    StringBuffer hash;
    String msg;
    hash=new StringBuffer("");
    msg=Text;
    
    for(int i=0;i<length/128;i++)
    {
        hash.append(ref.perform(msg));
        msg+=hash;
        
    }
    //System.out.println(hash.length());
    return hash.toString();

}
public static void main(String[] args)
{
 System.out.println(md5.md5Input("abcd" ,128));
}
}
