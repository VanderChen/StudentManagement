package StudentManagement.JavaBean;

/**
 * Created by Vander on 2016/2/14.
 */
public class Login {
    String logName = "",backInfo = "";
    int isAdmin = 0;

    public void setBackInfo(String backInfo) {
        this.backInfo = backInfo;
    }

    public String getBackInfo() {
        return backInfo;
    }

    public void setLogName(String logName) {
        this.logName = logName;
    }

    public String getLogName() {
        return logName;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }
}
