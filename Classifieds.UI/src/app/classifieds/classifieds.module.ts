import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ClassifiedsComponent } from './classifieds.component';
import { SaleRentComponent } from './sale-rent/sale-rent.component';
import { RequiredComponent } from './required/required.component';
import { ClassifiedsRoutingModule } from './classifieds-routing.module';
import { SharedModule } from '../shared/shared.module';

@NgModule({
    declarations: [
        ClassifiedsComponent,
        SaleRentComponent,
        RequiredComponent
    ],
    imports: [
        RouterModule,
        ClassifiedsRoutingModule,
        SharedModule
    ],
    
})

export class ClassifiedsModule {
}
