<%-- 
    Document   : usuarios
    Created on : 06/09/2020, 18:22:28
    Author     : stefa
--%>
<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
<%@page import="com.mysql.jdbc.Driver"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-
JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
crossorigin="anonymous"></script>

        <title>Usuario</title>
    </head>
    <body>
       
            <nav class="navbar navbar-expand-lg bg-warning">
  <a class="navbar-brand" href="#">Lista de usuários</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
      <form class="form-inline my-2 my-lg-0">
        <%
        String usuariosessao = (String)
       session.getAttribute("usuariosessao");
        out.println("Olá: &nbsp; <b> " +
       usuariosessao + "</b>&nbsp;");
        out.println("<hr>");
        if (usuariosessao == null) {
        response.sendRedirect("index.jsp");
        }
        %>
        <a href="logout.jsp">
       <input type="button" class="btn btn-outline-dark my-2 my-sm-0" value="SAIR" /> 
        </a>
    </form>
  </div>
       
</nav>
        <div class="container">  
            <br>
        <h1>Usuarios </h1>
        
                <div class="row mt-4 mb-4">
         <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalInserir">Novo Usuário</button>
         <form class="form-inline my-2 my-lg-0">
         <input class="form-control mr-sm-2" type="search"
        name="txtbuscar" placeholder="Digite um nome" aria-label="Search">
         <button class="btn btn-outline-info my-2 my-sm-0"
        type="submit">Buscar</button>
         </form>
        </div>

        
        <div class="card">
  <div class="card-body">
     <table class="table table-striped">
             <thead>
             <tr>
             <th scope="col">id</th>
             <th scope="col">Nome</th>
             <th scope="col">E-mail</th>
             <th scope="col">Senha</th>
             <th scope="col">Nível</th>
             </tr>
             </thead>
             <tbody>
           <%
           Statement st = null;
           ResultSet rs = null;
        
           try{
           st = new Conexao().conectar().createStatement();
           rs = st.executeQuery("SELECT * FROM usuarios ");
                    while(rs.next()){
                        %>
                        <tr>
             <th scope="row"><%= rs.getString (1)  %></th>
             <td><%= rs.getString (2)  %></td>
             <td><%= rs.getString (3)  %></td>
             <td><%= rs.getString (4)  %></td>
             <td><%= rs.getString (5)  %></td>
            
                </tr>
                <%
                    }
           }
                    catch(Exception e){
                        out.println(e);
                    }
           %>
             
                </tbody>
                </table>
  </div>
</div>
            
       </div>
    </body>
</html>

            <!-- Modal -->
<div class="modal fade" id="modalInserir" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Novo Usuário</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        
          <form id="cadastro-form" class="form" action="" method="post">
                          <div class="modal-body">
                        <div class="form-group">
                            <label for="nome" class="text-info">Nome: </label> <br>
                            <input type="text" name="nome" id="nome" class="form-control" required>
                           </div>
                            <div class="form-group">
                            <label for="email" class="text-info">Email: </label><br>
                          <input type="email" name="email" class="form-control" id="email" placeholder="Enter email" required>
                        </div>
                        <div class="form-group">
                          <label for="senha" class="text-info">Senha: </label><br>
                          <input type="password" name="senha" class="form-control" id="senha" placeholder="Password" required>
                        </div>
                          <div class="form-group">
                            <label for="exampleFormControlSelect1" class="text-info">Nível:</label><br>
                            <select class="form-control" id="txtnivel" name="txtnivel">
                              <option value="comum">Comum</option>
                              <option value="adm">Administrador</option>
 
                            </select>
                          </div>
                          </div>
                      
                  <div class="modal-footer">
                    <button type="subimit" name="btn-salvar" class="btn btn-primary">Cadastrar</button>
                    <button type="button"  class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                  
                  </div>
                    </form>  
          
      </div>
    </div>
  </div>
            
            <%
    if(request.getParameter("btn-salvar") != null){
       String nome = request.getParameter("nome");
       String email = request.getParameter("email");
       String senha = request.getParameter("senha");
       String nivel = request.getParameter("txtnivel");
       
    
    try{
        st = new Conexao().conectar().createStatement();
        //pesquisar vetor no banco de dados 
        rs = st.executeQuery("SELECT * FROM usuarios WHERE email='"+email+"' ");
                    while(rs.next()){
                        if(rs.getRow() > 0){
                            out.println("<script>alert('Usuário ja cadastrado.');</script>");
                            return;
                        }
                        
                    }
        st.executeUpdate("INSERT INTO usuarios(nome, email, senha, nivel)" 
                + "VALUES ('" + nome +"','"+ email +"','"+ senha +"','"+ nivel + "')");
        response.sendRedirect("usuarios.jsp");
    
    }
    catch(Exception e){
        out.println(e);
    }
    }
    %>

