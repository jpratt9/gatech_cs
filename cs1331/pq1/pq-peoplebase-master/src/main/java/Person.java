public class Person {
	private String name;
	private String hometown;

	public Person(String name, String hometown){
		this.name = name;
		this.hometown = hometown;
	}

	public String toString(){
		return name + " from " + hometown;
	}

	public String getName(){
		return name;
	}

	public String getHomeTown(){
		return hometown;
	}
}