package board.model.vo;

import java.util.Date;

public class Board {
   private int boardNo;
   private int category;
   private String title;
   private String content;
   private String userName;
   private int boardCount;
   private Date enrollDate;
   private String status;

   
   //추가사항
   private String changeName;
   private String filePath;
   
   
   
   
   public Board(int boardNo, int category, String title, String content, String changeName,String filePath, String userName, int boardCount,
         Date enrollDate, String status) {
      super();
      this.boardNo = boardNo;
      this.category = category;
      this.title = title;
      this.content = content;
      this.changeName = changeName;
      this.filePath = filePath;
      this.userName = userName;
      this.boardCount = boardCount;
      this.enrollDate = enrollDate;
      this.status = status;


   }


   public String getChangeName() {
      return changeName;
   }


   public void setChange_name(String changeName) {
      this.changeName = changeName;
   }


   public String getFilePath() {
      return filePath;
   }


   public void setFile_path(String filePath) {
      this.filePath = filePath;
   }


   public Board(int boardNo, int category, String title, String content, String userName, int boardCount,
         Date enrollDate, String status) {
      super();
      this.boardNo = boardNo;
      this.category = category;
      this.title = title;
      this.content = content;
      this.userName = userName;
      this.boardCount = boardCount;
      this.enrollDate = enrollDate;
      this.status = status;
   }


   public Board() {}

   
   public Board(int boardNo, String userNo, String title, String content, Date enrollDate, int category, String status,int boardCount) {
      super();
      this.boardNo = boardNo;
      this.userName = userNo;
      this.title = title;
      this.content = content;
      this.enrollDate = enrollDate;
      this.category = category;
      this.status = status;
      this.boardCount=boardCount;
   }

   public int getBoardNo() {
      return boardNo;
   }

   public void setBoardNo(int boardNo) {
      this.boardNo = boardNo;
   }

   public String getUserName() {
      return userName;
   }

   public void setUserName(String userName) {
      this.userName = userName;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public Date getEnrollDate() {
      return enrollDate;
   }

   public void setEnrollDate(Date enrollDate) {
      this.enrollDate = enrollDate;
   }

   public int getCategory() {
      return category;
   }

   public void setCategory(int category) {
      this.category = category;
   }

   public String getStatus() {
      return status;
   }

   public void setStatus(String status) {
      this.status = status;
   }

   public int getBoardCount() {
      return boardCount;
   }


   public void setBoardCount(int boardCount) {
      this.boardCount = boardCount;
   }


   @Override
   public String toString() {
      return "Board [boardNo=" + boardNo + ", category=" + category + ", title=" + title + ", content=" + content
            + ", userName=" + userName + ", boardCount=" + boardCount + ", enrollDate=" + enrollDate + ", status="
            + status + ", changeName=" + changeName + ", filePath=" + filePath + "]";
   }


   

}