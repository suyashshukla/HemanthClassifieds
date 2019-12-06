import { Injectable} from '@angular/core';
import { OfferDetails } from './models/offer-details.model';
import { ReportedAds } from './models/reported-ads.model';
import { ExpiredAds } from './models/expired-ads.model';
import { DeletedAds } from './models/deleted-ads.model';
import { Chat } from './models/chat.model';


@Injectable({
  providedIn: 'root'
})
export class InboxService {

  taskbarOptions:string[] = ['Offers','Reports','Ad Expired','Deleted Items'];
  chat:Chat[] = [];
  displayChat:boolean;
  displayReason:boolean;
  offerId:number = 0;
  activeOption:string = "Offers";
  offerDetails: OfferDetails[] = [];
  reportedAdDetails:ReportedAds[] = [];
  expiredAdDetails:ExpiredAds[] = [];
  deletedAdDetails:DeletedAds[] = [];
  chatDetails:Chat[] = [];
    
  constructor() {
    this.displayChat = false;
    this.displayReason = false;
    
    this.offerDetails = [{
      offerId:1,
      userName:'Yash Bhatia',
      adName:'Yamaha R15',
        adThumbnail:'./assets/images/yamaha.jpg',
      amount:75000,
      time:new Date("2019-07-16")
    },
    {
      offerId:2,
      userName:'Krishna Agarwal',
      adName:'XBOX 360',
        adThumbnail:'./assets/images/xbox.jpg',
      amount:35000,
      time:new Date("2019-08-22")
    },
    {
      offerId:3,
      userName:'Bala Murugan',
      adName:'Apple Macbook Pro',
        adThumbnail:'./assets/images/macbook.png',
      amount:100000,
      time:new Date("2019-09-28")
    }, 
    ];

    this.reportedAdDetails = [{
      adName:"POCO F1",
        adThumbnail:"./assets/images/poco.jpg",
      removedBy:"admin",
      time:new Date("2019-09-12")
    }];

    this.expiredAdDetails = [{
      adName:"POCO F1",
        adThumbnail:"./assets/images/poco.jpg",
      removedBy:"admin",
      status:"Expired",
      time:new Date("2019-09-12")
    },
    {
      adName:"Iphone X",
        adThumbnail:"./assets/images/iphone.jpg",
      removedBy:"you",
      status:"Removed",
      time:new Date("2019-10-17")
    },
    {
      adName:"MI Band 4",
        adThumbnail:"./assets/images/band.jpg",
      removedBy:"Expired",
      status:"Removed",
      time:new Date("2019-11-1")
    }];

    this.deletedAdDetails = [{
      adName:"Iphone X",
        adThumbnail:"./assets/images/iphone.jpg",
      time:new Date("2019-08-12")
    }];

    this.chatDetails = [{
      offerId:1,
      userName:"Yash Bhatia",
      message:"Hi, My offer amount is 75,000 for this bike",
      time:new Date("2019-07-16")
    },
    {
      offerId:1,
      userName:"Rajesh",
      message:"But, My Final amount is 75,000",
      time:new Date("2019-07-16")
    },
    {
      offerId:1,
      userName:"Yash Bhatia",
      message:"Sorry, Can't increase my offer this is my final too",
      time:new Date("2019-07-16")
    },
    {
      offerId:1,
      userName:"Rajesh",
      message:"okay no problem, have a good day!!",
      time:new Date("2019-08-22")
    },
    {
      offerId:2,
      userName:"Krishna Agarwal",
      message:"Hi, My offer amount is 35,000",
      time:new Date("2019-08-22")
    },
    {
      offerId:2,
      userName:"Rajesh",
      message:"But, My Final amount is 60,000",
      time:new Date("2019-08-22")
    },
    {
      offerId:2,
      userName:"Krishna Agarwal",
      message:"New Xbox comes cheaper than this amount, why should i buy second hand xbox for this much amount :(",
      time:new Date("2019-08-22")
    },
    {
      offerId:3,
      userName:"Bala Murugan",
      message:"Hi, My offer amount is 100,000",
      time:new Date("2019-09-28")
    },
    {
      offerId:3,
      userName:"Rajesh",
      message:"Okay, Done!",
      time:new Date("2019-09-28")
    },
    {
      offerId:3,
      userName:"Bala Murugan",
      message:"Sorry, I changed my mind :P",
      time:new Date("2019-09-28")
    }];
   }

   showOfferChat(){
    this.chat = []; 
    for(let i=0;i<this.chatDetails.length;i++)
    {
      if(this.offerId===this.chatDetails[i].offerId)
      {
        this.chat.push(this.chatDetails[i]);
      }
     
    }
  }

 

  
}
