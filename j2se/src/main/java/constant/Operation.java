package constant;

public enum Operation {
	BEFORE("before"), AFTER("after"), AROUND("around");

	private final String type;

	private Operation(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

}
