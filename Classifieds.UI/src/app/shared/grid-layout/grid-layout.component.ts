import { Component, OnInit } from '@angular/core';
import { Ad } from 'src/app/classifieds/Models/ad.model';
import { ClassifiedService } from 'src/app/classifieds/classified.service';

@Component({
  selector: 'app-grid-layout',
  templateUrl: './grid-layout.component.html',
  styleUrls: ['./grid-layout.component.css']
})
export class GridLayoutComponent implements OnInit {

  ads: Ad[]=[];
  constructor(private classifiedService: ClassifiedService) { }

  ngOnInit() {
    this.getAds();
  }
  getAds(): void {
    this.classifiedService.getAds()
        .subscribe(ads => this.ads = ads);
  }
  checkStatus(ad:Ad) : boolean{
    if(ad.status==1){
    var d=new Date('2019-12-06').getDate();
    if(d<=0){
      this.classifiedService.updateStatus(ad.id);
      return false;
    }
    else{
      return true;
    }
  }
  else{
    return false;
  }
  }

}
