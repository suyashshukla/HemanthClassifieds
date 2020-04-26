import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-sale-rent',
  templateUrl: './sale-rent.component.html',
  styleUrls: ['./sale-rent.component.css']
})
export class SaleRentComponent implements OnInit {
  active = true;
  selectedType;
  selectedValue;
  searchQuery;
  constructor() { }

  ngOnInit() {
  }
  getVal(b: boolean) {
    this.active = b;
  }

  onItemSelected($item) {
    this.selectedType = $item.type;
    this.selectedValue = $item.value;
  }

  onSearchQuery($query) {
    this.searchQuery = $query.query;
  }
}
