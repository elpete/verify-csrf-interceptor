# verify-csrf-interceptor

[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors)
[![Master Branch Build Status](https://img.shields.io/travis/elpete/verify-csrf-interceptor/master.svg?style=flat-square&label=master)](https://travis-ci.org/elpete/verify-csrf-interceptor)

If you are like me, you often forget to include a CSRF token in each form (`csrfGenerateToken()`) and to check for one in each of your handlers that handle the form submissions (`csrfVerifyToken()`).  This interceptor checks for a CSRF token on all non-GET requests to help you out with this. (You will still need to add a `csrfGenerateToken()` call to your forms.)

If you find you need a handler to skip the CSRF token check, you can mark the method with the `skipCSRFCheck` metadata.

```
component {

	function handle( event, rc, prc ) skipCSRFCheck=true {

	}

}
```

## Contributors

Thanks goes to these wonderful people ([emoji key](https://github.com/kentcdodds/all-contributors#emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
| [<img src="https://avatars1.githubusercontent.com/u/2583646?v=4" width="100px;"/><br /><sub>Eric Peterson</sub>](https://github.com/elpete)<br />[💻](https://github.com/elpete/verify-csrf-interceptor/commits?author=elpete "Code") [📖](https://github.com/elpete/verify-csrf-interceptor/commits?author=elpete "Documentation") |
| :---: |
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification. Contributions of any kind welcome!
