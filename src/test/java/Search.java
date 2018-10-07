import java.io.IOException;
import com.itextpdf.awt.geom.Rectangle2D.Float;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.ImageRenderInfo;
import com.itextpdf.text.pdf.parser.PdfReaderContentParser;
import com.itextpdf.text.pdf.parser.RenderListener;
import com.itextpdf.text.pdf.parser.TextRenderInfo;

/**
 * @author 单继重
 * @since 2017/11/17 17:45
 */
public class Search {
    // 定义关键字
    private static String KEY_WORD = "王二蛋";
    // 定义返回值
    private static float[] resu = null;
    // 定义返回页码
    private static int i = 0;

    /*
     * 返回关键字所在的坐标和页数 float[0] >> X float[1] >> Y float[2] >> page
     */
    public float[] getKeyWords(String filePath)
    {
        try
        {
            PdfReader pdfReader = new PdfReader(filePath);
            int pageNum = pdfReader.getNumberOfPages();
            PdfReaderContentParser pdfReaderContentParser = new PdfReaderContentParser(
                    pdfReader);

            // 下标从1开始
            for (i = 1; i < pageNum; i++)
            {
                pdfReaderContentParser.processContent(i, new RenderListener()
                {

                    public void renderText(TextRenderInfo textRenderInfo)
                    {
                        String text = textRenderInfo.getText();
                        if (null != text && text.contains(KEY_WORD))
                        {
                            Float boundingRectange = textRenderInfo
                                    .getBaseline().getBoundingRectange();
                            resu = new float[3];
                            resu[0] = boundingRectange.x;
                            resu[1] = boundingRectange.y;
                            resu[2] = i;
                        }
                    }

                    public void renderImage(ImageRenderInfo arg0)
                    {
                        // TODO Auto-generated method stub

                    }

                    public void endTextBlock()
                    {
                        // TODO Auto-generated method stub

                    }

                    public void beginTextBlock()
                    {
                        // TODO Auto-generated method stub

                    }
                });
            }
        } catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return resu;
    }
}
