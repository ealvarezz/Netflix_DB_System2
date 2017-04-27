package netflix_engine.model;

/**
 *Field     | Type     | Null | Key | Default | Extra          |
+-----------+----------+------+-----+---------+----------------+
| PersonId  | int(11)  | NO   | PRI | NULL    | auto_increment |
| LastName  | char(24) | NO   |     | NULL    |                |
| FirstName | char(24) | NO   |     | NULL    |                |
| Address   | char(50) | NO   |     | NULL    |                |
| City      | char(24) | NO   |     | NULL    |                |
| State     | char(2)  | NO   |     | NULL    |                |
| Zip       | char(5)  | NO   |     | NULL    |                |
| Telephone | char(15) | NO   |     | NULL    |                |
+-----------+----------+------+-----+---------+----------------+ 
 **/


public class Person {
	protected int personID; 
	protected String firstName;
	protected String lastName;
	protected String address;
	protected String city;
	protected String state;
	protected String zip;
	protected String telephone;
	
	public int getPersonID() {
		return personID;
	}
	public void setPersonID(int personID) {
		this.personID = personID;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
}
