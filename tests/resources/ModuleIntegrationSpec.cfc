component extends="coldbox.system.testing.BaseTestCase" {

    function beforeAll() {
        super.beforeAll();
        
        getController().getModuleService()
            .registerAndActivateModule( "verify-csrf-interceptor", "testingModuleRoot" );
    }

    /**
    * @beforeEach
    */
    function setupIntegrationTest() {
        setup();
    }

}
