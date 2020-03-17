
package petsitter.model.vo;

public class PsInfo {
   
   private String userName;
   private String userId;
   
   private int psNo;
   private int userNo;
   private String reason;
   private String job;
   private String dogChk;
   private String careExp;
   private String certific;
   private String approval;
   private double score;
   
   private String sch;
   
   
   public PsInfo() { }

   
   
   
   public String getSch() {
      return sch;
   }




   public void setSch(String sch) {
      this.sch = sch;
   }




   public PsInfo(String userName, String userId, int psNo, int userNo, String reason, String job, String dogChk,
         String careExp, String certific, String approval, double score, String sch) {
      super();
      this.userName = userName;
      this.userId = userId;
      this.psNo = psNo;
      this.userNo = userNo;
      this.reason = reason;
      this.job = job;
      this.dogChk = dogChk;
      this.careExp = careExp;
      this.certific = certific;
      this.approval = approval;
      this.score = score;
      this.sch = sch;
   }




   public PsInfo(String userName, String userId, int psNo, int userNo, String reason, String job, String dogChk,
         String careExp, String certific, String approval, double score) {
      super();
      this.userName = userName;
      this.userId = userId;
      this.psNo = psNo;
      this.userNo = userNo;
      this.reason = reason;
      this.job = job;
      this.dogChk = dogChk;
      this.careExp = careExp;
      this.certific = certific;
      this.approval = approval;
      this.score = score;
   }




   public String getUserName() {
      return userName;
   }




   public void setUserName(String userName) {
      this.userName = userName;
   }




   public String getUserId() {
      return userId;
   }




   public void setUserId(String userId) {
      this.userId = userId;
   }




   public PsInfo(int psNo, int userNo, String reason, String job, String dogChk, String careExp, String certific,
         String approval,double score) {
      super();
      this.psNo = psNo;
      this.userNo = userNo;
      this.reason = reason;
      this.job = job;
      this.dogChk = dogChk;
      this.careExp = careExp;
      this.certific = certific;
      this.approval = approval;
      this.score = score;
   }
   
   public PsInfo(int userNo, String reason, String job, String dogChk, String careExp, String certific) {
      super();
      this.userNo = userNo;
      this.reason = reason;
      this.job = job;
      this.dogChk = dogChk;
      this.careExp = careExp;
      this.certific = certific;
   }

   public int getPsNo() {
      return psNo;
   }

   public void setPsNo(int psNo) {
      this.psNo = psNo;
   }

   public int getUserNo() {
      return userNo;
   }

   public void setUserNo(int userNo) {
      this.userNo = userNo;
   }

   public String getReason() {
      return reason;
   }

   public void setReason(String reason) {
      this.reason = reason;
   }

   public String getJob() {
      return job;
   }

   public void setJob(String job) {
      this.job = job;
   }

   public String getDogChk() {
      return dogChk;
   }

   public void setDogChk(String dogChk) {
      this.dogChk = dogChk;
   }

   public String getCareExp() {
      return careExp;
   }

   public void setCareExp(String careExp) {
      this.careExp = careExp;
   }

   public String getCertific() {
      return certific;
   }

   public void setCertific(String certific) {
      this.certific = certific;
   }

   public String getApproval() {
      return approval;
   }

   public void setApproval(String approval) {
      this.approval = approval;
   }

   public double getScore() {
      return score;
   }

   public void setScore(double score) {
      this.score = score;
   }

   @Override
   public String toString() {
      return "PsInfo [userName=" + userName + ", userId=" + userId + ", psNo=" + psNo + ", userNo=" + userNo
            + ", reason=" + reason + ", job=" + job + ", dogChk=" + dogChk + ", careExp=" + careExp + ", certific="
            + certific + ", approval=" + approval + ", score=" + score + ", sch=" + sch + "]";
   }
   
   
}