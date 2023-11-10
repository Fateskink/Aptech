import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { CounterComponent } from './counter/counter.component';
import { DatafetcherComponent } from './datafetcher/datafetcher.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    CounterComponent,
    DatafetcherComponent
  ],
  imports: [
    CommonModule,
    BrowserModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [
    //"root component"
    //AppComponent
    //LoginComponent,
    CounterComponent,
  ]
})
export class AppModule { }
