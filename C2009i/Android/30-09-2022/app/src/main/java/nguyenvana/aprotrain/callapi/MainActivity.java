package nguyenvana.aprotrain.callapi;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.ProgressBar;

import java.util.ArrayList;
import java.util.List;

import nguyenvana.aprotrain.callapi.apis.APIClient;
import nguyenvana.aprotrain.callapi.apis.APIInterface;
import nguyenvana.aprotrain.callapi.pojo.Photo;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class MainActivity extends AppCompatActivity {
    private APIInterface apiInterface;
    private ArrayList<Photo> photos = new ArrayList<>();
    private ProgressBar progressBar;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        apiInterface = APIClient.getClient().create(APIInterface.class);
        Call<ArrayList<Photo>> call = apiInterface.getPhotos(1);
        progressBar = findViewById(R.id.progressBar);
        progressBar.setVisibility(View.VISIBLE);
        call.enqueue(new Callback<ArrayList<Photo>>() {
            @Override
            public void onResponse(Call<ArrayList<Photo>> call, Response<ArrayList<Photo>> response) {
                //response.body();
                photos = (ArrayList<Photo>)response.body();
                progressBar.setVisibility(View.GONE);
            }

            @Override
            public void onFailure(Call<ArrayList<Photo>> call, Throwable t) {
                System.err.println("haha");
                call.cancel();
            }
        });
    }
}