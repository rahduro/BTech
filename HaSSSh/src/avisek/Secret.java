package avisek;

import java.util.*;

public class Secret {

    String Secret_String;
    int no_AccStructure;
    int[][] AccessStruct;

    public Secret(String Scrt_input,int no_acc,int[][] acc_input)
    {
        Secret_String=Scrt_input;
        no_AccStructure=no_acc;
        AccessStruct=Arrays.copyOf(acc_input, no_acc);
    }
}
