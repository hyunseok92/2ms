package org.ict.lms.student.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.student.model.vo.Student;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("studentDao")
public class StudentDao {
  
	private static final Logger logger = LoggerFactory.getLogger(StudentDao.class);
  
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*
	 * public ArrayList<Student> selectStudentList() { List<Student> list =
	 * sqlSessionTemplate.selectList("StudentMapper.selectStudentList"); return
	 * (ArrayList<Student>)list; }
	 */
	
	public Student selectStudent(String Id) {
		return sqlSessionTemplate.selectOne("studentMapper.selectStudent", Id);
	}

	public Student selectStudent2(Student student) {
		return sqlSessionTemplate.selectOne("studentMapper.selectStudent2", student);
	}
	
	public int selectCountStudent(String Id) {
		return sqlSessionTemplate.selectOne("studentMapper.selectCountStudent", Id);
	}
	
	public int insertStudent(Student student) {
		return sqlSessionTemplate.insert("studentMapper.insertStudent", student);
	}
	
	public int updateStudent(Student student) {
		return sqlSessionTemplate.update("studentMapper.updateStudent", student);
	}
	
	public int updateStudent2(Student student) {
		return sqlSessionTemplate.update("studentMapper.updateStudent2", student);
	}
		
	public int deleteStudent(String Id) {
		return sqlSessionTemplate.delete("studentMapper.deleteStudent", Id);
	}

	public ArrayList<Student> selectStudentList(Paging paging) {
		List<Student> list = sqlSessionTemplate.selectList("studentMapper.selectStudentList", paging);
		return (ArrayList<Student>)list;
	}
	
	public ArrayList<Student> selectStudentList(Search search) {
		List<Student> list = sqlSessionTemplate.selectList("studentMapper.selectSearchStudentList", search);
		return (ArrayList<Student>)list;
	}
	
	public ArrayList<Student> selectStudentList(String classcode) {
		List<Student> list = sqlSessionTemplate.selectList("studentMapper.selectClassStudentList", classcode);
		return (ArrayList<Student>)list;
	}
	
	
	
	public int searchStudentListCount(Search search) {
		return sqlSessionTemplate.selectOne("studentMapper.searchStudentListCount", search);
	}
	

	public int selectStudentListCount() {
		return sqlSessionTemplate.selectOne("studentMapper.selectStudentListCount");
	}
	
	public int searchStudentListCount(String name) {
		return sqlSessionTemplate.selectOne("studentMapper.searchStudentListCount", name);
	}

	public Student searchStudent(Student student) {
		return sqlSessionTemplate.selectOne("studentMapper.searchStudent", student);
	}
	
	public int selectCheckId(String id) {
		return sqlSessionTemplate.selectOne("studentMapper.selectCheckId", id);
	}
//	//비밀번호변경
//	@Override
//	public int updatePw(Student student) throws Exception {
//		return sqlSessionTemplate.update("studentMapper.updatePw", student);
//	}

	public int updateStudentStatus(Student student) {
		return sqlSessionTemplate.update("studentMapper.updateStudentStatus", student);
	}
}
