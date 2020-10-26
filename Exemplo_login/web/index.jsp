<%-- 
    Document   : index
    Created on : 06/09/2020, 18:00:18
    Author     : stefa
--%>

<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="css/estilo.css" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->
<%
    Statement st = null;
    ResultSet rs = null;
    %>
    </head>
<body>
    <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">Nome:</label><br>
                                <input type="text" name="usuario" id="username" class="form-control" required="">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Senha:</label><br>
                                <input type="text" name="senhausuario" id="password" class="form-control" required="">
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                            </div>
                            <div id="register-link" class="text-right">
                            </div>
                        </form>

                    </div>
                                            <p align="center" class="text-light mt-2">
                               <%
                    String nome = request.getParameter("usuario");
                    String senha = request.getParameter("senhausuario");
                    String usuario = "";
                    String senhausuario = "";
                    String usuariosessao = "";
                    int i = 0;
                    try{
                    
                    st = new Conexao().conectar().createStatement();
                    rs = st.executeQuery("SELECT * FROM usuarios WHERE email='"+nome+"' and senha = '"+senha+"' ");
                    while(rs.next()){
                        usuario = rs.getString(3);
                        senhausuario = rs.getString(4);
                        usuariosessao = rs.getString(2);
                        rs.last();
                        i=rs.getRow();
                        out.println("--------");
                    }
                    }
                    catch(Exception e){
                        out.println(e);
                    }
                    if((nome == null) || (senha == null)){
                        out.println("Preencha os dados");
                    }
                    else{
                      if(i == 0){
                            out.println("Usuario não encontrado");
                        }
                        else{
                          session.setAttribute("usuariosessao", usuariosessao);
                            response.sendRedirect("usuarios.jsp");
                        }  
                    }
                        
                    %> 
                           </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
