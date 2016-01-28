package com.surelution.ruijin



import org.junit.*
import grails.test.mixin.*

@TestFor(WokingTypeController)
@Mock(WokingType)
class WokingTypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/wokingType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.wokingTypeInstanceList.size() == 0
        assert model.wokingTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.wokingTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.wokingTypeInstance != null
        assert view == '/wokingType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/wokingType/show/1'
        assert controller.flash.message != null
        assert WokingType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/wokingType/list'

        populateValidParams(params)
        def wokingType = new WokingType(params)

        assert wokingType.save() != null

        params.id = wokingType.id

        def model = controller.show()

        assert model.wokingTypeInstance == wokingType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/wokingType/list'

        populateValidParams(params)
        def wokingType = new WokingType(params)

        assert wokingType.save() != null

        params.id = wokingType.id

        def model = controller.edit()

        assert model.wokingTypeInstance == wokingType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/wokingType/list'

        response.reset()

        populateValidParams(params)
        def wokingType = new WokingType(params)

        assert wokingType.save() != null

        // test invalid parameters in update
        params.id = wokingType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/wokingType/edit"
        assert model.wokingTypeInstance != null

        wokingType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/wokingType/show/$wokingType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        wokingType.clearErrors()

        populateValidParams(params)
        params.id = wokingType.id
        params.version = -1
        controller.update()

        assert view == "/wokingType/edit"
        assert model.wokingTypeInstance != null
        assert model.wokingTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/wokingType/list'

        response.reset()

        populateValidParams(params)
        def wokingType = new WokingType(params)

        assert wokingType.save() != null
        assert WokingType.count() == 1

        params.id = wokingType.id

        controller.delete()

        assert WokingType.count() == 0
        assert WokingType.get(wokingType.id) == null
        assert response.redirectedUrl == '/wokingType/list'
    }
}
