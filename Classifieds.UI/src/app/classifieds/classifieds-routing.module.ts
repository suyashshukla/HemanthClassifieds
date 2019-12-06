import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ClassifiedsComponent } from './classifieds.component';
import { SaleRentComponent } from './sale-rent/sale-rent.component';
import { RequiredComponent } from './required/required.component';
import { AdComponent } from '../shared/ad/ad.component';

const routes: Routes = [
  {
    path: '',
    component: ClassifiedsComponent,
    children : [
      {path: '', redirectTo: 'sale-rent', pathMatch: 'full'},
      {path: 'required', component: RequiredComponent},
      {path:  'sale-rent/ad/:id', component: AdComponent},
       {path: 'sale-rent', component: SaleRentComponent}
    ]
}
];

@NgModule({
  imports: [
    RouterModule.forChild(routes),
  ],
  exports: [RouterModule]
})
export class ClassifiedsRoutingModule { }
