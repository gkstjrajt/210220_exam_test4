package ncs_java_yhs4.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import ncs_java_yhs4.dao.LecturerDao;
import ncs_java_yhs4.dto.Lecturer;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class LecturerDaoTest {
	LecturerDao dao = LecturerDao.getInstance();

	@Test
	public void test2SelectLecturerByAll() {
		System.out.println("testSelectLecturerByAll");
		List<Lecturer> list = dao.selectLecturerByAll();
		list.stream().forEach(System.out::println);
	}

	@Test
	public void test3SelectLecturerByIdx() {
		System.out.println("testSelectLecturerByIdx");
		int idx = 8;
		Lecturer lecturer = dao.selectLecturerByIdx(idx);
		System.out.println(lecturer);
	}
	
	@Test
	public void test1InsertLecturer() {
		System.out.println("testInsertLecturer");
		int idx = 8;
		String name = "윤교수";
		String major = "멋쟁이학과";
		String field = "멋있어지기";
		Lecturer lecturer = new Lecturer(idx, name, major, field);
		int res = dao.insertLecturer(lecturer);
		System.out.println(res);
	}
	
	@Test
	public void test4DeleteLecturer() {
		System.out.println("testDeleteLecturer");
		int idx = 8;
		int res = dao.deleteLecturer(idx);
		System.out.println(res);
	}
	
	@Test
	public void test5GetCountName() {
		System.out.println("testGetCountName");
		int res = dao.getCountName("김교수");
		System.out.println(res);
	}
}
