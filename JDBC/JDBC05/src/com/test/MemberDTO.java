/*====================================
	MemberDTO.java
	- 데이터 보관 및 전송 전용 클래스
====================================*/

package com.test;

public class MemberDTO
{
	private String empId, empName, ssn, ibsadate, cityName, tel, buseoName, jikwiName;
	private int basicPay, sudang, sal;
	
	// getter / setter
	public String getEmpId()
	{
		return empId;
	}
	public void setEmpId(String empId)
	{
		this.empId = empId;
	}
	public String getEmpName()
	{
		return empName;
	}
	public void setEmpName(String empName)
	{
		this.empName = empName;
	}
	public String getSsn()
	{
		return ssn;
	}
	public void setSsn(String ssn)
	{
		this.ssn = ssn;
	}
	public String getIbsadate()
	{
		return ibsadate;
	}
	public void setIbsadate(String ibsadate)
	{
		this.ibsadate = ibsadate;
	}
	public String getCityName()
	{
		return cityName;
	}
	public void setCityName(String cityName)
	{
		this.cityName = cityName;
	}
	public String getTel()
	{
		return tel;
	}
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	public String getBuseoName()
	{
		return buseoName;
	}
	public void setBuseoName(String buseoName)
	{
		this.buseoName = buseoName;
	}
	public String getJikwiName()
	{
		return jikwiName;
	}
	public void setJikwiName(String jikwiName)
	{
		this.jikwiName = jikwiName;
	}
	public int getBasicPay()
	{
		return basicPay;
	}
	public void setBasicPay(int basicPay)
	{
		this.basicPay = basicPay;
	}
	public int getSudang()
	{
		return sudang;
	}
	public void setSudang(int sudang)
	{
		this.sudang = sudang;
	}
	public int getSal()
	{
		return sal;
	}
	public void setSal(int sal)
	{
		this.sal = sal;
	}
	

}
