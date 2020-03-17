package board.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;


import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.Comment;
import common.model.vo.IMG;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class BoardService {
	
	private BoardDao bd = new BoardDao();
	
	public int deleteBoard(int boardNo) {
		
		Connection conn = getConnection();
		int result = bd.deleteBoard(conn,boardNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		
		int result = bd.increasCount(conn,boardNo);
		Board board = null;
		if(result>0) {
			commit(conn);
			board = bd.selectBoard(conn, boardNo);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return board;
		
		
	}
	// 게시글 입력
	public int insertBoard(Board b) {
		Connection conn = getConnection();
		int result = new BoardDao().insertBoard(conn,b);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = bd.getListCount(conn);
		close(conn);
	

		return listCount;
		
	}

	
	public int updateBoard(Board b) {
		Connection conn = getConnection();
		int result = new BoardDao().updateBoard(conn,b);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}



	public ArrayList<IMG> selectIMG(int boardNo) {
		Connection conn = getConnection();
		ArrayList<IMG> list = new BoardDao().selectIMG(conn,boardNo);
		close(conn);
		return list;
		
	}

	public int insertIMG(Board b, ArrayList<IMG> fileList) {
		Connection conn = getConnection();
		
		int result1 = bd.insertIMGBoard(conn,b);
		System.out.println(result1);
		int result2 = bd.insertIMG(conn,fileList);
		System.out.println(result2);
		if(result1 > 0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}close(conn);
		
	
		return result1;
		
	}


	public int updateIMG(Board b, ArrayList<IMG> fileList) {
	Connection conn = getConnection();
		
		int result1 = bd.updateBoard(conn,b);
		System.out.println(result1);
		int result2 = bd.updateIMG(conn,fileList,b);
		System.out.println(result2);
		if(result2 > 0) {
	
			commit(conn);
		}else {
		
			rollback(conn);
		}
	
		return result1;
		
	}

	public ArrayList<Board> selectList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Board>list = new BoardDao().selectList(conn,currentPage,boardLimit);
				
		close(conn);
		
		return list;
	}

	public ArrayList<Comment> insertComment(Comment cm) {
		Connection conn = getConnection();
		int result = bd.insertComment(conn,cm);
		ArrayList<Comment> clist = null;
		
		if(result>0) {
			commit(conn);
			clist=bd.selectCommentList(conn, cm.getBoardNo());
		}else {
			rollback(conn);
		}
		close(conn);
		
		return clist;
	}



	// 조회수 증가하지 않고 조회
	public Board selectBoradNoCnt(int boardNo) {
		Connection conn = getConnection();
		Board board = bd.selectBoard(conn, boardNo);
		close(conn);
	
		
		return board;
	}

	public ArrayList<Board> searchBoard(String search, String sc) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().searchList(conn,search,sc);
		close(conn);
		return list;
	}
	

	
	public ArrayList<Comment> selectCommentList(int boardNo) {
		Connection conn = getConnection();
		
		ArrayList<Comment> clist = new BoardDao().selectCommentList(conn, boardNo);
		close(conn);
		return clist;
	}

	public int deleteComment(int commentNo) {
		Connection conn = getConnection();
		
		int result = bd.deleteComment(conn,commentNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/*사진 게시판*/
	public int getIMGListCount() {
		Connection conn = getConnection();
		int listCount = bd.getIMGListCount(conn);
		close(conn);
		
		return listCount;
	}

	public ArrayList IMGselectList(int currentPage, int boardLimit, int flag) {
		
		Connection conn = getConnection();
		
		ArrayList list = null;
		
		BoardDao bDao = new BoardDao();
		
		if(flag ==1) {
			list = bDao.selectBList(conn,currentPage,boardLimit);
		}else {
			list = bDao.selectFList(conn);
		}
		close(conn);
					
		return list;
	
	
	}
	
	

	public Board selectIMGBoard(int boardNo) {
		Connection conn = getConnection();
		
		int result = bd.increasCount(conn,boardNo);
		Board board = null;
		if(result>0) {
			commit(conn);
			board = bd.selectIMGBoard(conn, boardNo);
		}else {
			rollback(conn);
		}
		close(conn);
		return board;
	}

	public Board selectIMGBoradNoCnt(int boardNo) {
		Connection conn = getConnection();
		Board board = bd.selectIMGBoard(conn, boardNo);
		close(conn);
	
		
		return board;
	}



	

}
