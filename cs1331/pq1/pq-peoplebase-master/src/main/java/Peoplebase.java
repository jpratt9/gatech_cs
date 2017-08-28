public class Peoplebase {
	private Person[] people;

	public Peoplebase(Person... people) {
		this.people = people;
	}

	public Person findByName(String n) {
		for(Person p : this.people) {
			if(p.getName().equals(n)) {
				return p;
			}
		}
		return null;
	}

	public Person findByHomeTown(String h) {
		for(Person p : this.people) {
			if(p.getHomeTown().equals(h)) {
				return p;
			}
		}
		return null;
	}
}