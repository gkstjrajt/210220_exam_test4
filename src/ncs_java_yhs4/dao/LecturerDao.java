package ncs_java_yhs4.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ncs_java_yhs4.ds.JdbcUtil;
import ncs_java_yhs4.dto.Lecturer;

public class LecturerDao {
	private static final LecturerDao instance = new LecturerDao();

	public LecturerDao() {
	}

	public static LecturerDao getInstance() {
		return instance;
	}

	public List<Lecturer> selectLecturerByAll() {
		String sql = "SELECT IDX, NAME, MAJOR, FIELD FROM LECTURER_TBL ORDER BY IDX";
		try (Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				List<Lecturer> list = new ArrayList<Lecturer>();
				do {
					list.add(getLecturer(rs));
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Lecturer getLecturer(ResultSet rs) throws SQLException {
		int idx = rs.getInt("IDX");
		String name = rs.getString("NAME");
		String major = rs.getString("MAJOR");
		String field = rs.getString("FIELD");
		return new Lecturer(idx, name, major, field);
	}

	public Lecturer selectLecturerByIdx(int idx) {
		String sql = "SELECT IDX, NAME, MAJOR, FIELD FROM LECTURER_TBL WHERE IDX = ?";
		try (Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
				pstmt.setInt(1, idx);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getLecturer(rs);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return null;
	}
	
	public int insertLecturer(Lecturer lecturer) {
		String sql = "INSERT INTO LECTURER_TBL VALUES (?, ?, ?, ?)";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
				pstmt.setInt(1, lecturer.getIdx());
				pstmt.setString(2, lecturer.getName());
				pstmt.setString(3, lecturer.getMajor());
				pstmt.setString(4, lecturer.getField());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int deleteLecturer(int idx) {
		String sql = "DELETE FROM LECTURER_TBL WHERE IDX = ?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
				pstmt.setInt(1, idx);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int getNextIdx() {
		String sql = "SELECT MAX(IDX)+1 FROM LECTURER_TBL";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int getCountName(String name) {
		String sql = "SELECT COUNT(NAME) FROM LECTURER_TBL WHERE NAME = ?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
				pstmt.setString(1, name);
				try(ResultSet rs = pstmt.executeQuery()){
					if(rs.next()) {
						return rs.getInt(1);
					}
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
}















