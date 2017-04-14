<%--
  Created by IntelliJ IDEA.
  User: Lucas
  Date: 2017/3/27
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<body>
<form action='/file/upload' method='post' enctype='multipart/form-data'>
  <input type='file' name='file'>
  <input type="text" name="ordernumber">
  <input type="text" name="customerid">
  <input type='submit' value='Upload'>
</form>