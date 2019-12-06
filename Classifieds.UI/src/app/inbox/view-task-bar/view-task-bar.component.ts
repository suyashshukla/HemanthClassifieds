import { Component, OnInit, OnChanges, DoCheck } from '@angular/core';
import { InboxService } from '../inbox.service';
import { OfferDetails } from '../models/offer-details.model';
import { ReportedAds } from '../models/reported-ads.model';
import { ExpiredAds } from '../models/expired-ads.model';
import { DeletedAds } from '../models/deleted-ads.model';

@Component({
  selector: 'app-view-task-bar',
  templateUrl: './view-task-bar.component.html',
  styleUrls: ['./view-task-bar.component.css']
})
export class ViewTaskBarComponent implements OnInit{
    activeOption:string;
    offerData:OfferDetails[];
    removedAdsData:ReportedAds[];
    expiredAdsData:ExpiredAds[];
    deletedAdsData:DeletedAds[];
    activeAdElement:HTMLDivElement;
    removedAdElement:HTMLDivElement;
  constructor(private inboxService:InboxService) {
   }

  ngOnInit() {
    this.offerData = this.inboxService.offerDetails;
    this.activeOption = this.inboxService.activeOption;
    this.removedAdsData = this.inboxService.reportedAdDetails;
    this.expiredAdsData = this.inboxService.expiredAdDetails;
    this.deletedAdsData = this.inboxService.deletedAdDetails;
  }

  showChat(ad:HTMLDivElement)
  {
    if(this.activeAdElement !== undefined)
    {
      this.activeAdElement.classList.remove('active');
    }
    this.activeAdElement = ad;
    this.activeAdElement.classList.add('active');
    this.inboxService.offerId = +this.activeAdElement.id;
    this.inboxService.showOfferChat();
    this.inboxService.displayChat = true;
    
  }

  showReason(ad:HTMLDivElement)
  {
    if(this.removedAdElement !== undefined)
    {
      this.removedAdElement.classList.remove('active');
    }
    this.removedAdElement = ad;
    this.removedAdElement.classList.add('active');
    this.inboxService.displayReason = true;
  } 

  
  

}
