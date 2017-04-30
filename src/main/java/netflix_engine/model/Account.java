package netflix_engine.model;

/**
 * +-------------+----------+------+-----+---------+----------------+
| Field       | Type     | Null | Key | Default | Extra          |
+-------------+----------+------+-----+---------+----------------+
| AcctNum     | int(11)  | NO   | PRI | NULL    | auto_increment |
| AcctType    | char(20) | NO   |     | NULL    |                |
| AccountDate | date     | NO   |     | NULL    |                |
| CustomerId  | char(64) | NO   | MUL | NULL    |                |
+-------------+----------+------+-----+---------+----------------+
 *
 */

import java.sql.Date;
/* Try importing this below if the one above doesn't work 
 * 				import java.util.Date;
 */


public class Account {
	private Integer acctNum;
	private String acctType;
	private Date accountDate;
	private Customer customer;
	
	public int getAcctNum() {
		return acctNum;
	}
	public void setAcctNum(int acctNum) {
		this.acctNum = acctNum;
	}
	public String getAcctType() {
		return acctType;
	}
	public void setAcctType(String acctType) {
		this.acctType = acctType;
	}
	public Date getAccountDate() {
		return accountDate;
	}
	public void setAccountDate(Date accountDate) {
		this.accountDate = accountDate;
	}
	
	
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
}
