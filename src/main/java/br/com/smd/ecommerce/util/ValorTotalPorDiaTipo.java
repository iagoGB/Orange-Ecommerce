/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.util;

import java.util.Date;
import java.util.Objects;

/**
 *
 * @author Iago Gomes
 */
public class ValorTotalPorDiaTipo {
    
    Date dataInicio;
    Date dataFim;
    Double valorTotal;

    public ValorTotalPorDiaTipo() {
       
    }

   

    public Date getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }

    public Date getDataFim() {
        return dataFim;
    }

    public void setDataFim(Date dataFim) {
        this.dataFim = dataFim;
    }

    public Double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(Double valorTotal) {
        this.valorTotal = valorTotal;
    }
    
    

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 13 * hash + Objects.hashCode(this.dataInicio);
        hash = 13 * hash + Objects.hashCode(this.dataFim);
        hash = 13 * hash + Objects.hashCode(this.valorTotal);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ValorTotalPorDiaTipo other = (ValorTotalPorDiaTipo) obj;
        if (!Objects.equals(this.dataInicio, other.dataInicio)) {
            return false;
        }
        if (!Objects.equals(this.dataFim, other.dataFim)) {
            return false;
        }
        if (!Objects.equals(this.valorTotal, other.valorTotal)) {
            return false;
        }
        return true;
    }
    
    public  static ValorTotalPorDiaTipo  parseValorTotalPorDiaTipo(Date di,Date df, Double valor){
        
        ValorTotalPorDiaTipo vtpdt = new ValorTotalPorDiaTipo();
        
        try {
            
            vtpdt.setDataInicio(di);
            vtpdt.setDataFim(df);
            vtpdt.setValorTotal(valor);
        
        } catch (Exception ex) {
            
            System.err.println("Erro ao tentar converter ValorTotalPorDiaTipo: "+ ex);
            
        }
        return vtpdt;
    }
}
