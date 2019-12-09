import { Component, OnInit ,Input } from '@angular/core';
import { Ad } from 'src/app/classifieds/Models/ad.model';


@Component({
  selector: 'app-ad-card-grid',
  templateUrl: './ad-card-grid.component.html',
  styleUrls: ['./ad-card-grid.component.css']
})
export class AdCardGridComponent implements OnInit {
  @Input() ad: Ad ;
  constructor() { }

  ngOnInit() {
  }
  
}
