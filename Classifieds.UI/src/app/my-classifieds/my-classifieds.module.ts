import { NgModule } from "@angular/core";
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { MyClassifiedsComponent } from './my-classifieds.component';
import { ActiveClassifiedsComponent } from './active-classifieds/active-classifieds.component';
import { HistoryComponent } from './history/history.component';
import { ItemDetailsComponent } from './create-ad/item-details/item-details.component';
import { AddImagesComponent } from './create-ad/add-images/add-images.component';
import { PublishingDetailsComponent } from './create-ad/publishing-details/publishing-details.component';
import { CreateAdComponent } from './create-ad/create-ad.component';
import { MyClassifiedsModuleRouting } from './my-classifieds-routing.module';
import { SharedModule } from '../shared/shared.module';
import { SliderComponent } from './Slider';

@NgModule({
  declarations: [
    MyClassifiedsComponent,
    ActiveClassifiedsComponent,
    HistoryComponent,
    ItemDetailsComponent,
    AddImagesComponent,
    PublishingDetailsComponent,
    CreateAdComponent,
    SliderComponent
  ],
  imports: [
    RouterModule,
    CommonModule,
    MyClassifiedsModuleRouting,
    SharedModule
  ]
})

export class MyClassifiedsModule {

}
