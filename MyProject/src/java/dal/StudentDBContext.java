/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.IBaseModel;
import model.Student;

/**
 *
 * @author fpt
 */
public class StudentDBContext extends DBContext<IBaseModel> {

    public ArrayList<Student> getAllStudentByGnameAndSubname(String gname, String subname) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "select stu.stuid, stu.stuname\n"
                    + "from Student stu \n"
                    + "join Group_Student grs on stu.stuid = grs.stuid\n"
                    + "join [Group] gr on grs.gid = gr.gid\n"
                    + "join [Subject] sub on gr.subid = sub.subid\n"
                    + "where gr.gname = ? and sub.subname = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, gname);
            stm.setString(2, subname);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("stuid"));
                s.setName(rs.getString("stuname"));
                students.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return students;
    }

    @Override
    public ArrayList<IBaseModel> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
