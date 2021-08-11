package com.app.aptech.activities.photo;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;

import com.app.aptech.R;
import com.app.aptech.activities.IActivity;
import com.app.aptech.activities.product.ProductsAdapter;
import com.app.aptech.models.Photo;
import com.app.aptech.models.Product;
import com.app.aptech.repositories.IResponse;
import com.app.aptech.repositories.PhotoRepository;

import java.util.ArrayList;
import java.util.List;

public class PhotoListActivity extends AppCompatActivity implements IActivity {
    private ImageButton btnBack;
    private TextView txtTitle;
    private RecyclerView recyclerview;
    private RecyclerView.Adapter adapter;
    //data
    private List<Photo> photos = new ArrayList<Photo>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.product_list_activity);
        getSupportActionBar().hide();
        setupUI();
        setupActions();
        PhotoRepository photoRepository = new PhotoRepository();
        photoRepository.getAllPhotos(new IResponse() {
            @Override
            public void getResponse(Object response, String errorMessage) {
                if(errorMessage.equals("")) {
                    List<Photo> photos = (List<Photo>)response;
                    Log.d("PhotoListActivity", "haha");
                    //reload data
                }

            }
        });
    }

    @Override
    public void setupUI() {
        btnBack = findViewById(R.id.btnBack);
        txtTitle = findViewById(R.id.txtTitle);
        txtTitle.setText("List of products");

        recyclerview = findViewById(R.id.recyclerview);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(
                getApplicationContext(),LinearLayoutManager.VERTICAL, false
        );
        recyclerview.setLayoutManager(layoutManager);
        adapter = new PhotosAdapter(photos);
        recyclerview.setAdapter(adapter);
    }

    @Override
    public void setupActions() {
        btnBack.setOnClickListener((View v) -> {
            //com.app.aptech.activities.product.PhotoListActivity.this.onBackPressed();
        });
    }
}