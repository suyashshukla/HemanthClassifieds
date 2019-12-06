import { NgModule } from "@angular/core";
import { Routes, RouterModule } from '@angular/router';
import { MyClassifiedsComponent } from './my-classifieds.component';
import { ActiveClassifiedsComponent } from './active-classifieds/active-classifieds.component';
import { HistoryComponent } from './history/history.component';
import { CreateAdComponent } from './create-ad/create-ad.component';

const routes: Routes = [
    
    {path:'',component: MyClassifiedsComponent,children:[
        {path:'',redirectTo:'active-classifieds', pathMatch:"full"},
        {path:'active-classifieds',component:ActiveClassifiedsComponent},
        {path:'history',component:HistoryComponent},
        {path:'create',component:CreateAdComponent}
    ]},
]
@NgModule({
    imports:[RouterModule.forChild(routes)],
    exports:[RouterModule]
})

export class MyClassifiedsModuleRouting{

}