package nguyenvana.aprotrain.com.adapters;

import android.content.Context;
import android.database.Cursor;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CursorAdapter;
import android.widget.TextView;

import androidx.cardview.widget.CardView;

import nguyenvana.aprotrain.com.R;
import nguyenvana.aprotrain.com.models.Note;

public class CustomAdapter extends CursorAdapter {
    private Context context;
    public CustomAdapter(Context context, Cursor c, boolean autoRequery) {
        super(context, c, autoRequery);
        this.context = context;
    }

    @Override
    public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
        View view = LayoutInflater.from(this.context)
                .inflate(R.layout.list_item, viewGroup, false);
        return view;
    }

    @Override
    public void bindView(View view, Context context, Cursor cursor) {
        CardView cardView = view.findViewById(R.id.cardView);
        TextView textViewContent = view.findViewById(R.id.textViewContent);
        TextView textViewCreatedDate = view.findViewById(R.id.textViewCreatedDate);
        //Note selectedNode = cursor.get
    }
}
