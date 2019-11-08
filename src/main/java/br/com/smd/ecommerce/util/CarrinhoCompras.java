/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.util;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Iago Gomes
 */
public class CarrinhoCompras {
    
    private List<ProdutoCompraView> itemCarrinhoList;
    private Integer totalItems;
    private Double total;

    public CarrinhoCompras(List<ProdutoCompraView> itemCarrinhoList, Integer totalItems, Double total) {
        this.itemCarrinhoList = itemCarrinhoList;
        this.totalItems = totalItems;
        this.total = total;
    }

    public CarrinhoCompras() {
        this.itemCarrinhoList = new ArrayList<>();
    }
    
    public List<ProdutoCompraView> getItemCarrinhoList() {
        return itemCarrinhoList;
    }

    public void setItemCarrinhoList(List<ProdutoCompraView> itemCarrinhoList) {
        this.itemCarrinhoList = itemCarrinhoList;
    }

    public Integer getTotalItems() {
        return totalItems;
    }

    public void setTotalItems(Integer totalItems) {
        this.totalItems = totalItems;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
    
    
    
}
