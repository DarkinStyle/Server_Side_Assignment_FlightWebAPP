package com.utar.flightwebapp_18acb02736.utilities;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.hibernate.annotations.common.util.StringHelper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.ServletContext;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;

public class ValidateLogin {

    public static boolean getjson (String email, String password, String resourcepath) {

        boolean validateCheck = false;

        String emailcheck = email, passcheck = password, resource = resourcepath;

        //JSON parser object to parse read file
        JSONParser jsonParser = new JSONParser();

        try {

            //Read JSON file
            Object obj = jsonParser.parse(resource);

            // to JSONArray
            JSONArray userList = (JSONArray) obj;
            System.out.println(userList);

            //userList.get(1); //{"user":{"password":"3412@StYle","email":"stylE@gmail.com"}}

            //JSONObject test = (JSONObject) userList.get(1); //{"user":{"password":"3412@StYle","email":"stylE@gmail.com"}}

            //JSONObject test2 = (JSONObject) test.get("user"); //{"password":"3412@StYle","email":"stylE@gmail.com"}

            //String ml = (String) test2.get("email"); //stylE@gmail.com


            //Iterative parsing
            JSONObject[] objarr = new JSONObject[userList.size()];
            if (userList != null) {
                for (int i=0; i< userList.size(); i++) {
                    objarr[i] = (JSONObject) userList.get(i);

                }
            }
            JSONObject[] objarr2 = new JSONObject[userList.size()];
            for (int i = 0; i < objarr2.length; i++) {
                objarr2[i] = (JSONObject) objarr[i].get("user");

            }

            //Iterative insert email and password from object[]
            String[] mail = new String[objarr2.length];
            String[] pass = new String[objarr2.length];
            int countvalid = 0, countinvalid = 0;
            for (int i =0; i < objarr2.length; i++) {
                mail[i] = (String) objarr2[i].get("email");
                pass[i] = (String) objarr2[i].get("password");

                if (mail[i].equals(emailcheck) && pass[i].equals(passcheck))  {
                    countvalid++;
                } else {
                    countinvalid++;
                }
            }

            if (countinvalid > countvalid) {
                validateCheck = false;
            } else {
                validateCheck = true;
            }

        } catch (ParseException e) {
            e.printStackTrace();
        }


        return validateCheck;
    }

}
