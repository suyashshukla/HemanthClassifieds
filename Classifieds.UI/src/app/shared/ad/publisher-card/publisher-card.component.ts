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
  publisher: Publisher;
  reportAd: ReportAd;
  offerAd: OfferAd;
  
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
    this.reportAd.userId = this.ad.userId;
    this.reportAd.message = 'ReportCategory: ' + reportForm.value.reportCategory + ' and ' + reportForm.value.message;
    this.reportAd.madeon = new Date();
    console.log(this.reportAd);
    this.toastr.info('Reported Succesfully');
    this.closeReportModal();

  }
  onOfferReport(offerForm: NgForm) {
    this.offerAd = new OfferAd();
    this.offerAd.price = offerForm.value.offerPrice;
    this.offerAd.message = offerForm.value.message;
    this.offerAd.adId = this.ad.id;
    this.offerAd.userId = this.ad.userId;
    this.offerAd.madeon = new Date();
    console.log(this.offerAd);
    this.closeOfferModal();


  }
  
}
