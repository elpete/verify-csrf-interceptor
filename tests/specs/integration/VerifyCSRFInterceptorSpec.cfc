component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {
    function run() {
        describe( "Verify CSRF Tokens", function() {
            it( "can activate the module", function() {
                expect( getController().getModuleService().isModuleRegistered( "verify-csrf-interceptor" ) ).toBeTrue();
            } );

            it( "does not verify GET requests", function() {
                expect( function() {
                    execute( event = "Main.index", renderResults = true );
                } ).notToThrow( "TokenMismatchException" );
            } );

            it( "verifies POST requests", function() {
                prepareMock( getRequestContext() ).$( "getHTTPMethod", "POST" );
                expect( function() {
                    execute( event = "Main.shouldVerifyCSRF", renderResults = true );
                } ).toThrow( "TokenMismatchException" );
            } );

            it( "skips actions marked `skipCSRFCheck`", function() {
                prepareMock( getRequestContext() ).$( "getHTTPMethod", "PUT" );
                expect( function() {
                    execute( event = "Main.shouldSkipCSRF", renderResults = true );
                } ).notToThrow( "TokenMismatchException" );
            } );
        } );
    }
}