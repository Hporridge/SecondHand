package ahualy.neepu.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016092100564393";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDbuPXS9QhIrorU0hazJB0Rvyo5j96YjmdmIHEddvRpk4Dngrup8ysgNwkKr6e/6WNvfjVPc2IpuCB/IRGW0C50iDDTNcNyzhQNlihaHHLZocQ2H+p5FY8oR+39Hoe5OwNsIm8D4lvSNd4D3rHoMXvOwP202kj0riyWKZl/2H+sjeXtsdUfSkFJ9J/W48TRwwnpsLAhUREqkT23QOKWytJqhH+bqYLCNd2u5qN0aAaLZPlNpJCaOMjMLfljKqgglMCkBkSAWO8ymYbNC8U/8FHVl2cg5/DCjgJK6QLJf4n0yn/GIkPMj/CzcgnBQ+NHIbXt4nrGoa6Ial6CnH+zg3FlAgMBAAECggEBAIaNRJR0EyeXI1NieB4pvldwzmXDkZewlOc4dKyLfO7uMiETsOJJFB69NR9DJCHkxUywZ+sIiJNtuxC+6muFfv1DrUqaAN9cDXGog3tzMm3Nnz9Z2hdeOXV8XuQDfy/SUK02hO9G/d3DuPp7tEyxiNS64GKQzd5wjsNCJErjBIRgmjHcNqudnlp9w+sLKBADyfiaohTNtKA2SpTPi72FmwRaERjnb54TNZAmvhmfsrHQIN+f3aDzR/W2NrO7tezvUzCENOS2Jh2lFFZK23B47TG1OtLvl9qbeIP9efPbjiyEJc+smCEPq4kneUgeHUdIEQllKjrQZaar1rorRXKQHP0CgYEA922SL+QYjcn7OTzZD0aah7Wz5fmFbh1tFVfk2o7lVgskiW/KcOdaZErLuyNTTesT1i10KtprFP52XDrPFzbwxPVW38wn6rON77yUcUK8vKuh8EiNMk+7L3ikz+zR4AKJ+P8tjSLPK9HcDQNxZWwHTLmVP2ybOPAVTphbmj44v38CgYEA41Wrj5Hn1B7OK0r+0YN0H3T230XY6I/A/o1wZtaf2571RgItGsNITHTffMmAQ/yege9uZc7M9oaZWAmTz16h4jtkcKH60W3SQFK6Tp2zySWhnjbG7FYVwwMDXxPiMWfk37liuTD4zY0UYVZuqTkFtBAWh5w4Zv5Z/YzrRrkYQRsCgYAkcKq7Cuji2QB66Y8+RLO1kPkxwZH5KbRLFGrMFYeJKJL0+tXh0vDpHGrs4MMAEsMVJBSbyxdCPEfKRY8CaEEFgOyOgU7PrioVSLzEAYQydUSgUs8Yvc1frHD5fnNafoU7ermGs723Qm0aLYuh2Esq7ZohgSlLNXCt5pp3GPramQKBgFrslOWjUbnBaGxgXnKlxPgf6+15HjxF4sbtAxvek6lfdnI9xJSDrpMF260pWqfWjf8iKGGHyOqBAyv3CKtUCiNV5eI2pv7EkecwL1vqL1IwPufsuLsl4yZQOjT42usvxpbEqvuu3pQ37QLRcwkzyVgvZxNuJBDtgkiq6B8tQMopAoGAQqHbQv1Vm8WXu+5rcZX2l1uH0BcCcBZT+D7MBHJ2ZIj9zJo6TUCYmWpXu4HxecKaCL1Tdj0Ovn4PN2MEHLLJfoAdYa3wraxEQwskJaLGskva2+v6U2Qw2+A2Bo6oFPtpVIdmjTnCIIcKUZVvy53Fu5JicTztgGzPWhlC2ixrKc8=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIgHnOn7LLILlKETd6BFRJ0GqgS2Y3mn1wMQmyh9zEyWlz5p1zrahRahbXAfCfSqshSNfqOmAQzSHRVjCqjsAw1jyqrXaPdKBmr90DIpIxmIyKXv4GGAkPyJ/6FTFY99uhpiq0qadD/uSzQsefWo0aTvP/65zi3eof7TcZ32oWpwIDAQAB";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}