customElements.define('eventofeed', class EventoNome extends HTMLElement {
    constructor() {
        super();
        this.shadow = this.attachShadow({ mode: 'open' });
    }

    connectedCallback() {
        const nomeEvento = this.getAttribute('nome');
        this.shadow.innerHTML = `
      <div class="evento-nome">
        <h2>${nomeEvento}</h2>
      </div>
    `;
    }
});