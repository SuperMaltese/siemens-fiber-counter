/**
 * Created by KevinGao on 7/14/17.
 */
import java.io.*;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
public class ImageAtomizer {
    public static void main(String args0[]) throws IOException{
//        File dir = new File("/Users/KevinGao/Desktop/background/4x4noise/");
//        File[] directoryListing = dir.listFiles();
//        if (directoryListing != null) {
//            for (File child : directoryListing) {
        File file = new File("/Users/KevinGao/Downloads/5x 50P CP12-1 9.bmp");
        BufferedImage im = ImageIO.read(file);

        int w = 4;
        int h = 4;
        int width = im.getWidth()-4;
        int height = im.getHeight()-4;
        int xStart = 4;
        int yStart = 4;

        int counter = 0;
                for (int j = 0; j < h; j++) {
                    for (int i = 0; i < w; i++) {
                        String s = file.getName();
                        BufferedImage br = im.getSubimage(xStart+(i * width / w),yStart+(j * height / h), width / w, height / h);
                        counter++;
                        s = s.substring(0,s.length()-5)+counter + "_b.png";
                        //ImageIO.write(br, "png", new File("/Users/KevinGao/Desktop/background/16x16noise/"+ s));
                        ImageIO.write(br, "png", new File("/Users/KevinGao/Desktop/preprocessed/"+ s));

                    }
                }
            }
        }

