package imserver

class User {
	String name
	String fullName
	String shortBio
	
	static hasMany = [tweets: Tweet]
	
    static constraints = {
		name(blank: false, unique: true)
    }
}
