<%-- 
    Document   : attendanceReport
    Created on : Nov 7, 2023, 3:27:55 AM
    Author     : fpt
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Report</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            table thead tr{
                padding: 10px;
                border: 1px solid black;
            }
            table thead tr th {
                padding: 10px;
                border: 1px solid black;
            }
            table tbody tr {
                padding: 10px;
                border: 1px solid black;
            }
            table tbody tr td {
                padding: 10px;
                border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <h1>${mess}</h1>
        <div class="row">
            <div class="col-md-12">
                <table style="width: 100%; border-collapse: collapse;margin-top: 5%; margin-bottom: 2%">
                    <thead style="background-color: #6b90da;">
                        <tr>
                            <th>Student ID</th>
                            <th>Student Name</th>
<!--                            <th>Absent Percent</th>-->
                                <c:forEach items="${requestScope.dates}" var="d">
                                <th>
                                    ${d}
                                </th>
                            </c:forEach>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.students}" var="s" varStatus="loop">
                            <tr>
                                <td>
                                    ${s.id}
                                </td>
                                <td>
                                    <a <a href="information?sid=${s.id}">${s.name}</a>
                                </td>
<!--                                <td>
                                    <c:choose>
                                        <c:when test="${requestScope.absentPercentages[loop.index] > 20}">
                                            <font color="red">${requestScope.absentList[loop.index]}%</font>
                                        </c:when>
                                        <c:otherwise>
                                            ${requestScope.absentList[loop.index]}%
                                        </c:otherwise>
                                    </c:choose>
                                </td>-->
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <c:forEach items="${requestScope.attendances}" var="a">

                                        <c:if test="${a.session.date eq d and a.student.id eq s.id}">
                                            <c:if test="${a.session.isAtt}">
                                                <c:if test="${a.status}">
                                                <td>
                                                    <font color="green">P</font>
                                                </td>
                                                </c:if>
                                                <c:if test="${!a.status}">
                                                <td>
                                                    <font color="red">A</font>
                                                </td>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${a.session.isAtt == null}">
                                                <td>
                                                    <font color="black"> </font>
                                                </td>   
                                            </c:if>
                                        </c:if>
                                                
                                    </c:forEach>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <p style="padding: 20px;" id="ghichu">
                    P is Present<br>
                    A is Absent
                </p>
            </div>
        </div>
        <a href="timetable?id=${1}"><button style="display: flex; margin: 0 auto; margin-bottom: 1%">Back to TimeTable</button></a>
    </body>
</html>
