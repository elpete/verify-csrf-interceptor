/**
* Verifies the CSRF token on all non-GET requests
*/
component extends="coldbox.system.Interceptor" {

    property name="handlerService" inject="coldbox:handlerService";
    property name="coldboxVersion" inject="coldbox:fwSetting:version";

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
        if( listFirst( coldboxVersion, "." ) >= 5 ){
            var handlerBean = handlerService.getHandlerBean( event.getCurrentEvent() );
        } else {
            var handlerBean = handlerService.getRegisteredHandler( event.getCurrentEvent() );
        }

        var md = getComponentMetadata(
            "#handlerBean.getInvocationPath()#.#handlerBean.getHandler()#"
        );

        var funcs = arrayFilter( md.functions, function( func ) {
            return func.name == handlerBean.getMethod();
        } );

        if ( NOT arrayIsEmpty( funcs ) ) {
            if ( structKeyExists( funcs[1], "skipCSRFCheck" ) ) {
                return true;
            }
        }

        return false;
    }



}
