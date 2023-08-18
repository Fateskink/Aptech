package com.aptech.androidclient.adapters;

import android.content.Context;
import android.widget.ArrayAdapter;

import androidx.annotation.NonNull;

import com.aptech.androidclient.models.Product;

import java.util.List;

public class ProductAdapter extends ArrayAdapter<Product> {
    //adapter is bridge between UI and Data
    private Context context;
    private List<Product> products;
    public ProductAdapter(@NonNull Context context, List<Product> products) {
        super(context, 0, products);
        this.context = context;//ref to screen(Activity)
        this.products = products;
    }

}
