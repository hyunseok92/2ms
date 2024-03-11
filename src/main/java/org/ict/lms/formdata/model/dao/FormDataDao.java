package org.ict.lms.formdata.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.formdata.model.vo.FormData;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("formDataDao")
public class FormDataDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<FormData> selectFormDataList(){
		List<FormData> list = sqlSessionTemplate.selectList("formDataMapper.selectFormDataList");
		return (ArrayList<FormData>)list;
	}
	

	public ArrayList<FormData> selectNew5Form(){
		List<FormData> list = sqlSessionTemplate.selectList("formDataMapper.selectNew5Form");
		return (ArrayList<FormData>)list;
	}

	public FormData selectFormData(String form_no) {
		return sqlSessionTemplate.selectOne("formDataMapper.selectForm", form_no);

	}
	
	public int insertFormData(FormData formData) {
		return sqlSessionTemplate.insert("formDataMapper.insertFormData", formData);
	}
	
	public int updateFormData(FormData formData) {
		return sqlSessionTemplate.update("formDataMapper.updateFormData", formData);
	}

	public void updateFormReadcount(FormData formData) {
		sqlSessionTemplate.update("formDataMapper.updateFormReadcount", formData);
	}
	
	public int deleteFormData(String form_no) {
		return sqlSessionTemplate.delete("formDataMapper.deleteFormData", form_no);
	}
}
