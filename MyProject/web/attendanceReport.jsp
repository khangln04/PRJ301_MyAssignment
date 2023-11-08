<%-- 
    Document   : attendanceReport
    Created on : Nov 7, 2023, 3:27:55 AM
    Author     : fpt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Report</title>
<!--    <style>
            table {
                border-collapse: collapse; /* Loại bỏ khoảng cách giữa các đường kẻ */
                width: 100%; /* Đảm bảo bảng đầy đủ chiều rộng của container */
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
        </style>-->
    </head>
    <body>
        <h1>Attendance sheet of class ${param.gname} with subject ${param.subname}: </h1>
        <div class="row">
            <div class="col-md-12">
                <table style="width: 100%; border-collapse: collapse;margin-top: 5%; margin-bottom: 2%">
                    <thead style="background-color: orange;">
                        <tr>
                            <th>Student ID</th>
                            <th>Student Name</th>
                            <th>Absent Percent</th>
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
                                    ${s.name}
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${requestScope.absentPercentages[loop.index] > 20}">
                                            <font color="red">${requestScope.absentList[loop.index]}%</font>
                                        </c:when>
                                        <c:otherwise>
                                            ${requestScope.absentList[loop.index]}%
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <c:forEach items="${requestScope.attendances}" var="a">

                                        <c:if test="${a.session.date eq d and a.student.id eq s.id}">
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

                                    </c:forEach>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <form action="timetable">
            <input type="submit" value="Back to timetable">
        </form>
    </body>
</html>
