import { ComponentB } from './componentB';
export class HelperA {
  componentB: ComponentB;

  constructor() {
      this.componentB = new ComponentB();
  }
}