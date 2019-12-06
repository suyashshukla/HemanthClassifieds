import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AdminComponent } from './admin.component';
import { ViewEditComponent } from './category/view-edit/view-edit.component';
import { ReportedAdsComponent } from './reported-ads/reported-ads.component';
import { CategoryComponent } from './category/category.component';
import { AddCategoryComponent } from './category/add-category/add-category.component';


const routes: Routes = [
  {path:'',component:AdminComponent,children:[
    {path:'',redirectTo:'reported-ads', pathMatch:"full"},
    {path:'edit',component:ViewEditComponent},
    {path:'add',component:AddCategoryComponent},
    {path:'reported-ads',component:ReportedAdsComponent},
    {path:'category',component:CategoryComponent}
  ]}
]
@NgModule({
  imports: [
    RouterModule.forChild(routes)
  ],
  exports: [RouterModule]
})
export class AdminRoutingModule { }
