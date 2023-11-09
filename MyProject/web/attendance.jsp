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
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            table thead tr{
                padding: 10px;
            }
            table thead tr th {
                padding: 10px;
            }
            table tbody tr {
                padding: 10px;
            }
            table tbody tr td {
                padding: 10px;
            }

        </style>
    </head>
    
    <body>
        <h1>Attendance Activity ${requestScope.ses.group.name}-${requestScope.ses.group.subject.name}-${requestScope.ses.room.id}</h1>
        <div class="container">
            <form action="attendance" method="POST">
                <table border="1px" style="width: -webkit-fill-available;margin: 3% 1%;">
                    <thead style="background-color: #6b90da;">
                        <tr>
                            <th>Student Name</th>
                            <th>Status</th>
                            <th>Description</th>
                            <th>Taking Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.atts}" var="a">
                            <tr>
                                <td>
                                    <a <a href="information?sid=${a.student.id}">${a.student.name}</a>
                                    <input type="hidden" name="stuid" value="${a.student.id}"/>
                                </td>
                                <td>
                                    <input type="radio"
                                           <c:if test="${!a.status}">
                                               checked="checked"
                                           </c:if>
                                           name="status${a.student.id}" value="absent" /> Absent
                                    <input type="radio"
                                           <c:if test="${a.status}">
                                               checked="checked"
                                           </c:if>
                                           name="status${a.student.id}" value="present" /> Present
                                </td>
                                <td><input type="text" value="${a.description}" name="description${a.student.id}"/></td>
                                <td>${a.datetime}</td>
                            </tr>   
                        </c:forEach>
                    </tbody>
                </table>
                <input type="hidden" value="${requestScope.ses.id}" name="sesid"/>
                <input style="display: flex; margin: 0 auto; margin-bottom: 1%" type="submit" value="Save"/>
                <form action="attendance" method="post"> ${mess}    </form>
                
            </form>
        </div>
        <a href="timetable?id=${1}"><button style="display: flex; margin: 0 auto; margin-bottom: 1%">Back to TimeTable</button></a>
        <a href="report?gname=${a.session.group.name}&subname=${a.session.group.subject.name}"><button style="display: flex; margin: 0 auto; margin-bottom: 1%">View attendance sheet in class</button></a>
    </body>
</html>
