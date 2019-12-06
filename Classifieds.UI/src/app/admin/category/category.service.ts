import { Injectable } from '@angular/core';
import { CategoryAttributes } from './category-table.model';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  CategoryTable:CategoryAttributes[] = [];

  constructor() {
    this.CategoryTable = [
      {
        category:"Property",
        description:"This category is real property related",
        createdBy:"System defined",
        createdOn:new Date("2019-04-22"),

      },
      {
        category:"Electronics",
        description:"This category is real electronics related",
        createdBy:"System defined",
        createdOn:new Date("2019-04-22")
      },
      {
        category:"Vehicle",
        description:"This category is real vehicle related",
        createdBy:"System defined",
        createdOn:new Date("2019-04-22")
      },
      {
        category:"Books",
        description:"This category is real books related",
        createdBy:"System defined",
        createdOn:new Date("2019-04-22")
      },
      {
        category:"Entertainment",
        description:"This category is real Entertainment related",
        createdBy:"System defined",
        createdOn:new Date("2019-04-22")
      }
    ]
   }

   returnCategoryData(){
     return this.CategoryTable;
   }

   addCategory(Category:CategoryAttributes){
    this.CategoryTable.push(Category);
   }
}
