package pl.mmalz.model;

import javax.persistence.*;

@Entity
@Table(name = "ag_agents")
public class Agent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ag_id")
    private int agId;

    @Column(name = "ag_symbol")
    private String agSymbol;

    @Column(name = "tax_number")
    private String taxNumber;

    @Column(name = "www")
    private String www;

    public Agent() {
    }

    public int getAgId() {
        return agId;
    }

    public void setAgId(int agId) {
        this.agId = agId;
    }

    public String getAgSymbol() {
        return agSymbol;
    }

    public void setAgSymbol(String agSymbol) {
        this.agSymbol = agSymbol;
    }

    public String getTaxNumber() {
        return taxNumber;
    }

    public void setTaxNumber(String taxNumber) {
        this.taxNumber = taxNumber;
    }

    public String getWww() {
        return www;
    }

    public void setWww(String www) {
        this.www = www;
    }
}
