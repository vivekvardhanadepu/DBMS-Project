package com.example.foodie;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;

public class Home_activity extends AppCompatActivity {

    private Button buttonLocation;
    private Button buttonhome;
    private Button buttonSearch;
    private Button buttonAccount;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE); //will hide the title
        getSupportActionBar().hide(); // hide the title bar
        this.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN); //enable full screen
        setContentView(R.layout.activity_home_activity);
        buttonLocation = (Button)findViewById(R.id.button11);
        buttonhome = (Button)findViewById(R.id.button8);
        buttonSearch = (Button)findViewById(R.id.button7);
        buttonAccount = (Button)findViewById(R.id.button10);
        buttonAccount.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                func_account();
            }
        });
        buttonhome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                func_home();
            }
        });
        buttonLocation.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                func_location();
            }
        });
        buttonSearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                func_search();
            }
        });
    }

    public void func_location() {
        Intent minted = new Intent(this, Location_activity.class);
        startActivity(minted);
    }

    public void func_home() {
        Intent minted = new Intent(this, Home_activity.class);
        startActivity(minted);
    }

    public void func_search() {
        Intent minted = new Intent(this,Search_activity.class);
        startActivity(minted);
    }

    public void func_account() {
        Intent minted = new Intent(this,Account_activity.class);
        startActivity(minted);
    }
}
