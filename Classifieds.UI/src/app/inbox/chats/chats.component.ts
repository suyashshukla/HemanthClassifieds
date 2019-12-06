import { Component, OnInit,AfterContentChecked, AfterViewInit, ElementRef} from '@angular/core';
import { InboxService } from '../inbox.service';
import { Chat } from '../models/chat.model';
import { OfferDetails } from '../models/offer-details.model';

@Component({
  selector: 'app-chats',
  templateUrl: './chats.component.html',
  styleUrls: ['./chats.component.css']
})
export class ChatsComponent implements OnInit,AfterContentChecked{
  name:string;
  message:string;
  reply:Chat;
  selectedOffer:OfferDetails;
  container:HTMLElement;
  constructor(private inboxService:InboxService) { }

  ngOnInit() {
    this.name = "Rajesh";
    this.extractOfferDetails();
  }
  ngAfterContentChecked(){
    this.extractOfferDetails();
  }
  onReply(){
    this.reply = new Chat();
    this.reply.offerId = this.inboxService.offerId;
    this.reply.message = this.message;
    this.reply.time = new Date();
    this.reply.userName = this.name;
    this.inboxService.chatDetails.push(this.reply);
    delete this.reply;
    this.message = "";
    this.inboxService.showOfferChat();
  }

  extractOfferDetails(){
    for(let i=0;i<this.inboxService.offerDetails.length;i++)
    {
      if(this.inboxService.offerId===this.inboxService.offerDetails[i].offerId)
      {
        this.selectedOffer = this.inboxService.offerDetails[i];
      }
     
    }
  }

}
