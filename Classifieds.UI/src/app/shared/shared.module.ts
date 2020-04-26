import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FilterBarComponent } from './filter-bar/filter-bar.component';
import { AdComponent } from './ad/ad.component';
import { CommentsComponent } from './ad/comments/comments.component';
import { ImageSliderComponent } from './ad/image-slider/image-slider.component';
import { PublisherCardComponent } from './ad/publisher-card/publisher-card.component';
import { GridLayoutComponent } from './grid-layout/grid-layout.component';
import { ListLayoutComponent } from './list-layout/list-layout.component';
import { AdCardGridComponent } from './grid-layout/ad-card-grid/ad-card-grid.component';
import { AdCardListComponent } from './list-layout/ad-card-list/ad-card-list.component';
import { RouterModule } from '@angular/router';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { ImageCarouselComponent } from './ad/image-carousel/image-carousel.component';
@NgModule({
  declarations: [
    FilterBarComponent,
    AdComponent,
    CommentsComponent,
    ImageSliderComponent,
    PublisherCardComponent,
    GridLayoutComponent,
    ListLayoutComponent,
    AdCardGridComponent,
    AdCardListComponent,
    ImageSliderComponent,
    ImageCarouselComponent,

  ],
  imports: [CommonModule,
    RouterModule,
    FormsModule,
    ReactiveFormsModule],
  exports: [
    FilterBarComponent,
    CommonModule,
    AdComponent,
    CommentsComponent,
    ImageSliderComponent,
    PublisherCardComponent,
    GridLayoutComponent,
    ListLayoutComponent,
    AdCardGridComponent,
    AdCardListComponent,
    ImageSliderComponent,
    ReactiveFormsModule
  ],
})
export class SharedModule { }
