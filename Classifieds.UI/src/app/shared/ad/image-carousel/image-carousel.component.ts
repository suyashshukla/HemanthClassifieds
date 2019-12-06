import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-image-carousel',
  templateUrl: './image-carousel.component.html',
  styleUrls: ['./image-carousel.component.css']
})
export class ImageCarouselComponent implements OnInit {
  
  @Input() imagesPath : string[];
  @Input() price:number;
id:number;



totalSlides:number[]=[];
slides:number;
  constructor() {
    
  }

  ngOnInit() {
    
    
    this.slides = this.imagesPath.length/4;
    
    this.show(this.imagesPath[0]);
   
    for(let j=0;j<this.slides;j++)
    {
      this.totalSlides.push(j);  
    }
  }
  path:string;
  show(url:string){
    this.path=url;   
  }


 
 } 


