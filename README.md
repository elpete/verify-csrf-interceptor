# verify-csrf-interceptor

If you are like me, you often forget to include a CSRF token in each form (`csrfGenerateToken()`) and to check for one in each of your handlers that handle the form submissions (`csrfVerifyToken()`).  This interceptor checks for a CSRF token on all non-GET requests to help you out with this. (You will still need to add a `csrfGenerateToken()` call to your forms.)

If you find you need a handler to skip the CSRF token check, you can mark the method with the `skipCSRFCheck` metadata.

```
component {

	function handle( event, rc, prc ) skipCSRFCheck=true {

	}

}
```
