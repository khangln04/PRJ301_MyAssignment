/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import model.Attendance;
import model.Student;

/**
 *
 * @author fpt
 */
public class AttendanceReportController  extends  HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String gname = req.getParameter("gname");
        String subname = req.getParameter("subname");
        if(gname!=null||subname!=null){
            SessionDBContext sessdbc = new SessionDBContext();
            ArrayList<Date> dates  = sessdbc.getSesdateByGnameAndSubname(gname, subname);
            
            AttendanceDBContext adbc = new AttendanceDBContext();
            ArrayList<Attendance> attendances = adbc.getAttendanceByGnameAndSubname(gname, subname);
            
            StudentDBContext studbc = new StudentDBContext();
            ArrayList<Student> students = studbc.getAllStudentByGnameAndSubname(gname, subname);
            
            ArrayList<Double> absentList = new ArrayList<>();
            int totalSess = dates.size();
            int numberAbsent = 0;
            
            for (Student stu : students) {
                for (Date date : dates) {
                    for (Attendance att : attendances) {
                        if(att.getSession().getDate().equals(date) && att.getStudent().getId() == stu.getId()) {
                            if(!att.isStatus()) {
                                numberAbsent++;
                            }
                        }
                    }
                }
            }
            
            double absentPercent = (double) (numberAbsent/totalSess)*100;
            absentList.add(absentPercent);
            
            req.setAttribute("dates", dates);
            req.setAttribute("attendances", attendances);
            req.setAttribute("students", students);
            req.setAttribute("absentList", absentList);
            req.getRequestDispatcher("/attendanceReport.jsp").forward(req, resp);
        }
        
    }
    
}
