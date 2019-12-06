import { Component, OnInit, ViewChild } from '@angular/core';
import { CategoryService } from '../category.service';
import { CategoryAttributes } from '../category-table.model';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-add-category',
  templateUrl: './add-category.component.html',
  styleUrls: ['./add-category.component.css'],
  providers:[CategoryService]
})


export class AddCategoryComponent implements OnInit {

  @ViewChild('f',{static:true}) FormDetails:NgForm;
  constructor(private CategoryService:CategoryService) { }
  FilledCategoryDetails:CategoryAttributes;
  ngOnInit() {
  }

  onSubmit(){
    console.log("hello");
    console.log(this.FormDetails);
  }


}
