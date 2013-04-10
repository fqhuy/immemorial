package imserver

import org.springframework.dao.DataIntegrityViolationException

class TweetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tweetInstanceList: Tweet.list(params), tweetInstanceTotal: Tweet.count()]
    }

    def create() {
        [tweetInstance: new Tweet(params)]
    }

    def save() {
        def tweetInstance = new Tweet(params)
        if (!tweetInstance.save(flush: true)) {
            render(view: "create", model: [tweetInstance: tweetInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tweet.label', default: 'Tweet'), tweetInstance.id])
        redirect(action: "show", id: tweetInstance.id)
    }

    def show(Long id) {
        def tweetInstance = Tweet.get(id)
        if (!tweetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tweet.label', default: 'Tweet'), id])
            redirect(action: "list")
            return
        }

        [tweetInstance: tweetInstance]
    }

    def edit(Long id) {
        def tweetInstance = Tweet.get(id)
        if (!tweetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tweet.label', default: 'Tweet'), id])
            redirect(action: "list")
            return
        }

        [tweetInstance: tweetInstance]
    }

    def update(Long id, Long version) {
        def tweetInstance = Tweet.get(id)
        if (!tweetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tweet.label', default: 'Tweet'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tweetInstance.version > version) {
                tweetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tweet.label', default: 'Tweet')] as Object[],
                          "Another user has updated this Tweet while you were editing")
                render(view: "edit", model: [tweetInstance: tweetInstance])
                return
            }
        }

        tweetInstance.properties = params

        if (!tweetInstance.save(flush: true)) {
            render(view: "edit", model: [tweetInstance: tweetInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tweet.label', default: 'Tweet'), tweetInstance.id])
        redirect(action: "show", id: tweetInstance.id)
    }

    def delete(Long id) {
        def tweetInstance = Tweet.get(id)
        if (!tweetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tweet.label', default: 'Tweet'), id])
            redirect(action: "list")
            return
        }

        try {
            tweetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tweet.label', default: 'Tweet'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tweet.label', default: 'Tweet'), id])
            redirect(action: "show", id: id)
        }
    }
}
