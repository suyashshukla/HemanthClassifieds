import { Component, OnInit ,Input } from '@angular/core';
import { Ad } from 'src/app/classifieds/Models/ad.model';

@Component({
  selector: 'app-ad-card-list',
  templateUrl: './ad-card-list.component.html',
  styleUrls: ['./ad-card-list.component.css']
})
export class AdCardListComponent implements OnInit {
  @Input() ad: Ad ;
  constructor() { }

  ngOnInit() {
  }

}
