package com.surelution.ruijin



import org.junit.*
import grails.test.mixin.*

@TestFor(KeyedMessageController)
@Mock(KeyedMessage)
class KeyedMessageControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/keyedMessage/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.keyedMessageInstanceList.size() == 0
        assert model.keyedMessageInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.keyedMessageInstance != null
    }

    void testSave() {
        controller.save()

        assert model.keyedMessageInstance != null
        assert view == '/keyedMessage/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/keyedMessage/show/1'
        assert controller.flash.message != null
        assert KeyedMessage.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/keyedMessage/list'

        populateValidParams(params)
        def keyedMessage = new KeyedMessage(params)

        assert keyedMessage.save() != null

        params.id = keyedMessage.id

        def model = controller.show()

        assert model.keyedMessageInstance == keyedMessage
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/keyedMessage/list'

        populateValidParams(params)
        def keyedMessage = new KeyedMessage(params)

        assert keyedMessage.save() != null

        params.id = keyedMessage.id

        def model = controller.edit()

        assert model.keyedMessageInstance == keyedMessage
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/keyedMessage/list'

        response.reset()

        populateValidParams(params)
        def keyedMessage = new KeyedMessage(params)

        assert keyedMessage.save() != null

        // test invalid parameters in update
        params.id = keyedMessage.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/keyedMessage/edit"
        assert model.keyedMessageInstance != null

        keyedMessage.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/keyedMessage/show/$keyedMessage.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        keyedMessage.clearErrors()

        populateValidParams(params)
        params.id = keyedMessage.id
        params.version = -1
        controller.update()

        assert view == "/keyedMessage/edit"
        assert model.keyedMessageInstance != null
        assert model.keyedMessageInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/keyedMessage/list'

        response.reset()

        populateValidParams(params)
        def keyedMessage = new KeyedMessage(params)

        assert keyedMessage.save() != null
        assert KeyedMessage.count() == 1

        params.id = keyedMessage.id

        controller.delete()

        assert KeyedMessage.count() == 0
        assert KeyedMessage.get(keyedMessage.id) == null
        assert response.redirectedUrl == '/keyedMessage/list'
    }
}
