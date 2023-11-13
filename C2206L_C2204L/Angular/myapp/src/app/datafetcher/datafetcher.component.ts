import { Component, OnInit } from '@angular/core';
import {Product} from '../../models/product';
import { 
  ProductService 
} from '../services/product/product.service';
@Component({
  selector: 'app-datafetcher',
  templateUrl: './datafetcher.component.html',
  styleUrls: ['./datafetcher.component.scss']
})
//url: http://myapp.com:8088/api/v1/products/5
export class DatafetcherComponent implements OnInit{
  
  colors: string[] = [
    '#3498db', 
    '#2ecc71', 
    '#e74c3c', 
    '#f39c12', 
    '#9b59b6'
  ];
  constructor(private productService: ProductService) { }
  ngOnInit(): void {
    //call api here
    let productId = 5;
    this.productService.fetchData(productId).subscribe({
      next: (response: Product) => {

      },  
      error: (error: any) => {

      },
      complete: () => {

      }
    })
  }
  selectedColorIndex: number = 0;//state of DataFetcher
  selectColor(index: number) {
    debugger
    this.selectedColorIndex = index;
  }
}
