# verify-csrf-interceptor

[![Master Branch Build Status](https://img.shields.io/travis/elpete/verify-csrf-interceptor/master.svg?style=flat-square&label=master)](https://travis-ci.org/elpete/verify-csrf-interceptor)

## Verifies the CSRF token on all non-GET requests

Include `CSRFGenerateToken()` inside a `_token` hidden input to help prevent CSRF attacks.

Mark methods to be skipped using the `skipCSRFCheck` metadata on the handler action.