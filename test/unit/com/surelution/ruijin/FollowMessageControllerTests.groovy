package com.surelution.ruijin



import org.junit.*
import grails.test.mixin.*

@TestFor(FollowMessageController)
@Mock(FollowMessage)
class FollowMessageControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/followMessage/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.followMessageInstanceList.size() == 0
        assert model.followMessageInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.followMessageInstance != null
    }

    void testSave() {
        controller.save()

        assert model.followMessageInstance != null
        assert view == '/followMessage/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/followMessage/show/1'
        assert controller.flash.message != null
        assert FollowMessage.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/followMessage/list'

        populateValidParams(params)
        def followMessage = new FollowMessage(params)

        assert followMessage.save() != null

        params.id = followMessage.id

        def model = controller.show()

        assert model.followMessageInstance == followMessage
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/followMessage/list'

        populateValidParams(params)
        def followMessage = new FollowMessage(params)

        assert followMessage.save() != null

        params.id = followMessage.id

        def model = controller.edit()

        assert model.followMessageInstance == followMessage
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/followMessage/list'

        response.reset()

        populateValidParams(params)
        def followMessage = new FollowMessage(params)

        assert followMessage.save() != null

        // test invalid parameters in update
        params.id = followMessage.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/followMessage/edit"
        assert model.followMessageInstance != null

        followMessage.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/followMessage/show/$followMessage.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        followMessage.clearErrors()

        populateValidParams(params)
        params.id = followMessage.id
        params.version = -1
        controller.update()

        assert view == "/followMessage/edit"
        assert model.followMessageInstance != null
        assert model.followMessageInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/followMessage/list'

        response.reset()

        populateValidParams(params)
        def followMessage = new FollowMessage(params)

        assert followMessage.save() != null
        assert FollowMessage.count() == 1

        params.id = followMessage.id

        controller.delete()

        assert FollowMessage.count() == 0
        assert FollowMessage.get(followMessage.id) == null
        assert response.redirectedUrl == '/followMessage/list'
    }
}
