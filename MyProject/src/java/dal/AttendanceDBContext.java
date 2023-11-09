/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attendance;
import model.Group;
import model.Session;
import model.Student;
import model.Subject;

/**
 *
 * @author fpt
 */
public class AttendanceDBContext extends DBContext<Attendance> {

    public ArrayList<Attendance> getAttendancesBySession(int sesid) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {
            String sql = "SELECT s.stuid,s.stuname, \n"
                    + "ISNULL(a.status,0) as [status] \n"
                    + ",ISNULL(a.description,'') as [description], \n"
                    + "ISNULL(a.att_datetime,GETDATE()) as att_datetime, \n"
                    + "g.gname, sub.subname \n"
                    + "FROM [Session] ses INNER JOIN [Group] g ON g.gid = ses.gid \n"
                    + "INNER JOIN Group_Student gs ON g.gid = gs.gid \n"
                    + "INNER JOIN Student s ON s.stuid = gs.stuid \n"
                    + "INNER JOIN [Subject] sub on g.subid = sub.subid \n"
                    + "LEFT JOIN Attendance a ON a.sesid = ses.sesid AND s.stuid = a.stuid \n"
                    + "WHERE ses.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Student s = new Student();
                Session ses = new Session();
                s.setId(rs.getInt("stuid"));
                s.setName(rs.getString("stuname"));
                att.setStudent(s);
                Subject sub = new Subject();
                sub.setName(rs.getString("subname"));
                Group g = new Group();
                g.setName(rs.getString("gname"));
                g.setSubject(sub);
                g.setId(sesid);
                ses.setGroup(g);
                ses.setId(sesid);
                att.setSession(ses);
                att.setStatus(rs.getBoolean("status"));
                att.setDescription(rs.getString("description"));
                att.setDatetime(rs.getTimestamp("att_datetime"));
                atts.add(att);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    public ArrayList<Attendance> getAttendanceByGnameAndSubname(String gname, String subname) {
        ArrayList<Attendance> attendances = new ArrayList<>();
        try {
            String sql = "select ses.sesid, stu.stuid, stu.stuname, a.[status], ses.[date], ses.isAtt  \n"
                    + "from Attendance a \n"
                    + "full join Session ses on a.sesid = ses.sesid\n"
                    + "full join Student stu on a.stuid = stu.stuid\n"
                    + "join [Group] g on ses.gid = g.gid\n"
                    + "join [Subject] sub on g.subid = sub.subid\n"
                    + "where g.gname = ? and sub.subname = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, gname);
            stm.setString(2, subname);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Session ses = new Session();
                ses.setId(rs.getInt("sesid"));
                ses.setDate(rs.getDate("date"));
                ses.setIsAtt(rs.getBoolean("isAtt"));
                att.setSession(ses);
                Student stu = new Student();
                stu.setId(rs.getInt("stuid"));
                stu.setName(rs.getString("stuname"));
                att.setStudent(stu);
                att.setStatus(rs.getBoolean("status"));
                attendances.add(att);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return attendances;
    }

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        AttendanceDBContext adbc = new AttendanceDBContext();
        ArrayList<Attendance> attendances = adbc.getAttendanceByGnameAndSubname("SE1763", "PRJ301");
        for (Attendance a : attendances) {
            System.out.println(a.getSession().isIsAtt());
        }
    }
}
