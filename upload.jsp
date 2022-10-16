<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,
                java.io.*"
%>


<%
    FileInputStream fis = null; //파일을 바이트 스트림으로 변경해줌
    BufferedInputStream bis = null; 
    BufferedOutputStream bos = null; //스트림을 여기에 쌓아둬서 효율적으로 불러올 수 있게 해준다.

    String path = "C:\\apache-tomcat-8.5.50-windows-x64\\apache-tomcat-8.5.50\\webapps\\ROOT\\upload\\";
    String org_filename = request.getParameter("org_filename"); 
    String real_filename = request.getParameter("real_filename");

    
    
    try{
        File fd = new File(path + real_filename);

        response.setHeader("Content-Type", "application/octect-stream");
        response.setHeader("Content-Disposition", "attachment; filename=" + org_filename);

        fis = new FileInputStream(fd); 
        bis = new BufferedInputStream(fis); 
        bos = new BufferedOutputStream(response.getOutputStream()); 

        byte[] buffer = new byte[1024];
        int i = 0;

        while((i=(bis.read(buffer))) != -1) {
            bos.write(buffer, 0, i);
        }
        bos.flush();
    } finally {
        if(fis != null) fis.close();
        if(bis != null) bis.close();
        if(bos != null) bos.close();
    }
    
%>