<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>File Upload</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form method="POST" action="RequirementsUpload" enctype="multipart/form-data" >
            Upload File:
           <input type="file" name="file1" accept="image/*" />
           <br>
           Upload File:
           <input type="file" name="file2" accept="image/*" />
           <br>
           Upload File:
           <input type="file" name="file2" accept="image/*" />
           <br>
           Upload File:
           <input type="file" name="file2" accept="image/*" />
           <br>
           <input type="submit" value="Upload File" name="upload" id="upload" />
        </form>
    </body>
</html>