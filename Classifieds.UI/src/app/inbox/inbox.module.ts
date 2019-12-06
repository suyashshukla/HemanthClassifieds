import { NgModule } from "@angular/core";
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { TaskBarComponent } from './task-bar/task-bar.component';
import { ViewTaskBarComponent } from './view-task-bar/view-task-bar.component';
import { ChatsComponent } from './chats/chats.component';
import { InboxComponent } from './inbox.component';
import { InboxRoutingModule } from './inbox-routing.module';
import { InboxService } from './inbox.service';
import { FormsModule } from '@angular/forms';
import { ScrolldownDirective } from './chats/scrolldown.directive';

@NgModule({
    declarations:[
        InboxComponent,
        TaskBarComponent,
        ViewTaskBarComponent,
        ChatsComponent,
        ScrolldownDirective
    ],
    imports:
    [
        RouterModule,
        CommonModule,
        InboxRoutingModule,
        FormsModule
    ],
    providers:[InboxService]
})

export class InboxModule{

}