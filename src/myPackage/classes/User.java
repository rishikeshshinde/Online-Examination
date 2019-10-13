
package myPackage.classes;


public class User {
   private int userId;
   private String firstName,lastName,userName,email,password,type,dept,roll_no,div;

   public User(){
       
   }
   
    public User(int userId, String firstName, String lastName, String userName, String password, String email, String type, String dept, String roll_no, String div) 
    {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.type = type;
        this.dept = dept;
        this.roll_no = roll_no;
        this.div = div;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getroll() {
        return roll_no;
    }

    public void setroll(String roll_no) {
        this.roll_no = roll_no;
    }

    public String getdiv() {
        return div;
    }

    public void setdiv(String div) {
        this.div = div;
    }

   
}
