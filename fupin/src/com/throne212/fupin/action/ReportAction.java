package com.throne212.fupin.action;

public class ReportAction extends BaseAction {

	private Integer year;
	private String type;
	private String time;

	public String viewReport1() {
		if(year == null){//默认情况下，为当前年度和当前的月份的表格
			
		}else{
			
		}
		return "report_edit1";
	}
	public String viewReport2() {
		if(year == null){//默认情况下，为当前年度和当前的月份的表格
			
		}else{
			
		}
		return "report_edit2";
	}
	public String saveReport1(){
		
		return viewReport1();
	}
	public String saveReport2(){
		
		return viewReport2();
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
