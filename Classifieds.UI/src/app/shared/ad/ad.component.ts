import { Component, OnInit, OnDestroy } from '@angular/core';
import { Location } from '@angular/common';
import { ClassifiedService } from 'src/app/classifieds/classified.service';
import { AdInfo } from 'src/app/classifieds/Models/adinfo.model';
import { Image } from 'src/app/classifieds/Models/image.model';
import { ActivatedRoute } from '@angular/router';



@Component({
  selector: 'app-ad',
  templateUrl: './ad.component.html',
  styleUrls: ['./ad.component.css']
})
export class AdComponent implements OnInit {
  ad: AdInfo= new AdInfo();
  imageLinks: string[];
  images: Image[];
  id: number;
  isDataLoaded: boolean= false;
  constructor(private location: Location, private route: ActivatedRoute, private classifiedService: ClassifiedService) { }

  ngOnInit() {
    this.id = this.route.snapshot.params['id'];
    this.getAd(this.id);
    
    // this.paramSubscription = this.route.params
    // .subscribe(
    //   (params: Params) => {
    //     this.id = params['id'];
    //     this.getAd(this.id); 
    //   }
    // );
  }
  goBack() {
    this.location.back();
  }
  onImageSelected(url: string) {
    console.log(url + 'selected');
  }
  getAd(id: number): void {
    this.classifiedService.getAd(id)
    .subscribe(ad =>{this.ad = ad;
      this.getImages();
      this.isDataLoaded=true;
    });
    } 
    getImages():void{
      this.imageLinks = this.ad.imageUrls.map(a => a.url);  
  }
//   ngOnDestroy() {
//     this.paramSubscription.unsubscribe();
// }
}
