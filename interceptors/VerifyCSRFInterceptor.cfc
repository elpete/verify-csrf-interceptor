/**
* Verifies the CSRF token on all non-GET requests
*/
component extends="coldbox.system.Interceptor"{
    
    public void function configure() {}

    public void function preEvent( event, interceptData, buffer ) {
        if ( event.getHTTPMethod() == "GET" ) {
            return;
        }

        if ( actionMarkedToSkip( event, interceptData ) ) {
            return;
        }

        if ( ! event.valueExists( "_token" ) ) {
            throw(
                type = "TokenMismatchException",
                message = "The CSRF token was not included."
            );
        }

        if ( ! CSRFVerifyToken( event.getValue( "_token" ) ) ) {
            throw(
                type = "TokenMismatchException",
                message = "The CSRF token is invalid."
            );
        }
    }

    private boolean function actionMarkedToSkip(
        required event,
        required struct interceptData
    ) {
        var handler = getController()
            .getHandlerService()
            .getRegisteredHandler( interceptData.processedEvent );

        var md = getComponentMetadata(
            "#handler.getInvocationPath()#.#handler.getHandler()#"
        );

        var funcs = arrayFilter( md.functions, function( func ) {
            return func.name == handler.getMethod();
        } );

        if ( NOT arrayIsEmpty( funcs ) ) {
            if ( structKeyExists( funcs[1], "skipCSRFCheck" ) ) {
                return true;
            }
        }

        return false;
    }


    
}
