package imserver

class Subject {
	String name
	String fullName
	String shortBio
	static hasMany = [tweets: Tweet]
	
    static constraints = {
    }
}
