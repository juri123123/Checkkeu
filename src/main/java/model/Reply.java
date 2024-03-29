package model;

import java.io.Serializable;

public class Reply implements Serializable { 
   
   private int postNum;
   private String replyContent; // ��� ����
   private int replyNum;
   
   public Reply() { }
   
   public Reply(int postNum, String replyContent, int replyNum) {
      this.postNum = postNum;
     
      this.replyContent = replyContent;
      this.replyNum = replyNum;
   }
   

   public int getPostNum() {
      return postNum;
   }
   public void setPostNum(int postNum) {
      this.postNum = postNum;
   }
   
   public String getReplyContent() {
      return replyContent;
   }
   public void setReplyContent(String replyContent) {
      this.replyContent = replyContent;
   }
   
   public int getReplyNum() {
      return replyNum;
   }

   public void setReplyNum(int replyNum) {
      this.replyNum = replyNum;
   }

//   @Override
//   public String toString() {
//      return "Reply [postNum=" + postNum + ", agree=" + agree + ", disagree=" + disagree + ", replyContent="
//            + replyContent + ", replyNum=" + replyNum + "]";
//   }
}