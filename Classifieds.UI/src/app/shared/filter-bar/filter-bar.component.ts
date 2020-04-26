import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { AdCategory, AdLocation, AdPosted, AdType, DropdownType } from './filter-enums';

@Component({
  selector: 'app-filter-bar',
  templateUrl: './filter-bar.component.html',
  styleUrls: ['./filter-bar.component.css'],

})
export class FilterBarComponent implements OnInit {
  @Output() activeemit: EventEmitter<boolean> = new EventEmitter<boolean>();
  @Output() onItemSelected = new EventEmitter();
  @Output() onFiltersReset = new EventEmitter();
  @Output() onSearchQuery = new EventEmitter();

  active = true;

  categories = Object.keys(AdCategory).filter(Number);
  locations = Object.keys(AdLocation).filter(Number);
  posted = Object.keys(AdPosted).filter(Number);
  types = Object.keys(AdType).filter(Number);

  selectedCategory = 'Select Category';
  selectedLocation = 'Select Location';
  selectedPosted = 'Selected Posted On';
  selectedType = 'Select Type';
  searchQuery = '';

  adCategory = AdCategory;
  adLocation = AdLocation;
  adPosted = AdPosted;
  adType = AdType;

  dropdownType = DropdownType;


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
  emitEvent(type: DropdownType, value: number) {

    let selectedValue = '';

    if (type === DropdownType.Category) {
      this.selectedCategory = AdCategory[value];
      selectedValue = AdCategory[value];
    }
    else if (type === DropdownType.Location) {
      selectedValue = AdLocation[value];
      this.selectedLocation = AdLocation[value];
    }
    else if (type === DropdownType.Posted) {
      this.selectedPosted = AdPosted[value];
      selectedValue = AdPosted[value];
    }
    else {
      this.selectedType = AdType[value];
      selectedValue = AdType[value];
    }

    this.onItemSelected.emit({ type: DropdownType[type], value: selectedValue });
  }

  resetFilter() {
    this.selectedCategory = 'Select Category';
    this.selectedPosted = 'Select Posted On';
    this.selectedLocation = 'Select Location';
    this.selectedType = 'Select Ad Type';
    this.onItemSelected.emit({});
  }

  onSearchPerformed(query) {
    this.onSearchQuery.emit({ query: query });
  }
}
