import { HelperA } from './helperA';

export class ComponentA {
  helper: HelperA;

  constructor() {
    this.helper = new HelperA();
  }
}