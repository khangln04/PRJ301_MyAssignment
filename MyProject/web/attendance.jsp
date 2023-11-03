<%-- 
    Document   : attendance
    Created on : Nov 3, 2023, 11:36:41 AM
    Author     : fpt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Student Attendance</title>
    </head>
    <body>
        ${requestScope.ses.group.name}-${requestScope.ses.group.subject.name}-${requestScope.ses.room.id}
        <form action="attendance" method="POST">
            <table border="1px">
                <tr>
                    <td>Student</td>
                    <td>Status</td>
                    <td>Description</td>
                    <td>Taking Time</td>
                </tr>
                <c:forEach items="${requestScope.atts}" var="a">
                    <tr>
                        <td>
                            ${a.student.name}
                            <input type="hidden" name="stuid" value="${a.student.id}"/>
                        </td>
                        <td>
                            <input type="radio"
                                   <c:if test="${!a.status}">
                                       checked="checked"
                                   </c:if>
                                   name="status${a.student.id}" value="absent" /> absent
                            <input type="radio"
                                   <c:if test="${a.status}">
                                       checked="checked"
                                   </c:if>
                                   name="status${a.student.id}" value="present" /> present
                        </td>
                        <td><input type="text" value="${a.description}" name="description${a.student.id}"/></td>
                        <td>${a.datetime}</td>
                    </tr>   
                </c:forEach>

            </table>
            <input type="hidden" value="${requestScope.ses.id}" name="sesid"/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
