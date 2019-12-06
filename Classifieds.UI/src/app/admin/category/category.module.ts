import { NgModule } from "@angular/core";
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { CategoryTableComponent } from './category-table/category-table.component';
import { ViewEditComponent } from './view-edit/view-edit.component';
import { DeleteCategoryComponent } from './delete-category/delete-category.component';
import { AddCategoryComponent } from './add-category/add-category.component';
import { SharedModule } from 'src/app/shared/shared.module';

@NgModule({
    declarations:[
        CategoryTableComponent,
        ViewEditComponent,
        DeleteCategoryComponent,
        AddCategoryComponent
    ],
    imports:[
        RouterModule,
        CommonModule,
        SharedModule
    ],
    exports:[
        CategoryTableComponent,
        ViewEditComponent,
        DeleteCategoryComponent,
        AddCategoryComponent
    ]
})

export class CategoryModule{

}