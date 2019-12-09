import { Component, OnInit, Input, ViewChild, ElementRef } from '@angular/core';
import { ClassifiedService } from 'src/app/classifieds/classified.service';
import { Publisher } from 'src/app/classifieds/Models/publisher.model';
import { AdInfo } from 'src/app/classifieds/Models/adinfo.model';
import { ReportAd } from 'src/app/classifieds/Models/report.model';
import { OfferAd } from 'src/app/classifieds/Models/offer.model';
import { NgForm } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-publisher-card',
  templateUrl: './publisher-card.component.html',
  styleUrls: ['./publisher-card.component.css']
})
export class PublisherCardComponent implements OnInit {
  @ViewChild('closeBtn1',{static:false}) closeBtn1: ElementRef;
  @ViewChild('closeBtn2',{static:false}) closeBtn2: ElementRef;
  @Input() ad: AdInfo;
  publisher: Publisher=new Publisher();
  reportAd: ReportAd;
  offerAd: OfferAd =new OfferAd();
  userId:number =4;
  constructor(private classifiedService: ClassifiedService, private toastr: ToastrService) { }

  ngOnInit() {
    this.getpushiler(this.ad.userId);
  }
  getpushiler(id:number):void
  {
    this.classifiedService.getUser(id)
        .subscribe(user => this.publisher= user);
  }
  private closeReportModal(): void {
    this.closeBtn1.nativeElement.click();
}
private closeOfferModal(): void {
  this.closeBtn2.nativeElement.click();
}
  onSubmitReport(reportForm: NgForm) {
    this.reportAd = new ReportAd();
    this.reportAd.adId = this.ad.id;
    this.reportAd.userId = this.userId;
    this.reportAd.message = 'ReportCategory: ' + reportForm.value.reportCategory + ' and ' + reportForm.value.message;
    this.reportAd.madeon = new Date();
    this.classifiedService.reportAd(this.reportAd).subscribe();
    this.toastr.info('Reported Succesfully');
    this.closeReportModal();

  }
  onSubmitOffer(offerForm: NgForm) {
    this.offerAd.price = offerForm.value.offerPrice;
    this.offerAd.message = offerForm.value.message;
    this.offerAd.adId = this.ad.id;
    this.offerAd.userId = this.userId;
    this.offerAd.madeon = new Date();
    this.classifiedService.makeOffer(this.offerAd).subscribe();
    this.toastr.info('Offer Made Succesfully');
    this.closeOfferModal();
  }
  
  // checkOffer(offerForm: NgForm) {
  //   this.classifiedService.checkOffer(this.userId,this.ad.id).subscribe(offer => this.offerAd = offer);
  //   if (this.offerAd == null) {
  //    this.updateFlag = false;
  //   }
	// checkOffer(userId: number, adId:  number): Observable<OfferAd>{
  //     return this.http.get<OfferAd>(this.rootUrl + 'offer/?userId=' + userId + '&adId =' + adId);
  // }
}
