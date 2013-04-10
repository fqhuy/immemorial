package imserver

class Tweet {
	String text
	Date timeStamp
	static belongsTo = [owner : Subject]
    static constraints = {
    }
}
