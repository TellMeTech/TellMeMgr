

package com.hotel.common.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Properties;

/**
 * openstack访问配置文件各参数的获取
 * @author lq
 *
 */
public class OpenStackConfig {
	  //OpenStack及server配置文件路径
    private static final String ConfigPath = "openstack.properties";  
    private static OpenStackConfig instance=null;
    
    private String os_user=null;
    private String os_password=null; 
    private String os_tenant=null;
    private String os_url=null; 
    private String os_spiceServer=null; 
    
    private OpenStackConfig(){}
    
    public String getOs_spiceServer() {
		return os_spiceServer;
	}
      
    public String getOs_user() {
		return os_user;
	}

	public void setOs_user(String os_user) {
		this.os_user = os_user;
	}

	public String getOs_password() {
		return os_password;
	}

	public void setOs_password(String os_password) {
		this.os_password = os_password;
	}
	
	public String getOs_tenant(){
		return os_tenant;
	}
	
	public void setOs_tenant(String os_tenant){
		this.os_tenant = os_tenant;
	}

	public String getOs_url() {
		return os_url;
	}

	public void setOs_url(String os_url) {
		this.os_url = os_url;
	}

	public static OpenStackConfig getInstance(){
        if(instance==null){
            instance= new OpenStackConfig().getNewOSConfig();
        }
        return instance;
    }
    
    private OpenStackConfig getNewOSConfig(){
        
    	OpenStackConfig oc=new OpenStackConfig();
        Properties prop = new Properties();  
        String path=null;
        FileInputStream fis=null;
        
        try {
            path = OpenStackConfig.class.getClassLoader().getResource("").toURI().getPath();
            fis = new FileInputStream(new File(path + ConfigPath));
            prop.load(fis);
            oc.os_user=prop.getProperty("os_username"); 
            oc.os_password=prop.getProperty("os_password"); 
            oc.os_tenant=prop.getProperty("os_tenant");
            oc.os_url=prop.getProperty("os_url");  
            oc.os_spiceServer=prop.getProperty("spice_server");  
        } catch (URISyntaxException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }  
        
        return oc;
    }
}

