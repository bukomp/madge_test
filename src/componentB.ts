import { HelperB } from './helperB';
import { ComponentA } from './componentA';
export class ComponentB {
  helper: HelperB;

  constructor() {
    this.helper = new HelperB();
  }
}

const condition = true

if(condition &&1===1){
  const a = 1
}