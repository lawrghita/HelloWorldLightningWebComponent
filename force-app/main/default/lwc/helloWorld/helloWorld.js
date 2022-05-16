import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
    greeting = 'World1';
    changeHandler(event) {
      this.greeting = event.target.value;
    }
}