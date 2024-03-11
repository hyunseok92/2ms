package org.ict.lms.formdata.model.service;

import java.util.ArrayList;

import org.ict.lms.formdata.model.dao.FormDataDao;
import org.ict.lms.formdata.model.vo.FormData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("formDataService")
public class FormDataServiceImpl implements FormDataService{

	@Autowired private FormDataDao formDataDao;
	
	@Override
	public FormData selectFormData(String form_no) {
		return formDataDao.selectFormData(form_no);
	}
	
	@Override
	public ArrayList<FormData> selectFormDataList() {
		return formDataDao.selectFormDataList();
	}
	
	@Override
	public ArrayList<FormData> selectNew5Form() {
		return formDataDao.selectNew5Form();
	}

	@Override
	public int insertFormData(FormData formData) {
		return formDataDao.insertFormData(formData);
	}

	@Override
	public int updateFormData(FormData formData) {
		return formDataDao.updateFormData(formData);
	}
	
	@Override
	public void updateFormReadcount(FormData formData) {
		formDataDao.updateFormReadcount(formData);
	}

	@Override
	public int deleteFormData(String form_no) {
		return formDataDao.deleteFormData(form_no);
	}
}
