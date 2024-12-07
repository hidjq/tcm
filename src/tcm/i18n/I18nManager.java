package tcm.i18n;

import java.util.HashMap;
import java.util.Locale;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

public class I18nManager {
    private static I18nManager instance;
    private ResourceBundle bundle;
    private Locale currentLocale;
    
    private static final HashMap<String, Locale> SUPPORTED_LOCALES = new HashMap<>();
    static {
        SUPPORTED_LOCALES.put("English", new Locale("en", "US"));
        SUPPORTED_LOCALES.put("中文", new Locale("zh", "CN"));
        SUPPORTED_LOCALES.put("한국어", new Locale("ko", "KR"));
    }
    
    private I18nManager() {
        setLocale("English"); // Default language
    }
    
    public static I18nManager getInstance() {
        if (instance == null) {
            instance = new I18nManager();
        }
        return instance;
    }
    public String getCurrentLanguage() {
        // Return "English" for en_US locale, "中文" for zh_CN locale
        if (currentLocale.getLanguage().equals("en")) {
            return "English";
        } else if (currentLocale.getLanguage().equals("zh")) {
            return "中文";
        } else if (currentLocale.getLanguage().equals("ko")) {
            return "한국어";
        }
        return "English"; // Default to English
    } 
    public String getFileSuffix() {
        if (currentLocale.getLanguage().equals("en")) {
            return "_en";
        } else if (currentLocale.getLanguage().equals("ko")) {
            return "_ko";
        }
        return ""; // Default (Chinese version)
    }
    
    public void setLocale(String language) {
        try {
            currentLocale = SUPPORTED_LOCALES.get(language);
            String resourceName = "messages_" + currentLocale.getLanguage() + ".properties";
            InputStream is = getClass().getResourceAsStream("/tcm/i18n/" + resourceName);
            if (is != null) {
                bundle = new PropertyResourceBundle(new InputStreamReader(is, StandardCharsets.UTF_8));
            } else {
                System.err.println("Resource not found: " + resourceName);
                // Fallback to English
                is = getClass().getResourceAsStream("/tcm/i18n/messages_en.properties");
                bundle = new PropertyResourceBundle(new InputStreamReader(is, StandardCharsets.UTF_8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String getString(String key) {
        try {
            return bundle.getString(key);
        } catch (Exception e) {
            return "!" + key + "!";
        }
    }
    
    public String[] getSupportedLanguages() {
        return SUPPORTED_LOCALES.keySet().toArray(new String[0]);
    }
}