package com.example.foodie;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.location.Location;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;

public class Home_activity extends AppCompatActivity {

    private Button Location;
    private Button home;
    private Button search;
    private Button Account;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE); //will hide the title
        getSupportActionBar().hide(); // hide the title bar
        this.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN); //enable full screen
        setContentView(R.layout.activity_home_activity);
        Location = (Button)findViewById(R.id.button11);
        home = (Button)findViewById(R.id.button8);
        search = (Button)findViewById(R.id.button7);
        Account = (Button)findViewById(R.id.button10);
        Account.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                func_account();
            }
        });
        home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                func_home();
            }
        });
        Location.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                func_location();
            }
        });
        search.setOnClickListener(new View.OnClickListener() {
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
