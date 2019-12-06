import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { Ad } from 'src/app/classifieds/Models/ad.model';
// import { Ads } from 'src/app/classifieds/Models/Ads';
import { AdInfo } from './Models/adinfo.model';
import { Publisher } from './Models/publisher.model';
import { Image } from './Models/image.model';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class ClassifiedService {
  adInfo: AdInfo;
  // adInfo: AdInfo ;={
  //   Id: 1,
  //   UserId: 1,
  //   CategoryId: 1,
  //   Type: 1,
  //   Status: 1,
  //   CategoryIconUri: 'fas fa-motorcycle',
  //   CategoryName:'VEHICLE',
  //   PostedOn: new Date('2019-05-18'),
  //   Price: 83700,
  //   Title: 'Yamaha YZF R15',
  //   ImageUrls:  [
  //     {url:'bike-yamaha.jpg'},
  //     {url:'bike-yamaha1.jpg'},
  //     {url:'harley.jpg'},
  //     {url:'bike-yamaha.jpg'},
  //     {url:'bike-yamaha.jpg'},
  //     {url:'bike-yamaha.jpg'}
  //   ],
  //   FieldValues: [
  //   {"FieldName":"Milage","FieldValue":"200"}
  //   ],
  //   OfferCount: 12,
  //   CommentCount: 18,
  //   Description: 'The Yamaha R15 v3 is a premium fully faired motorcycle in the 150cc segment.',
  //   ExpiryDate: new Date('2019-05-18'),
  //   ContactFlag: true,
  //   RemovedReason: null,
  //   RemovedBy: null,
  //   RemovedOn: null
  
  // };
  publisher:Publisher={
    id:1,
    name:'Rajesh Ram Krishna',
    icon:'../assets/icon/user-icon.png',
    phone: 965430990,
    mail: 'rajesh.ram@xyz.com',
    location: 'Hyderabad Corp office'
  }
  // images: Image[] = [
  //   {url:'bike-yamaha.jpg'},
  //   {url:'bike-yamaha1.jpg'},
  //   {url:'harley.jpg'},
  //   {url:'bike-yamaha.jpg'},
  //   {url:'bike-yamaha.jpg'},
  //   {url:'bike-yamaha.jpg'}
  // ];
  constructor(private http:HttpClient) { }

  getAds(): Observable<Ad[]> {
   return  this.http.get<Ad[]>('http://localhost:50763/api/ad');
  // console.log(new Date());
  // return of(Ads);
  }
   
  getAd(id):Observable<AdInfo>{
   return this.http.get<AdInfo>('http://localhost:50763/api/ad/'+id);
  
  }
  getUser(id:number):Observable<Publisher>{
     return of(this.publisher);
  }
  
  updateStatus(id:number):void{
       //pass
  }
}
