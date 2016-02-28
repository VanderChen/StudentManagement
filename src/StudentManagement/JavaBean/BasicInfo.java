package StudentManagement.JavaBean;

import java.util.Date;

/**
 * Created by Vander on 2016/2/23.
 */
public class BasicInfo {
    String logName ="";
    String name ="";
    String gender ="";
    String phoneNumber ="";
    Date birthDate;
    String address ="";

    public String getLogName() {
        return logName;
    }

    public String getName() {
        return name;
    }

    public String getGender() {
        return gender;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public String getAddress() {
        return address;
    }

    public void setLogName(String logName) {
        this.logName = logName;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
