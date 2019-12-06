import { Component, OnInit } from '@angular/core';
import { CategoryAttributes } from '../category-table.model';
import { CategoryService } from '../category.service';

@Component({
  selector: 'app-category-table',
  templateUrl: './category-table.component.html',
  styleUrls: ['./category-table.component.css'],
  providers:[CategoryService]
})
export class CategoryTableComponent implements OnInit {
  
  private CategoryTable:CategoryAttributes[];
  constructor(private CategoryService:CategoryService) {
   }

  ngOnInit() {
    this.CategoryTable = this.CategoryService.returnCategoryData();
  }

}
