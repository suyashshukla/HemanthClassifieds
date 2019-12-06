import { NgModule } from '@angular/core';
import {Routes, RouterModule} from '@angular/router';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';

const appRoutes: Routes = [
    {path:'',redirectTo:'classifieds', pathMatch:"full"},
    {path:'classifieds', loadChildren:'./classifieds/classifieds.module#ClassifiedsModule'},
    {path:'myclassifieds', loadChildren:'./my-classifieds/my-classifieds.module#MyClassifiedsModule'},
    {path:'inbox', loadChildren:'./inbox/inbox.module#InboxModule'},
    {path:'admin', loadChildren:'./admin/admin.module#AdminModule'},
    {path:'not-found', component:PageNotFoundComponent},
    {path:'**', redirectTo:'not-found'}
    ];

@NgModule({ 
    imports:[
        RouterModule.forRoot(appRoutes)
    ],
    exports: [RouterModule]
})


export class AppRoutingModule{

}