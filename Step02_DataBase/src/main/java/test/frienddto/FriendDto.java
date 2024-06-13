package test.frienddto;

public class FriendDto {
	private int num;
	private String name;
	private String phonenum;
	
	public FriendDto() {}
	
	public FriendDto(int num, String name, String phonenum) {
		this.num=num;
		this.name=name;
		this.phonenum=phonenum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	
	
}
