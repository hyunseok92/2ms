package org.ict.lms.formdata.model.service;

import java.util.ArrayList;

import org.ict.lms.formdata.model.vo.FormData;

public interface FormDataService {

	public FormData selectFormData(String form_no);
  
	public ArrayList<FormData> selectNew5Form();

	public ArrayList<FormData> selectFormDataList();

	public int insertFormData(FormData formData);
	
	public int updateFormData(FormData formData);

	public int deleteFormData(String form_no);

	public void updateFormReadcount(FormData formData);
}
