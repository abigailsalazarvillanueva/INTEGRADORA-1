import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EntradasRoutingModule } from './entradas-routing.module';
import { DailypageComponent } from './pages/dailypage/dailypage.component';
import { LayoutpageComponent } from './pages/layoutpage/layoutpage.component';
import { ListpageComponent } from './pages/listpage/listpage.component';
import { RegisterpageComponent } from './pages/registerpage/registerpage.component';
import { VehiclepageComponent } from './pages/vehiclepage/vehiclepage.component';
import { MaterialModule } from '../material/material.module';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { ReactiveFormsModule } from '@angular/forms';
import { NotificacionespageComponent } from './pages/notificacionespage/notificacionespage.component';
import { HelpComponent } from './pages/help/help.component';
import { ProfileComponent } from './pages/profile/profile.component';


@NgModule({
  declarations: [
    DailypageComponent,
    LayoutpageComponent,
    ListpageComponent,
    RegisterpageComponent,
    VehiclepageComponent,
    NotificacionespageComponent,
    HelpComponent,
    ProfileComponent,
    NotificacionespageComponent
  ],
  imports: [
    CommonModule,
    EntradasRoutingModule,
    MaterialModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
  ]
})
export class EntradasModule { }
