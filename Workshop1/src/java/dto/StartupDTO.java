/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;

/**
 *
 * @author Administrator
 */
public class StartupDTO {
    private int  project_id;
    private String project_name;
    private String Description;
    private String Status;
    private Date estimate_lauch;

    public StartupDTO() {
    }

    public StartupDTO(int project_id, String project_name, String Description, String Status, Date estimate_lauch) {
        this.project_id = project_id;
        this.project_name = project_name;
        this.Description = Description;
        this.Status = Status;
        this.estimate_lauch = estimate_lauch;
    }

    public StartupDTO(String string, String string0, String string1, int aInt, double aDouble, int aInt0) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public Date getEstimate_lauch() {
        return estimate_lauch;
    }

    public void setEstimate_lauch(Date estimate_lauch) {
        this.estimate_lauch = estimate_lauch;
    }
    
    
}
