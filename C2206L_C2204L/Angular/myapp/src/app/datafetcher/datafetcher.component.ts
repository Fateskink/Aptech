import { Component } from '@angular/core';
import Product from '../../models/product';
@Component({
  selector: 'app-datafetcher',
  templateUrl: './datafetcher.component.html',
  styleUrls: ['./datafetcher.component.scss']
})
export class DatafetcherComponent {
  colors: string[] = [
    '#3498db', 
    '#2ecc71', 
    '#e74c3c', 
    '#f39c12', 
    '#9b59b6'
  ];
  selectedColorIndex: number = 0;
  selectColor(index: number) {
    debugger
    this.selectedColorIndex = index;
  }
}
