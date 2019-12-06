import { Component, OnInit } from '@angular/core';
import { Ad } from 'src/app/classifieds/Models/ad.model';
import { ClassifiedService } from 'src/app/classifieds/classified.service';
@Component({
  selector: 'app-list-layout',
  templateUrl: './list-layout.component.html',
  styleUrls: ['./list-layout.component.css']
})
export class ListLayoutComponent implements OnInit {
  ads: Ad[];
  constructor(private classifiedService: ClassifiedService) { }

  ngOnInit() {
    this.getAds();
  }
  getAds(): void {
    this.classifiedService.getAds()
        .subscribe(ads => this.ads = ads);
  }
}
