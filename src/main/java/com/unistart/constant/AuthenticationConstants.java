package com.unistart.constant;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.InputStream;

public class AuthenticationConstants {

    public final static String G_CLIENT_ID = "525175435249-fcon5618ugd00jij2o066g7k3266n3mb.apps.googleusercontent.com";
    public final static String CLIENT_SECRET = "u_z0Lm8uvtA54D76iEKcnHYE";
    public final static int RAW = 1;
    public final static int TRANSIENT = 2;
    public final static int GENERATE = 3;

    public final static String PROVIDER_FACEBOOK = "facebook";
    public final static String PROVIDER_GOOGLE = "google";

    public final static String ROLE_USER = "ROLE_USER";
    public final static String ROLE_ADMIN = "ROLE_ADMIN";
    private static String[] UNAUTHENTICATED_URL = {};

    static {
        getUnauthenticatedUrlsFromFile();
    }

    private static void getUnauthenticatedUrlsFromFile() {
        ObjectMapper om = new ObjectMapper();
        try (InputStream is = AuthenticationConstants.class.getClassLoader().getResourceAsStream("unauthenticated_urls.json");) {
            UNAUTHENTICATED_URL = om.readValue(is, new String[]{}.getClass());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String[] getUnauthenticatedUrls() {
        return UNAUTHENTICATED_URL;
    }
}
