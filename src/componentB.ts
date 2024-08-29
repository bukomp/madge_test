import { HelperB } from './helperB';
import { ComponentA } from './componentA';
export class ComponentB {
  helper: HelperB;

  constructor() {
    this.helper = new HelperB();
  }
}