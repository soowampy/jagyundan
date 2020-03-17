package petsitter.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import petsitter.model.dao.PetInfoDao;
import petsitter.model.vo.Pet;
import user.model.dao.UserDao;
import user.model.vo.User;

import static common.JDBCTemplate.*;
public class PetInfoService {
	
	//개삭제
	public int deletePet(int dogNum) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PetInfoDao().deletePet(con,dogNum);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}
	
	//개지웟을때 업뎃
	//개 수 업뎃용(유저로)
	public User updateDogSu2(User m) {
		Connection conn = getConnection();
		User updateUser = null;
		// 1. 수정사항 업데이트
		int result = new PetInfoDao().updateDogSu2(conn, m);
		System.out.println(result+"수ㅈ정됨");
		if(result > 0) {
			updateUser = new UserDao().selectUser(conn, m.getUserId());
			System.out.println("ㅋㅋ"+updateUser);
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		System.out.println("ㅋㅋ"+updateUser);
		return updateUser;
	}

	
	
	
	//개 추가용
	public int insertPet(Pet pet) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PetInfoDao().insertPet(con, pet);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	//개 수 업뎃용(유저로)
	public User updateDogSu(User m) {
		Connection conn = getConnection();
		User updateUser = null;
		// 1. 수정사항 업데이트
		int result = new PetInfoDao().updateDogSu(conn, m);
		System.out.println(result+"수ㅈ정됨");
		if(result > 0) {
			updateUser = new UserDao().selectUser(conn, m.getUserId());
			System.out.println("ㅋㅋ"+updateUser);
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		System.out.println("ㅋㅋ"+updateUser);
		return updateUser;
	}

	
	
	
	
	
	
	
	//개정보수정
	public int updatePet(Pet pet,int dogNum) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PetInfoDao().updatePet(con,pet,dogNum);
		return 0;
	}


	
	//유저번호로 펫골라오기!
	public Pet selectPet(int userNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		Pet pet = new PetInfoDao().selectPet(con, userNo);
		return pet;
	}
	

	
	
	//유저번호로 리스트 갖고오기
	public ArrayList<Pet> selectList(int userNo) {
		Connection conn = getConnection();
		ArrayList<Pet> list = new PetInfoDao().selectList(conn, userNo);
		close(conn);
		return list;
	}

	//펫번호로 펫골라오기
	public Pet selectPet2(int dogNum) {
		Connection con = getConnection();
		System.out.println("펫번호로 펫골라오기");
		Pet pet = new PetInfoDao().selectPetNo(con, dogNum);
		return pet;
	}
	
}
