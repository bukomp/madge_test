import { ComponentB } from './componentB';  // This creates a circular dependency

export class HelperA {
  componentB: ComponentB;

  constructor() {
    this.componentB = new ComponentB();
  }
}