package model;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

public class ScriptImage {

    public void copy(String source, String name) {
        String sourceFolderPath = source;
        String destinationFolderPath = "C:\\Users\\lambe\\git\\URLDiMunch\\src\\main\\webapp\\image";
        String imageName = name;

        try {
            File sourceFolder = new File(sourceFolderPath);
            File destinationFolder = new File(destinationFolderPath);

            if (!sourceFolder.isDirectory() || !destinationFolder.isDirectory()) {
                System.out.println("Source or destination folder is not valid.");
                return;
            }

            File sourceFile = new File(sourceFolder, imageName);
            if (!sourceFile.exists()) {
                System.out.println("Source file does not exist.");
                return;
            }

            Path sourcePath = sourceFile.toPath();
            Path destinationPath = new File(destinationFolder, imageName).toPath();

            Files.copy(sourcePath, destinationPath, StandardCopyOption.REPLACE_EXISTING);

            System.out.println("File copied successfully.");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}