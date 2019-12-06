import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AdDetailsModel} from './Model/ad-details.model';
import { PublisherModel } from './Model/publisher-detail.model';


@Injectable({
  providedIn: 'root'
})
export class MyClassifiedsService {

adDetail : AdDetailsModel[] = [];
publisherDetail: PublisherModel[] = [];
id:number;
  adImage: any;
  constructor(private httpClient: HttpClient) { 
    this.publisherDetail=[
      {
       adId:1,
       createdOn : "10, Apr 2019",
       userIconUri : "https://ssl.gstatic.com/accounts/ui/avatar_2x.png",
       userName: "John Doe",
       location : "Hydrabad Corp office",
       emailId : "doe@gmail.com",
       phoneNumber : 9654300990,
       expiryDaysLeft : 30,
      },
      {
        adId:2,
        createdOn : "10, Apr 2019",
        userIconUri : "https://ssl.gstatic.com/accounts/ui/avatar_2x.png",
        userName: "John Doe",
        location : "Hydrabad Corp office",
        emailId : "doe@gmail.com",
        phoneNumber : 9654300990,
        expiryDaysLeft : 30,
       },
       {
        adId:3,
        createdOn : "10, Apr 2019",
        userIconUri : "https://ssl.gstatic.com/accounts/ui/avatar_2x.png",
        userName: "John Doe",
        location : "Hydrabad Corp office",
        emailId : "doe@gmail.com",
        phoneNumber : 9654300990,
        expiryDaysLeft : 30,
       },
       {
        adId:4,
        createdOn : "10, Apr 2019",
        userIconUri : "https://ssl.gstatic.com/accounts/ui/avatar_2x.png",
        userName: "John Doe",
        location : "Hydrabad Corp office",
        emailId : "doe@gmail.com",
        phoneNumber : 9654300990,
        expiryDaysLeft : 30,
       },
       {
        adId:5,
        createdOn : "10, Apr 2019",
        userIconUri : "https://ssl.gstatic.com/accounts/ui/avatar_2x.png",
        userName: "John Doe",
        location : "Hydrabad Corp office",
        emailId : "doe@gmail.com",
        phoneNumber : 9654300990,
        expiryDaysLeft : 30,
       },
    ]

    this.adDetail=[
      {
        id:1,
        imageLinks:[
          "https://i.ytimg.com/vi/xFe_ZYtfsZg/hqdefault.jpg",         
          "https://fdn.gsmarena.com/imgroot/reviews/19/realme-5-pro/lifestyle/-727w2/gsmarena_001.jpg"
        ],
        userIconUri : "https://ssl.gstatic.com/accounts/ui/avatar_2x.png",
        userName: "John Doe",
        date : "10, Apr 2019",
        price:85000,
        adTitle: "RealMe",
        categoryName: "Vehicle",
        commentCount:1,
        offerCount: 9,
        description:"ssssssssssssssssssssssssssssssssssssssssssssssss With pure MotoGP blood, a crossplane engine short wheelbase chassis and high-tech electronics, the YZF-R1 is ready to take your riding experience to a whole new level.Developed on the same racing DNA as its elder brother, YZF-R1 doesn't shy away from flaunting its massive power of 200 hp, perfect weight of 200 kg and a 1405 mm wheelbase. But it's what you can't see that makes it all the more special.",
        expiryDate:"10,Ape 2019",
      },
      {
        id:2,
        imageLinks:[
          "https://fdn.gsmarena.com/imgroot/reviews/19/realme-5-pro/lifestyle/-727w2/gsmarena_001.jpg",
          "https://i.ytimg.com/vi/xFe_ZYtfsZg/hqdefault.jpg"
        ],
        userIconUri : "https://ssl.gstatic.com/accounts/ui/avatar_2x.png",
      userName: "John Doe",
      date : "10, Apr 2019",
        price:9000,
        adTitle: "Yamaha YZF R15",
        categoryName: "Vehicle",
        commentCount:1,
        offerCount: 6,
        description:"YZF-R1 is a lot like its track brother YZR-M1. With pure MotoGP blood, a crossplane engine short wheelbase chassis and high-tech electronics, the YZF-R1 is ready to take your riding experience to a whole new level.Developed on the same racing DNA as its elder brother, YZF-R1 doesn't shy away from flaunting its massive power of 200 hp, perfect weight of 200 kg and a 1405 mm wheelbase. But it's what you can't see that makes it all the more special.",
        expiryDate:"19,Apr 2019"
      },
      {
        id:3,
        imageLinks:[
          "https://i.ytimg.com/vi/xFe_ZYtfsZg/hqdefault.jpg",
          
        ],
        userIconUri : "https://ssl.gstatic.com/accounts/ui/avatar_2x.png",
      userName: "John Doe",
      date : "10, Apr 2019",
        price:11000,
        adTitle: "Yamaha YZF R15",
        categoryName: "Vehicle",
        commentCount:1,
        offerCount: 4,
        description:"YZF-R1 is a lot like its track brother YZR-M1. With pure MotoGP blood, a crossplane engine short wheelbase chassis and high-tech electronics, the YZF-R1 is ready to take your riding experience to a whole new level.Developed on the same racing DNA as its elder brother, YZF-R1 doesn't shy away from flaunting its massive power of 200 hp, perfect weight of 200 kg and a 1405 mm wheelbase. But it's what you can't see that makes it all the more special.",
        expiryDate:"19,Apr 2019"
      },
      {
        id:4,
        imageLinks:[
          "https://i.ytimg.com/vi/xFe_ZYtfsZg/hqdefault.jpg",
          "https://fdn.gsmarena.com/imgroot/reviews/19/realme-5-pro/lifestyle/-727w2/gsmarena_001.jpg",
          "https://i.ytimg.com/vi/xFe_ZYtfsZg/hqdefault.jpg"
        ],
        userIconUri : "https://ssl.gstatic.com/accounts/ui/avatar_2x.png",
      userName: "John Doe",
      date : "10, Apr 2019",
        price:11000,
        adTitle: "Yamaha YZF R15",
        categoryName: "Vehicle",
        commentCount:3,
        offerCount: 4,
        description:"YZF-R1 is a lot like its track brother YZR-M1. With pure MotoGP blood, a crossplane engine short wheelbase chassis and high-tech electronics, the YZF-R1 is ready to take your riding experience to a whole new level.Developed on the same racing DNA as its elder brother, YZF-R1 doesn't shy away from flaunting its massive power of 200 hp, perfect weight of 200 kg and a 1405 mm wheelbase. But it's what you can't see that makes it all the more special.",
        expiryDate:"19,Apr 2019"
      },
      {
        id:5,
        imageLinks:[
          "https://i.ytimg.com/vi/xFe_ZYtfsZg/hqdefault.jpg",
          "https://fdn.gsmarena.com/imgroot/reviews/19/realme-5-pro/lifestyle/-727w2/gsmarena_001.jpg",
          "https://i.ytimg.com/vi/xFe_ZYtfsZg/hqdefault.jpg"
        ],
        userIconUri : "https://ssl.gstatic.com/accounts/ui/avatar_2x.png",
      userName: "John Doe",
      date : "10, Apr 2019",
        price:9000,
        adTitle: "Yamaha YZF R15",
        categoryName: "headphone",
        commentCount:6,
        offerCount: 4,
        description:"YZF-R1 is a lot like its track brother YZR-M1. With pure MotoGP blood, a crossplane engine short wheelbase chassis and high-tech electronics, the YZF-R1 is ready to take your riding experience to a whole new level.Developed on the same racing DNA as its elder brother, YZF-R1 doesn't shy away from flaunting its massive power of 200 hp, perfect weight of 200 kg and a 1405 mm wheelbase. But it's what you can't see that makes it all the more special.",
        expiryDate:"19,Apr 2019"
      }

    ]


  }
 


}