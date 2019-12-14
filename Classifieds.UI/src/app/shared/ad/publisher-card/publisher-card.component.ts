import { Component, OnInit, Input, ViewChild, ElementRef } from '@angular/core';
import { ClassifiedService } from 'src/app/classifieds/classified.service';
import { Publisher } from 'src/app/classifieds/Models/publisher.model';
import { AdInfo } from 'src/app/classifieds/Models/adinfo.model';
import { ReportAd } from 'src/app/classifieds/Models/report.model';
import { OfferAd } from 'src/app/classifieds/Models/offer.model';
import {  FormGroup, FormControl, Validators, FormBuilder } from '@angular/forms';
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
  offerForm: FormGroup;
  reportForm: FormGroup;
  updateFlag : boolean = false;
  constructor(private classifiedService: ClassifiedService, private toastr: ToastrService, private formBuilder: FormBuilder) { }

  ngOnInit() {
    this.getpushiler(this.ad.userId);
    this.checkOffer();
    this.checkReport();
   
  }
  createOfferForm():void{
    this.offerForm = new FormGroup({
      'offerPrice' : new FormControl({value: this.offerAd.price == null ? null : this.offerAd.price, disabled: false}, Validators.required),
     'message' : new FormControl({value: this.offerAd.message == null ? null : this.offerAd.message, disabled: false}, Validators.required)
    });
  }
  createReportForm():void{
    this.reportForm = new FormGroup({
      'reportCategory' : new FormControl({ value: 'select', disabled: false }, Validators.required),
     'message' : new FormControl(null, Validators.required)
    });
  }
  getpushiler(id:number):void
  {
    this.classifiedService.getUser(id)
        .subscribe(user => this.publisher = user);
  }
  private closeReportModal(): void {
    this.closeBtn1.nativeElement.click();
}
private closeOfferModal(): void {
  this.closeBtn2.nativeElement.click();
}
checkOffer(): void {
   this.classifiedService.checkOffer(this.userId, this.ad.id).subscribe(offer => {
     this.offerAd = offer;
     if (this.offerAd != null) {
      this.updateFlag = true;
      }
      console.log(this.offerAd);
      console.log(this.updateFlag);
     this.createOfferForm();
  }); 
}
checkReport(): void {
  this.classifiedService.checkReport(this.userId, this.ad.id).subscribe(report => {
    this.reportAd = report;
    if (this.reportAd != null) {
     this.updateFlag = true;
     }
    this.createReportForm();
 }); 
}
saveReport() {
     if (!this.reportForm.valid) {
       return;
     }
     this.reportAd = new ReportAd();
     this.reportAd.adId = this.ad.id;
     this.reportAd.userId = this.userId;
     this.reportAd.message = 'ReportCategory: ' + this.reportForm.value.reportCategory + ' and ' + this.reportForm.value.message;
     this.reportAd.madeon = new Date();
     this.classifiedService.reportAd(this.reportAd).subscribe();
     console.log(this.reportAd);
     this.toastr.info('Reported Succesfully');
     this.closeReportModal();

  }
  updateOffer(){
    console.log("update offer")
        console.log(this.offerAd);
  }
  saveOffer() {
    if ( !this.offerForm.valid) {
      return;
    }
    this.offerAd.price = this.offerForm.value.offerPrice;
    this.offerAd.message = this.offerForm.value.message;
    this.offerAd.adId = this.ad.id;
    this.offerAd.userId = this.userId;
    this.offerAd.madeon = new Date();
    this.classifiedService.makeOffer(this.offerAd).subscribe();
    console.log(this.offerAd);
    this.toastr.info('Offer Made Succesfully');
    this.closeOfferModal();
  }
  
}
