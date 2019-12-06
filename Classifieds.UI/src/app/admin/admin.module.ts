import { NgModule } from "@angular/core";
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { AdminComponent } from './admin.component';
import { ReportedAdsComponent } from './reported-ads/reported-ads.component';
import { AdsListsComponent } from './ads-lists/ads-lists.component';
import { CategoryComponent } from './category/category.component';
import { CategoryModule } from './category/category.module';
import { AdminRoutingModule } from './admin-routing.module';
import { SharedModule } from '../shared/shared.module';

@NgModule({
    declarations:[
        AdminComponent,
        ReportedAdsComponent,
        AdsListsComponent,
        CategoryComponent,
    ],
    imports:[
        RouterModule,
        CommonModule,
        CategoryModule,
        AdminRoutingModule,
        SharedModule
    ]
})

export class AdminModule{

}