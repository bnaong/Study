package com.test;

public class FriendDTO
{
	private String userName, age, gender;
	private String[] ideal;
	//-- 이상형은 여러 개의 데이터가 동시에 전달되므로
	//   배열로 처리할 수 있다.
	
	// getter / setter
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getAge()
	{
		return age;
	}
	public void setAge(String age)
	{
		this.age = age;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String[] getIdeal()
	{
		return ideal;
	}
	public void setIdeal(String[] ideal)
	{
		this.ideal = ideal;
	}
	
}
