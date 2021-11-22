package br.edu.infnet.tp3.service;


import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
@Service
public class AmazonClientService {

    private AmazonS3 amazonS3;
    @Value("${aws.key}")
    private String key;

    @Value("${aws.secret}")
    private String secret;

    @Value("${aws.region}")
    private String region;

    @Value("${aws.bucketName}")
    private String bucketName;

    @PostConstruct
    private void initializeAmazon(){
        amazonS3 = AmazonS3ClientBuilder.standard()
                .withRegion(region)
                .withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(key,secret)))
                .build();
    }

    public void save(File file) {
        String fileName = file.getName();
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, fileName, file);
        amazonS3.putObject(putObjectRequest);
    }

    public void save(MultipartFile multipartFile) {
        try {
            File file = convert(multipartFile);
            save(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private File convert(MultipartFile multipartFile) throws IOException {
        File convFile = new File(multipartFile.getOriginalFilename());
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(multipartFile.getBytes());
        fos.close();
        return convFile;
    }

    public void delete(String fileName) {
        amazonS3.deleteObject(bucketName, fileName);
    }

    public File download(String fileName) throws IOException {
        // primeiro eu o arquivo da amazon em bytes
        S3Object object = amazonS3.getObject(bucketName, fileName);
        S3ObjectInputStream objectContent = object.getObjectContent();
        byte[] bytes = objectContent.readAllBytes();

        File file = File.createTempFile("temp", fileName);

        FileOutputStream fos = new FileOutputStream(file);
        fos.write(bytes);
        objectContent.close();
        fos.close();
        return file;

    }



}