package StudentManagement.JavaBean;

/**
 * Created by Vander on 2016/2/15.
 */
import com.sun.rowset.*;
public class ShowRecordByPage {
    CachedRowSetImpl rowSet = null;
    int pagesize = 5;
    int pageAllCount = 0;
    int showpage = 1;
    StringBuffer presentPageResult;
    StringBuffer presentTableNameResult;
    String databaseName = "";
    String tableName = "";
    StringBuffer formTitle = null;

    public StringBuffer getPresentTableNameResult() {
        return presentTableNameResult;
    }

    public CachedRowSetImpl getRowSet() {
        return rowSet;
    }

    public int getPagesize() {
        return pagesize;
    }

    public int getShowpage() {
        return showpage;
    }

    public String getDatabaseName() {
        return databaseName;
    }

    public String getTableName() {
        return tableName;
    }

    public int getPageAllCount() {
        return pageAllCount;
    }

    public StringBuffer getFormTitle() {
        return formTitle;
    }

    public StringBuffer getPresentPageResult() {
        return presentPageResult;
    }

    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }

    public void setFormTitle(StringBuffer formTitle) {
        this.formTitle = formTitle;
    }

    public void setPageAllCount(int pageAllCount) {
        this.pageAllCount = pageAllCount;
    }

    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }

    public void setPresentPageResult(StringBuffer presentPageResult) {
        this.presentPageResult = presentPageResult;
    }

    public void setRowSet(CachedRowSetImpl rowSet) {
        this.rowSet = rowSet;
    }

    public void setShowpage(int showpage) {
        this.showpage = showpage;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public void setPresentTableNameResult(StringBuffer presentTableNameResult) {
        this.presentTableNameResult = presentTableNameResult;
    }
}
