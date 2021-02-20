package ncs_java_yhs4.test;

import java.sql.Connection;

import org.junit.Test;

import ncs_java_yhs4.ds.JdbcUtil;

public class JdbcUtilTest {

	@Test
	public void testGetConnection() {
		System.out.println("testGetConnection");
		Connection con = JdbcUtil.getConnection();
		System.out.println(con);
	}

}
