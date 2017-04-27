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
	private int acctNum;
	private String acctType;
	private Date accountDate;
	private String customerId;
	
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
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
}
