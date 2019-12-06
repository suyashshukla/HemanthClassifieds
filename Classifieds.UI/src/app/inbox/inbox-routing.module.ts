import { NgModule } from "@angular/core";
import { RouterModule, Routes } from '@angular/router';
import { InboxComponent } from './inbox.component';
import { ViewTaskBarComponent } from './view-task-bar/view-task-bar.component';
import { ChatsComponent } from './chats/chats.component';

const routes: Routes = [
    {path:'',component:InboxComponent, children:[
        {path:'offers',component:ViewTaskBarComponent},
        {path:'reports',component:ViewTaskBarComponent},
        {path:'ad-expired',component:ViewTaskBarComponent},
        {path:'deleted-items',component:ViewTaskBarComponent}
    ]},
]
@NgModule({
    imports:[RouterModule.forChild(routes)],
    exports:[RouterModule]
})

export class InboxRoutingModule{

}