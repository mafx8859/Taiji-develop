import com.taiji.jilin.common.entity.Activity;
import com.taiji.jilin.common.util.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.junit.Test;

import java.io.*;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 单继重
 * @since 2017/11/23 13:58
*/

public class ExcelTest {

    @Test
    public void test () throws Exception {
        String fileName = "test.xls";
        String sheetName = "sheet1";

        List<Activity> activities = new ArrayList<Activity>();
        for (int i = 0 ; i < 10 ; i ++ ) {
            Activity activity = new Activity();
            activity.setName("名称");
            activity.setContent("内容");
            activity.setCertificate("证书");
            activity.setIsFinish(1);
            activity.setBudget("预算");
            activity.setId(123);
            activity.setOrganization("组织");
            activity.setPopulation(123456);
            activity.setProvideHotel("是");
            activity.setProvideMeal("餐饮");
            activity.setQq("QQ");
            activity.setTel("电话");
            activity.setTime("时间");
            activity.setStatus("啊啊啊");
            activities.add(activity);
        }
        HSSFWorkbook hssfWorkbook = ExcelUtil.getHSSFWorkbook(sheetName,activities);
        File file = new File("F:\\Shanjz" + fileName);
        OutputStream outputStream = null;
        try {
            outputStream = new FileOutputStream(file);
            hssfWorkbook.write(outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
