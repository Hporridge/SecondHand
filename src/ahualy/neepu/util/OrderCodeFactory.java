package ahualy.neepu.util;

import java.util.UUID;

public class OrderCodeFactory {

    public static String getOrderIdByUUID(){
        String machineId = "E";

        int hashCodeV = UUID.randomUUID().toString().hashCode();

        if (hashCodeV < 0) {
            hashCodeV  = -hashCodeV;
        }
        return machineId + String.format("%08d",hashCodeV);
    }








}
