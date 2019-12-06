import { Component, OnInit, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-filter-bar',
  templateUrl: './filter-bar.component.html',
  styleUrls: ['./filter-bar.component.css'],

})
export class FilterBarComponent implements OnInit {
  @Output() activeemit: EventEmitter<boolean> = new EventEmitter<boolean>();
   active = true;
   items: string[] = [
    'The first choice!',
    'And another choice for you.',
    'but wait! A third!'
  ];
  constructor() { }

  ngOnInit() {
  }
  toggle() {
      this.active = (this.active === true) ? false : true;
      this.activeemit.emit(this.active);
  }
  // onHidden(): void {
  //   console.log('Dropdown is hidden');
  // }
  // onShown(): void {
  //   console.log('Dropdown is shown');
  // }
  // isOpenChange(): void {
  //   console.log('Dropdown state is changed');
  // }

}
