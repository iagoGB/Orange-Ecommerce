/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.util;

import java.io.File;
import org.apache.commons.fileupload.FileItem;
import static br.com.smd.ecommerce.util.Constantes.REPOSITORIO_IMAGEM_PRODUTO;

/**
 *
 * @author Iago Gomes
 */
public class UploadFoto {

    public boolean salvarCaminhoFoto(FileItem foto,Long id) {
        
        boolean estaSalvo = false;
        
        try {
            
            foto.write(new File(REPOSITORIO_IMAGEM_PRODUTO + File.separator + id + foto.getName().substring(foto.getName().lastIndexOf("."))));
            estaSalvo = true;
        } catch (Exception e) {
            System.out.println("erro ao subir foto"+ e);
        }
        return estaSalvo;
    }
}
