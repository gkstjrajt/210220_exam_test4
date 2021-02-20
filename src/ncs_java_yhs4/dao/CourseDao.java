package ncs_java_yhs4.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ncs_java_yhs4.ds.JdbcUtil;
import ncs_java_yhs4.dto.Course;

public class CourseDao {
	private static final CourseDao instance = new CourseDao();

	public CourseDao() {
	}

	public static CourseDao getInstance() {
		return instance;
	}
	
	public List<Course> selectCourseByAll() {
		String sql = "SELECT ID, c.NAME AS NAME, CREDIT, l.NAME AS LECTURER, WEEK, START_HOUR, END_END FROM COURSE_TBL c JOIN LECTURER_TBL l ON c.LECTURER = l.IDX ORDER BY ID";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				List<Course> list = new ArrayList<Course>();
				do {
					list.add(getCourse(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Course getCourse(ResultSet rs) throws SQLException {
		String id = rs.getString("ID");
		String name = rs.getString("NAME");
		int credit = rs.getInt("CREDIT");
		String lecturer = rs.getString("LECTURER");
		int week = rs.getInt("WEEK");
		int start_hour = rs.getInt("START_HOUR");
		int end_end = rs.getInt("END_END");
		return new Course(id, name, credit, lecturer, week, start_hour, end_end);
	}
	
	public Course selectCourseById(String id) {
		String sql = "SELECT ID, NAME, CREDIT, LECTURER, WEEK, START_HOUR, END_END FROM COURSE_TBL WHERE ID = ?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
				pstmt.setString(1, id);
				try(ResultSet rs = pstmt.executeQuery()){
					if(rs.next()) {
						return getCourse(rs);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return null;
	}
	
	public int insertCourse(Course course) {
		String sql = "INSERT INTO COURSE_TBL VALUES (?, ?, ?, ?, ?, ?, ?)";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
				pstmt.setString(1, course.getId());
				pstmt.setString(2, course.getName());
				pstmt.setInt(3, course.getCredit());
				pstmt.setString(4, course.getLecturer());
				pstmt.setInt(5, course.getWeek());
				pstmt.setInt(6, course.getStart_hour());
				pstmt.setInt(7, course.getEnd_end());
				return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int deleteCourse(String id) {
		String sql = "DELETE FROM COURSE_TBL WHERE ID = ?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
				pstmt.setString(1, id);
				return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int updateCourse(Course course, String id) {
		String sql = "UPDATE COURSE_TBL SET ID = ?, NAME = ?, CREDIT = ?, LECTURER = ?, WEEK = ?, START_HOUR = ?, END_END = ? WHERE ID = ?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
				pstmt.setString(1, course.getId());
				pstmt.setString(2, course.getName());
				pstmt.setInt(3, course.getCredit());
				pstmt.setString(4, course.getLecturer());
				pstmt.setInt(5, course.getWeek());
				pstmt.setInt(6, course.getStart_hour());
				pstmt.setInt(7, course.getEnd_end());
				pstmt.setString(8, id);
				return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
}






















