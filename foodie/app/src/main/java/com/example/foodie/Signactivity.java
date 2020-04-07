package com.example.foodie;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Signactivity extends AppCompatActivity {

    String insertString = "insert into user(username,passwd,phone_no,firstname,lastname,emailid) values(?,?,?,?,?,?)";
    String urlString = "jdbc:mysql://192.168.43.130:3306/swiggy";
    String usernameString = "root";
    String passwordString = "Sindhu3001";
    EditText uname;
    EditText pass_1;
    EditText pass_2;
    EditText phone;
    EditText fname;
    EditText lname;
    EditText email;
    private Button signup;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE); //will hide the title
        getSupportActionBar().hide(); // hide the title bar
        this.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN); //enable full screen
        setContentView(R.layout.activity_signup_activity);
        uname = (EditText)findViewById(R.id.editText4);
        pass_1 = (EditText)findViewById(R.id.editText5);
        pass_2 = (EditText)findViewById(R.id.editText6);
        phone = (EditText)findViewById(R.id.editText7);
        fname = (EditText)findViewById(R.id.editText8);
        lname = (EditText)findViewById(R.id.editText9);
        email = (EditText)findViewById(R.id.editText10);
        signup = (Button)findViewById(R.id.button4);
        signup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    addEntry();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }
    public void addEntry() throws Exception {
        /*Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(urlString,usernameString,passwordString);
        PreparedStatement statement = conn.prepareStatement(insertString);
        String user = uname.getText().toString();
        String pass = pass_1.getText().toString();
        String phon = phone.getText().toString();
        String fir_name = fname.getText().toString();
        String las_name = lname.getText().toString();
        String email_id = email.getText().toString();
        statement.setString(1, user);
        statement.setString(2, pass);
        statement.setString(3, phon);
        statement.setString(4, fir_name);
        statement.setString(5, las_name);
        statement.setString(6, email_id);
        statement.executeUpdate();*/
        Intent minted = new Intent(this, MainActivity.class);
        startActivity(minted);

    }
}
