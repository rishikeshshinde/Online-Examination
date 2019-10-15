/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myPackage.classes;


public class Department {
    
   private String dname;

   public Department(String dname) {
       this.dname = dname;
   }
   
   public Department() {
   }
   
    public String getDname() {
	   return dname;
   }
    
    public void setDname(String dname) {
	   this.dname = dname;
}
	
}
