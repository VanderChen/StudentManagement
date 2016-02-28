package StudentManagement.JavaBean;

/**
 * Created by Vander on 2016/2/13.
 */
public class Register {
    String logName = "",email = "",backInfo = "";

    public void setLogName(String logName) {
        this.logName = logName;
    }

    public String getLogName() {
        return logName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setBackInfo(String backInfo) {
        this.backInfo = backInfo;
    }

    public String getBackInfo() {
        return backInfo;
    }
}
