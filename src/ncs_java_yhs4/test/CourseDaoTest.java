package ncs_java_yhs4.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import ncs_java_yhs4.dao.CourseDao;
import ncs_java_yhs4.dto.Course;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CourseDaoTest {
	CourseDao dao = CourseDao.getInstance();
	
	@Test
	public void test1SelectCourseByAll() {
		System.out.println("testSelectCourseByAll");
		List<Course> list = dao.selectCourseByAll();
		list.stream().forEach(System.out::println);
	}
	
	@Test
	public void test4SelectCourseById() {
		System.out.println("testSelectCourseById");
		Course course = dao.selectCourseById("60001");
		System.out.println(course);
	}
	
	@Test
	public void test2InsertCourse() {
		System.out.println("testInsertCourse");
		String id = "50005";
		String name = "한석이가르치기";
		int credit = 5;
		String lecturer = "1";
		int week = 5;
		int start_hour = 1300;
		int end_end = 1400;
		Course course = new Course(id, name, credit, lecturer, week, start_hour, end_end);
		int res = dao.insertCourse(course);
		System.out.println(res);
	}

	@Test
	public void test3UpdateCourse() {
		System.out.println("testUpdateCourse");
		Course course = dao.selectCourseById("50005");
		course.setName("가르치기유난");
		String id = course.getId();
		course.setId("60001");
		int res = dao.updateCourse(course, id);
		System.out.println(res);
	}
	
	@Test
	public void test5DeleteCourse() {
		System.out.println("testDeleteCourse");
		int res = dao.deleteCourse("60001");
		System.out.println(res);
	}
	
	@Test
	public void test6GetCourseCount() {
		System.out.println("testGetCourseCount");
		int res = dao.getCourseCount();
		System.out.println(res);
	}
}










