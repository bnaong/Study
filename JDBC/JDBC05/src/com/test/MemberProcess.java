/*==========================================
	MemberProcess.java
	- 콘솔 기반 서브 메뉴 입출력 전용 클래스
===========================================*/

package com.test;

import java.util.ArrayList;
import java.util.Scanner;

public class MemberProcess
{
	// 주요 속성 구성(데이터베이스 액션 처리 전담 객체)
	private MemberDAO dao;
	
	// 생성자 정의
	public MemberProcess()
	{
		dao = new MemberDAO();
	}
	
	// 직원 정보 입력 기능
	public void memberInsert()
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			
			dao.connection();
			
			System.out.println();
			System.out.println("직원 정보 입력 -----------------------------------------------------------------------------");
			System.out.print("이름 : ");
			String empName = sc.next();
			
			System.out.print("주민번호(yymmdd-nnnnnnn) : ");
			String ssn = sc.next();
			
			System.out.print("입사일(yyyy-mm-dd) : ");
			String ibsadate = sc.next();
			
			
			System.out.print("지역(");
			for (String str : dao.cityLists())
			{
				System.out.print(str + "/");
			}
			System.out.print(") : ");
			String cityName = sc.next();
			
			System.out.print("전화번호 : ");
			String tel = sc.next();
			
			System.out.print("부서(");
			for (String str : dao.buseoLists())
			{
				System.out.print(str + "/");
			}
			System.out.print(") : ");
			String buseoName = sc.next();
			
			System.out.print("직위(");
			for (String str : dao.jikwiLists())
			{
				System.out.print(str + "/");
			}
			System.out.print(") : ");
			String jikwiName = sc.next();
			
			System.out.print("기본급(최소 " + dao.minBasicPay(jikwiName) +" 이상) : ");
			int basicPay = sc.nextInt();

			System.out.print("수당 : ");
			int sudang = sc.nextInt();
			
			System.out.println();
			
			// 입력받은 항목들을 토대로 ScoreDTO 객체 구성
			MemberDTO dto = new MemberDTO();
			
			dto.setEmpName(empName);
			dto.setSsn(ssn);
			dto.setIbsadate(ibsadate);
			dto.setCityName(cityName);
			dto.setTel(tel);
			dto.setBuseoName(buseoName);
			dto.setJikwiName(jikwiName);
			dto.setBasicPay(basicPay);
			dto.setSudang(sudang);
			
			
			int result = dao.add(dto);
			
			// 입력 처리 정상 여부 확인
			if (result > 0)
				System.out.println("직원 정보 입력 완료~!!!");
			
			System.out.println("--------------------------------------------------------------------------------------------");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 직원 전체 정렬 출력 기능
	public void memberSelectOrderBy(int sel)
	{
		try
		{
			dao.connection();
			
			System.out.println();
			System.out.printf("전체 인원 : %d명\n", dao.count());
			System.out.println("사번   이름   주민번호   입사일   지역   전화번호   부서   직위   기본급   수당   급여");
			
			for (MemberDTO dto : dao.lists(sel))
			{
				System.out.printf("%4s %5s %5s %5s %6s %4s %4s %4s %5d %5d %5d\n"
						, dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsadate(), dto.getCityName(), dto.getTel(), dto.getBuseoName(), dto.getJikwiName()
						, dto.getBasicPay(), dto.getSudang(), dto.getSal());
			}
			
			dao.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	
	// 직원 사번 검색 기능
	public void memberSearchId()
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			System.out.println();
			System.out.print("검색할 사번 입력 : ");
			String empId = sc.next();
			
			dao.connection();
			
			ArrayList<MemberDTO> arrayList = dao.idLists(empId);
			
			if (arrayList.size() > 0)
			{
				for (MemberDTO dto : arrayList)
				{
					System.out.println();
					System.out.println("사번   이름   주민번호   입사일   지역   전화번호   부서   직위   기본급   수당   급여");
					System.out.printf("%4s %5s %5s %5s %6s %4s %4s %4s %5d %5d %5d\n"
							, dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsadate(), dto.getCityName(), dto.getTel(), dto.getBuseoName(), dto.getJikwiName()
							, dto.getBasicPay(), dto.getSudang(), dto.getSal());					
				}			
			}
			else
			{
				// 수신된 내용이 없다는 상황을 사용자에게 안내
				System.out.println("검색 결과가 존재하지 않습니다.");
			}
			
			dao.close();
	
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 직원 이름 검색 기능
	public void memberSearchName()
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			System.out.println();
			System.out.print("검색할 사원명 입력 : ");
			String empName = sc.next();
			
			dao.connection();
			
			ArrayList<MemberDTO> arrayList = dao.nameLists(empName);
			
			if (arrayList.size() > 0)
			{
				System.out.println();
				System.out.println("사번   이름   주민번호   입사일   지역   전화번호   부서   직위   기본급   수당   급여");
				for (MemberDTO dto : arrayList)
				{
					System.out.printf("%4s %5s %5s %5s %6s %4s %4s %4s %5d %5d %5d\n"
							, dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsadate(), dto.getCityName(), dto.getTel(), dto.getBuseoName(), dto.getJikwiName()
							, dto.getBasicPay(), dto.getSudang(), dto.getSal());					
				}			
			}
			else
			{
				// 수신된 내용이 없다는 상황을 사용자에게 안내
				System.out.println("검색 결과가 존재하지 않습니다.");
			}
			
			dao.close();
	
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 직원 부서 검색 기능
	public void memberSearchBuseo()
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			System.out.println();
			System.out.print("검색할 부서명 입력 : ");
			String buseoName = sc.next();
			
			dao.connection();
			
			ArrayList<MemberDTO> arrayList = dao.buseoLists(buseoName);
			
			if (arrayList.size() > 0)
			{
				System.out.println();
				System.out.println("사번   이름   주민번호   입사일   지역   전화번호   부서   직위   기본급   수당   급여");
				for (MemberDTO dto : arrayList)
				{
				
					System.out.printf("%4s %5s %5s %5s %6s %4s %4s %4s %5d %5d %5d\n"
							, dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsadate(), dto.getCityName(), dto.getTel(), dto.getBuseoName(), dto.getJikwiName()
							, dto.getBasicPay(), dto.getSudang(), dto.getSal());					
				}			
			}
			else
			{
				// 수신된 내용이 없다는 상황을 사용자에게 안내
				System.out.println("검색 결과가 존재하지 않습니다.");
			}
			
			dao.close();
	
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 직원 직위 검색 기능
	public void memberSearchJikwi()
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			System.out.println();
			System.out.print("검색할 직위명 입력 : ");
			String jikwiName = sc.next();
			
			dao.connection();
			
			ArrayList<MemberDTO> arrayList = dao.jikwiLists(jikwiName);
			
			if (arrayList.size() > 0)
			{
				System.out.println();
				System.out.println("사번   이름   주민번호   입사일   지역   전화번호   부서   직위   기본급   수당   급여");
				
				for (MemberDTO dto : arrayList)
				{
					System.out.printf("%4s %5s %5s %5s %6s %4s %4s %4s %5d %5d %5d\n"
							, dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsadate(), dto.getCityName(), dto.getTel(), dto.getBuseoName(), dto.getJikwiName()
							, dto.getBasicPay(), dto.getSudang(), dto.getSal());					
				}			
			}
			else
			{
				// 수신된 내용이 없다는 상황을 사용자에게 안내
				System.out.println("검색 결과가 존재하지 않습니다.");
			}
			
			dao.close();
	
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}

	// 직원 정보 수정
	public void memberUpdate()
	{
		try
		{
			// 수정할 대상의 번호 입력받기
			Scanner sc = new Scanner(System.in);
			System.out.println();
			System.out.print("수정할 사번을 입력하세요 : ");
			String empId = sc.next();
			
			// 데이터베이스 연결
			dao.connection();
			
			ArrayList<MemberDTO> arrayList = dao.idLists(empId);
			
			if (arrayList.size() > 0)
			{
				System.out.println("사번   이름   주민번호   입사일   지역   전화번호   부서   직위   기본급   수당   급여");
				
				for (MemberDTO dto : arrayList)
				{
					System.out.printf("%4s %5s %5s %5s %6s %4s %4s %4s %5d %5d %5d\n"
							, dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsadate(), dto.getCityName(), dto.getTel(), dto.getBuseoName(), dto.getJikwiName()
							, dto.getBasicPay(), dto.getSudang(), dto.getSal());					
				}
				System.out.println();
				System.out.print("수정할 데이터 입력(이름 주민번호 입사일 지역 전화번호 부서 직위 기본급 수당) : ");
				String empName = sc.next();
				String ssn = sc.next();
				String ibsadate = sc.next();
				String cityName = sc.next();
				String tel = sc.next();
				String buseoName = sc.next();
				String jikwiName = sc.next();
				int basicPay = sc.nextInt();
				int sudang = sc.nextInt();
				
				// 입력받은 항목들을 토대로 ScoreDTO 객체 구성
				MemberDTO dto = new MemberDTO();
				
				dto.setEmpId(empId);
				dto.setEmpName(empName);
				dto.setSsn(ssn);
				dto.setIbsadate(ibsadate);
				dto.setCityName(cityName);
				dto.setTel(tel);
				dto.setBuseoName(buseoName);
				dto.setJikwiName(jikwiName);
				dto.setBasicPay(basicPay);
				dto.setSudang(sudang);
				
				int result = dao.modify(dto);
				
				if (result > 0)
				{
					System.out.println("수정이 완료되었습니다.");
					
				}
			}
			else
			{
				// 수신된 내용이 없다는 상황을 사용자에게 안내
				System.out.println("수정대상이 존재하지 않습니다.");
			}
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 직원 정보 삭제
	public void memberDelete()
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			System.out.println();
			System.out.print("삭제할 사번 입력하세요 : ");
			String empId = sc.next();
			
			// 데이터베이스 연결
			dao.connection();
			
			ArrayList<MemberDTO> arrayList = dao.idLists(empId);
			
			if (arrayList.size() > 0)
			{
				System.out.println();
				System.out.println("사번   이름   주민번호   입사일   지역   전화번호   부서   직위   기본급   수당   급여");
				for (MemberDTO dto : arrayList)
				{
					System.out.printf("%4s %5s %5s %5s %6s %4s %4s %4s %5d %5d %5d\n"
							, dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsadate(), dto.getCityName(), dto.getTel(), dto.getBuseoName(), dto.getJikwiName()
							, dto.getBasicPay(), dto.getSudang(), dto.getSal());					
				}
				System.out.println();
				System.out.print(">> 정말 삭제하시겠습니까?(Y/N) : ");
				String response = sc.next();
				if (response.equals("Y") || response.equals("y"))
				{
					int result = dao.remove(empId);
					if (result > 0)
						System.out.println("성적 삭제가 완료되었습니다.");
				} else
				{
					System.out.println("취소되었습니다.");
				}
					
			}
			else
			{
				// 수신된 내용이 존재하지 않는 상황 전달(안내)
				System.out.println("삭제할 대상이 존재하지 않습니다.");
			}
				
			// 데이터베이스 연결 종료
			dao.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
