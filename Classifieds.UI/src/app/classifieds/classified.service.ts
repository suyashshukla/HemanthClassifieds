import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { Ad } from 'src/app/classifieds/Models/ad.model';
import { AdInfo } from './Models/adinfo.model';
import { Publisher } from './Models/publisher.model';
import { HttpClient } from '@angular/common/http';
import { OfferAd } from './Models/offer.model';
import { ReportAd } from './Models/report.model';


@Injectable({
  providedIn: 'root'
})
export class ClassifiedService {
  readonly rootUrl ='http://localhost:50763/api/';
  
  constructor(private http: HttpClient) { }

  getAds(): Observable<Ad[]> {
   return  this.http.get<Ad[]>(this.rootUrl + 'ad');
  }
   
  getAd(id): Observable<AdInfo>{
   return this.http.get<AdInfo>(this.rootUrl + 'ad/' + id);
  
  }
  getUser(id: number): Observable<Publisher>{
      return this.http.get<Publisher>(this.rootUrl + 'user/' + id);
  
  }
  updateOffer(id: number, offer: OfferAd): Observable<OfferAd>{
    return this.http.put<OfferAd>(this.rootUrl + 'offer/' + id, offer);
}
updateReport(id: number, report: ReportAd): Observable<ReportAd>{
  return this.http.put<ReportAd>(this.rootUrl + 'report/' + id, report);
}
  checkOffer(userId: number, adId: number): Observable<OfferAd> {
      return this.http.get<OfferAd>(this.rootUrl + 'offer?userId=' + userId + '&adId=' + adId);
  }
  checkReport(userId: number, adId: number): Observable<ReportAd> {
    return this.http.get<ReportAd>(this.rootUrl + 'report?userId=' + userId + '&adId=' + adId);
}
  makeOffer(offerAd: OfferAd): Observable<OfferAd> {
    return this.http.post<OfferAd>(this.rootUrl + 'offer', offerAd);
  }
  reportAd(reportAd: ReportAd): Observable<ReportAd> {
    return this.http.post<ReportAd>(this.rootUrl + 'report', reportAd);
  }
}
