import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ImageDataService {

  urls:string[]=[];
  priceElement:boolean=false;
  price:number;
  constructor() { }
}
