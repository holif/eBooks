package xyz.baal.util;

import com.alibaba.media.MediaConfiguration;
import com.alibaba.media.upload.UploadPolicy;
import com.alibaba.media.upload.UploadTokenClient;
import com.alibaba.media.upload.impl.DefaultUploadTokenClient;
/**
 * 生成上传凭证
 */
public class GetToken {
	public static String getTokens(){
		MediaConfiguration configuration = new MediaConfiguration();
		configuration.setAk("*********");//阿里百川AK
		configuration.setSk("*************************");//阿里百川SK
		configuration.setNamespace("ebooks");//百川空间名称
		
		UploadTokenClient tokenClient = new 
				DefaultUploadTokenClient(configuration);		
		UploadPolicy uploadPolicy = new UploadPolicy();
		uploadPolicy.setInsertOnly(UploadPolicy.INSERT_ONLY_NONE);
		uploadPolicy.setExpiration(System.currentTimeMillis() + 3600 * 3000);
		
		String token = tokenClient.getUploadToken(uploadPolicy);
		return token;
	}
}
