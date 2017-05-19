(function(){
    class RemoteDiv extends HTMLElement {
        constructor() {
            super();
        }
        connectedCallback() {
            var req = new XMLHttpRequest(),
                remote_div = this,
                src = this.getAttribute('data-src');

            remote_div.setAttribute('data-stage', 'loading');

            if (!src) return;

            req.addEventListener('load', function() {
                if (req.status == 200) {
                    remote_div.innerHTML = req.responseText;
                    remote_div.setAttribute('data-stage', 'complete');
                } else {
                    remote_div.setAttribute('data-stage', 'error');
                }
            });

            req.open('GET', src, true);
            req.send(null);
        }
    }
    customElements.define('remote-div', RemoteDiv);
}());
