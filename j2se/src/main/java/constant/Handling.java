package constant;

public enum Handling {
	BEFORE("before"), AFTER("after"), AROUND("around");

	private final String type;

	private Handling(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

}
