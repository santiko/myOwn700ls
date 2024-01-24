**golekSubdomain** berfungsi untuk mencari subdomain kemudian disimpan ke file dengan nama `hosts`

`golekSubdomain url.txt`

**pisahkan** berfungsi untuk memilah URL/subdomain yang memiliki _status code_ **200** (OK) dan **301,302** (Redirect), kemudian disimpan dengan nama **2xx** untuk status OK dan **3xx** untuk _redirect_

`pisahkan hosts`

**hhi** atau _Host Header Injection_ adalah alat sederhana untuk mencari kelemahan di bagian _host_ pada **header** kemudian disimpan dalam file `hhi_vulns.txt`

`hhi --d 3xx`

**hhi-check** berfungsi untuk membuktikan hasil dari **hhi** 

`hhi-check test.vulnwebphp.net`
