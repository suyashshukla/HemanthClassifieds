import { Component, OnInit} from '@angular/core';
import { InboxService } from '../inbox.service';
import { resetFakeAsyncZone } from '@angular/core/testing';

@Component({
  selector: 'app-task-bar',
  templateUrl: './task-bar.component.html',
  styleUrls: ['./task-bar.component.css'],
})
export class TaskBarComponent implements OnInit{

  constructor(private inboxService:InboxService) { }

  ngOnInit() {
      
    }
    

    selectedOption(optionNumber:number){
      this.resetChatDisplay();
      this.inboxService.activeOption = this.inboxService.taskbarOptions[optionNumber];
      
    }

    resetChatDisplay(){
      this.inboxService.displayChat=false;
      this.inboxService.displayReason=false;
    }

}
