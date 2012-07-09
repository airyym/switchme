package switchme



import org.junit.*
import grails.test.mixin.*

@TestFor(SMThreadController)
@Mock(SMThread)
class SMThreadControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/SMThread/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.SMThreadInstanceList.size() == 0
        assert model.SMThreadInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.SMThreadInstance != null
    }

    void testSave() {
        controller.save()

        assert model.SMThreadInstance != null
        assert view == '/SMThread/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/SMThread/show/1'
        assert controller.flash.message != null
        assert SMThread.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/SMThread/list'


        populateValidParams(params)
        def SMThread = new SMThread(params)

        assert SMThread.save() != null

        params.id = SMThread.id

        def model = controller.show()

        assert model.SMThreadInstance == SMThread
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/SMThread/list'


        populateValidParams(params)
        def SMThread = new SMThread(params)

        assert SMThread.save() != null

        params.id = SMThread.id

        def model = controller.edit()

        assert model.SMThreadInstance == SMThread
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/SMThread/list'

        response.reset()


        populateValidParams(params)
        def SMThread = new SMThread(params)

        assert SMThread.save() != null

        // test invalid parameters in update
        params.id = SMThread.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/SMThread/edit"
        assert model.SMThreadInstance != null

        SMThread.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/SMThread/show/$SMThread.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        SMThread.clearErrors()

        populateValidParams(params)
        params.id = SMThread.id
        params.version = -1
        controller.update()

        assert view == "/SMThread/edit"
        assert model.SMThreadInstance != null
        assert model.SMThreadInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/SMThread/list'

        response.reset()

        populateValidParams(params)
        def SMThread = new SMThread(params)

        assert SMThread.save() != null
        assert SMThread.count() == 1

        params.id = SMThread.id

        controller.delete()

        assert SMThread.count() == 0
        assert SMThread.get(SMThread.id) == null
        assert response.redirectedUrl == '/SMThread/list'
    }
}
