package myPackage;

import java.sql.Connection;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import myPackage.classes.Answers;
import myPackage.classes.Courses;
import myPackage.classes.Exams;
import myPackage.classes.Questions;
import myPackage.classes.User;

public class DatabaseClass {
    private Connection conn;
    
    //establishing the connection in constructor itself 
    public DatabaseClass() throws ClassNotFoundException, SQLException {
        establishConnection();
    }
    
    //establishConnection function
    private void establishConnection() throws ClassNotFoundException, SQLException {
       
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_system","root","root");
       
    }

    public ArrayList getAllUsers(){
    	
        ArrayList list=new ArrayList();
        User user=null;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from users");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                user =new User(rs.getInt(1),rs.getString(2),
                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10));
            list.add(user);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            
        }
        return list;
    }
    
     public String getUserType(String userId){
        String str="";
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from users where user_id=?");
            pstm.setInt(1, Integer.parseInt(userId));
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                str= rs.getString("user_type");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            str= "error";
        }
        return str;
    }
     public int getUserId(String userName,String pass){
        int str=0;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from users where user_name=? and password=?");
            pstm.setString(1,userName);
            pstm.setString(2,pass);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                str= rs.getInt("user_id");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            
        }
        return str;
    }
     
     public boolean loginValidate(String userName, String userPass) throws SQLException{
         //  boolean status=false;
       
       String sql="SELECT * FROM users\n"
               + "WHERE user_name=?";
       PreparedStatement pstm=conn.prepareStatement(sql);
       pstm.setString(1,userName);
       ResultSet rs=pstm.executeQuery();
       String uname;
       String pass;
       while(rs.next()){
           uname=rs.getString("user_name");
           pass=rs.getString("password");
           
               if( pass.equals(userPass) && uname.equals(userName)){
                     return true;
                } 
           }//end while
            return false;
             
       }
       
     
     public User getUserDetails(String userId){
         User userDetails=null;
         
         try {
            String sql="SELECT * from users where user_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1, userId);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                userDetails=new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)
                                        ,rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)
                                            ,rs.getString(9),rs.getString(10));
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
         return userDetails;
     }
    
    public int addNewStudent(String fName,String lName,String uName,String email,String pass,
            String dept,String roll_no,String div){
    	
    	int str = 0;
        try {
            String sql="INSERT into users(first_name,last_name,user_name,email,password,user_type,Department,roll_no,Division)"
                    + "Values(?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,fName );
            pstm.setString(2,lName );
            pstm.setString(3,uName );
            pstm.setString(4,email );
            pstm.setString(5,pass );
            pstm.setString(6,"student" );
            pstm.setString(7,dept );
            pstm.setString(8,roll_no );
            pstm.setString(9,div );
            pstm.executeUpdate();
            str = 1;
            
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
            str = 0;
        }
        
        return str;
    }
    public void updateStudent(int uId,String fName,String lName,String uName,String email,String pass,
            String roll_no,String dept,String div,String userType){
        try {
            String sql="Update users"
                    + " set first_name=? , last_name=? , user_name=? , email=? , password=? , user_type=? , roll_no=? , Department=? , Division=? "
                    + " where user_id=?";
            
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,fName );
            pstm.setString(2,lName );
            pstm.setString(3,uName );
            pstm.setString(4,email );
            pstm.setString(5,pass );
            pstm.setString(6,userType );
            pstm.setString(7,roll_no );
            pstm.setString(8,dept );
            pstm.setString(9,div );
            pstm.setInt(10,uId);
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
   
    public ArrayList getAllCourses(){
        ArrayList<Comparable> list=new ArrayList();
        try {
            String sql="SELECT * from courses";
            PreparedStatement pstm=conn.prepareStatement(sql);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                list.add(rs.getString(1));
                list.add(rs.getInt(2));
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public void addNewCourse(String courseName,int tMarks,String time){
        try {
            String sql="INSERT into courses(course_name,total_marks,time) Values(?,?,?)";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1, courseName);
            pstm.setInt(2,tMarks);
            pstm.setString(3,time);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void delCourse(String cName){
        try {
            String sql="DELETE from courses where course_name=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,cName);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 
    public void delQuestion(int qId){
        try {
            String sql="DELETE from questions where question_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,qId);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void delUser(int uid){
        try {
            String sql="DELETE from users where user_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,uid);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void addQuestion(String cName,String question,String opt1,String opt2,String opt3
                                ,String opt4,String correct){
        
        try {
            String sql="INSERT into questions( `question`, `opt1`, `opt2`, `opt3`, `opt4`, `correct`,course_name)"
                    + " VALUES (?,?,?,?,?,?,?)";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,question);
            pstm.setString(2,opt1 );
            pstm.setString(3,opt2 );
            pstm.setString(4, opt3);
            pstm.setString(5,opt4 );
            pstm.setString(6,correct );
            pstm.setString(7,cName);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<Questions> getQuestions(String courseName,int questions){
        ArrayList<Questions> list=new ArrayList<Questions>();
        try {
            
            String sql="Select * from questions where course_name=? ORDER BY RAND() LIMIT ?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,courseName);
            pstm.setInt(2,questions);
            ResultSet rs=pstm.executeQuery();
            Questions question;
            while(rs.next()){
               question = new Questions(
                       rs.getInt(1),rs.getString(3),rs.getString(4),rs.getString(5),
                       rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(2)
                    ); 
               list.add(question);
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public int startExam(String cName,int sId){
        int examId=0;
        try {
            String sql="INSERT into exams(course_name,date,start_time,std_id) "
                    + "VALUES(?,?,?,?)";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,cName);
            pstm.setString(2,getFormatedDate(LocalDate.now().toString()));
            pstm.setString(3,LocalTime.now().toString());
            
            pstm.setInt(4,sId);
            
            pstm.executeUpdate();
            pstm.close();
            examId=getLastExamId();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return examId;
    }
    public int getLastExamId(){
        int id=0;
         try {
            
            String sql="Select * from exams";
            PreparedStatement pstm=conn.prepareStatement(sql);
            ResultSet rs=pstm.executeQuery();
            
            while(rs.next()){
               id=rs.getInt(1);
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
         return id;
    }public String getStartTime(int examId){
        String time="";
        try {
            
            String sql="Select start_time from exams where exam_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1, examId);
            ResultSet rs=pstm.executeQuery();
            
            while(rs.next()){
               time=rs.getString(1);
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return time;
    }
    public String getCourseTimeByName(String cName){
     String c=null;
     try{
         PreparedStatement pstm=conn.prepareStatement("Select time from courses where course_name=?");
         pstm.setString(1,cName);
         ResultSet rs=pstm.executeQuery();
         while(rs.next()){
             c=rs.getString(1);
         }
         pstm.close();
     }catch(Exception e){
          Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, e);
     }
     
     return c;
    }
    public int getTotalMarksByName(String cName){
     int marks=0;
     try{
         PreparedStatement pstm=conn.prepareStatement("Select total_marks from courses where course_name=?");
         pstm.setString(1,cName);
         ResultSet rs=pstm.executeQuery();
         while(rs.next()){
             marks=rs.getInt(1);
             System.out.println(rs.getInt(1));
         }
         pstm.close();
     }catch(Exception e){
          e.printStackTrace();
     }
     
     return marks;
    }  
    
    public String getQuestion(int qid) throws SQLException
    {
    	String question = null;
    	
    	PreparedStatement pstm = conn.prepareStatement("Select question from questions where question_id = ?");
    	pstm.setInt(1, qid);
    	ResultSet rs = pstm.executeQuery();
    	while(rs.next())
    	{
    		question = rs.getString(1);
    	}
    	
    	pstm.close();
    	
		return question;
    	
    }
    
    public ArrayList getAllQuestions(String courseName){
        ArrayList list=new ArrayList();
        try {
            
            String sql="Select * from questions where course_name=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,courseName);
            ResultSet rs=pstm.executeQuery();
            Questions question;
            while(rs.next()){
               question = new Questions(
                       rs.getInt(1),rs.getString(3),rs.getString(4),rs.getString(5),
                       rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(2)
                    ); 
               list.add(question);
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList getAllAnswersByExamId(int examId){
        ArrayList list=new ArrayList();
        try {
            
            String sql="Select * from answers where exam_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,examId);
            ResultSet rs=pstm.executeQuery();
            Answers a;
            while(rs.next()){
               a = new Answers(
                       rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)
                    ); 
               list.add(a);
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    private  String getFormatedDate(String date){
        LocalDate localDate=LocalDate.parse(date);
        return localDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
    }
    private String getNormalDate(String date){
        String[] d=date.split("-");
        return d[2]+"-"+d[1]+"-"+d[0];
    }
    private String getFormatedTime(String time){
        if(time!=null){
            LocalTime localTime=LocalTime.parse(time);
        return  localTime.format(DateTimeFormatter.ofPattern("hh:mm a"));
        }else{
            
        return  "-";
        }
    }

    public int getRemainingTime(int examId){
        int time=0;
        try {
            String cName;
            cName = getCourseName(examId);
            String sql="Select exams.start_time,courses.time from exams,courses where exams.exam_id=? and exams.course_name =?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1, examId);
            pstm.setString(2,cName);
            ResultSet rs=pstm.executeQuery();
            
            while(rs.next()){
                //totalTime-(Math.abs(currentTime-examStartTime))
                //Duration.between(first,sec) returns difference between 2 dates or 2 times
               time=Integer.parseInt(rs.getString(2))-(int)Math.abs((Duration.between(LocalTime.now(),LocalTime.parse(rs.getString(1))).getSeconds()/60));
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Time " + time);
        return time;
    }
    public String getCourseName(int examId) throws SQLException
    {
    	String str = null;
    	try {
    		String sql = "Select course_name from exams where exam_id = ?";
        	PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, examId);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next())
			{
				str=rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
    	
    }
   public void insertAnswer(int eId,int qid,String question,String ans){
        try {
            PreparedStatement pstm=conn.prepareStatement("insert into answers(exam_id,question,answer,correct_answer,status) "
                    + "Values(?,?,?,?,?)");
            pstm.setInt(1,eId);
            pstm.setInt(2, qid);
            pstm.setString(3,ans);
            String correct=getCorrectAnswer(qid);
            pstm.setString(4, correct);
            pstm.setString(5,getAnswerStatus(ans,correct));
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
   } 

    private String getCorrectAnswer(int qid) {
        String ans="";
        
        try {
            PreparedStatement pstm=conn.prepareStatement("Select correct from questions where question_id=?");
            pstm.setInt(1,qid);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                ans=rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return ans;
    }

    private String getAnswerStatus(String ans, String correct) {
        String resp="";
        if(ans.equals(correct)){
            resp="correct";
        }else{
            resp="incorrect";
        }
        return resp;
       
    }
    public ArrayList getAllResultsFromExams(int stdId){
        ArrayList list=new ArrayList();
        Exams exam=null;
        try {
            PreparedStatement pstm=conn.prepareStatement("select * from exams where std_id=? order by date desc");
            pstm.setInt(1, stdId);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                exam=new Exams(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5)
                ,getFormatedTime(rs.getString(6)),getFormatedTime(rs.getString(7)),rs.getString(8));
                list.add(exam);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
        
    }
    public void calculateResult(int eid,int tMarks,String endTime,int size){
        
        try {
            String sql="update exams "
                    + "set obt_marks=?, end_time=?,status=? "
                    + "where exam_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            int obt=getObtMarks(eid,tMarks,size);
            pstm.setInt(1,obt );
            pstm.setString(2,endTime);
            float percent=((obt*100)/tMarks);
            if(percent>=45.0){
                pstm.setString(3,"Pass");
            }else{
                pstm.setString(3,"Fail");
            }
            pstm.setInt(4, eid);
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private int getObtMarks(int examId,int tMarks,int size) {
    int m=0;
    
        try {
            PreparedStatement pstm=conn.prepareStatement("select count(answer_id) from answers "
                    + "where exam_id=? and status='correct'");
            pstm.setInt(1, examId);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
               m= rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        float rat=(float)tMarks/size;
        System.out.println(rat);
        rat=m*rat;
        System.out.println(rat);
    return m=(int) rat;
    } 
    
    public Exams getResultByExamId(int examId){
        Exams exam=null;
        try {
            PreparedStatement pstm=conn.prepareStatement("select * from exams where exam_id=?");
            pstm.setInt(1, examId);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                exam=new Exams(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5)
                ,getFormatedTime(rs.getString(6)),getFormatedTime(rs.getString(7)),rs.getString(8));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exam;
        
    }
    
    public ArrayList getStudentsBySearch(String dname,String divname)
    {
    	 ArrayList list=new ArrayList();
         User user=null;
         PreparedStatement pstm;
         try {
        	 if(dname.isEmpty())
        	 {
        		 pstm=conn.prepareStatement("Select * from users where Division=?");
        		 pstm.setString(1, divname);
        	 }
        	 
        	 else if (divname.isEmpty())
        	 {
        		 pstm=conn.prepareStatement("Select * from users where Department = ?");
        		 pstm.setString(1,dname);
        		 
        	 }
        	 else
        	 {
             pstm = conn.prepareStatement("Select * from users where Department = ? and Division = ?");
             pstm.setString(1, dname);
             pstm.setString(2, divname);
        	 }
        	 
             ResultSet rs=pstm.executeQuery();
             while(rs.next()){
                 user =new User(rs.getInt(1),rs.getString(2),
                         rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10));
             list.add(user);
             }
         } catch (SQLException ex) {
             System.out.println(ex.getMessage());
             
         }
         return list;
    }
    
    public void finalize(){
        try{
            if(conn!=null)
                conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
   
}