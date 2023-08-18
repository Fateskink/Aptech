package com.aptech.androidclient;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import com.aptech.androidclient.adapters.ProductAdapter;
import com.aptech.androidclient.models.Product;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {
    private Button btnReload;
    private ListView listViewProducts;
    private ProductAdapter productAdapter;
    private List<Product> fakedProducts = new ArrayList<>();
    private void generateFakeProductData() {
        fakedProducts.add(new Product(1, "p11", "d111", 123.3f, 10));
        fakedProducts.add(new Product(2, "p2", "d22", 123.3f, 10));
        fakedProducts.add(new Product(3, "p33", "d33", 123.3f, 10));
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main_activity);
        btnReload = findViewById(R.id.btnReload);
        btnReload.setOnClickListener((View view) -> {
            Toast.makeText(MainActivity.this, "Haha", Toast.LENGTH_LONG).show();
        });
        this.generateFakeProductData();
        listViewProducts = findViewById(R.id.listViewProducts);
        productAdapter = new ProductAdapter(this,fakedProducts);
    }
}