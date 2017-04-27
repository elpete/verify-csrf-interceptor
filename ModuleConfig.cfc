component {
    
    this.name = "verify-csrf-interceptor";
    this.author = "Eric Peterson";
    this.webUrl = "https://github.com/elpete/verify-csrf-interceptor";

    function configure() {
        interceptors = [
            {
                name = "VerifyCSRF",
                class = "#moduleMapping#.interceptors.VerifyCSRFInterceptor"
            }
        ];
    }

}