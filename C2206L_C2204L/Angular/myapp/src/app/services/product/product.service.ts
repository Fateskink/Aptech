import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import Product from '../../models/product';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  url:string = 'http://myapp.com:8088/api/v1/products/5';
  constructor(private http: HttpClient) { }

  fetchData(productId: number): Observable<Product> {    
    return this.http.get<Product>(this.url);
  }
}
