import { defineCustomElement } from "vue";

import { HelloWorld } from "@needlify/ui";

// import './styles/app.css';

customElements.define("hello-world", defineCustomElement(HelloWorld));
