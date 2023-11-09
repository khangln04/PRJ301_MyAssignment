<%-- 
    Document   : timetable
    Created on : Oct 22, 2023, 4:24:57 PM
    Author     : fpt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedular of Instructor</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            table thead tr{

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
        <h1>Time Table</h1>

        <form action="timetable" method="GET" style="text-align: center;">
            <input type="hidden" name="id" value="${param.id}"/>
            From <input type="date" value="${requestScope.from}" name="from"/> 
            To <input type="date" value="${requestScope.to}" name="to"/> 
            <input type="submit" value="View"/>
        </form>
        <table border="1px" style="width: -webkit-fill-available;margin: 3% 1%;">
            <thead style="background-color: #6b90da;">
                <tr>
                    <th style="text-align: inherit;">
                        From <input type="date" value="${requestScope.from}" name="from" disabled /><br>
                        To <input type="date" value="${requestScope.to}" name="to" disabled/> 
                    </th>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            ${d}
                        </td>
                    </c:forEach>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.slots}" var="s" varStatus="loop">
                    <tr>
                        <td>${s.id}-${s.description}</td>
                        <c:forEach items="${requestScope.dates}" var="d">
                            <td>
                                <c:forEach items="${requestScope.sessions}" var="k">
                                    <c:if test="${k.date eq d and k.slot.id eq s.id}">
                                        <a href="attendance?id=${k.id}">
                                            <font color="black">${k.group.name}-${k.group.subject.name}-${k.room.id}</font><br>
                                            <c:if test="${k.isAtt}"> <font color="green">(attended)</font>
                                            </c:if>
                                            <c:if test="${!k.isAtt}"> <font color="red">(not yet)</font>
                                            </c:if>
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div style="padding: 20px;" id="ghichu">
            <p>
                Các phòng bắt đầu bằng A thuộc tòa nhà Alpha. VD: A...<br>
                Các phòng bắt đầu bằng B thuộc tòa nhà Beta. VD: B,..<br>
                Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...<br>
                Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.<br>
                Các phòng bắt đầu bằng D thuộc tòa nhà Delta. VD: D,..<br>
                Little UK (LUK) thuộc tầng 5 tòa nhà Delta
            </p>
        </div>

    </body>
</html>

