<%-- 
    Document   : search
    Created on : Feb 13, 2025, 11:27:20 AM
    Author     : tungi
--%>

<%@page import="dto.StartupDTO"%>
<%@page import="java.awt.print.Book"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-16WWW">
        <title>Startup Project Management</title>

        <style>
            /* Existing book table styles */
            .book-table {
                width: 100%;
                border-collapse: collapse;
                margin: 25px 0;
                font-size: 14px;
                font-family: Arial, sans-serif;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            .book-table thead th {
                background-color: #009879;
                color: #ffffff;
                text-align: left;
                font-weight: bold;
                padding: 12px 15px;
            }

            .book-table tbody tr {
                border-bottom: 1px solid #dddddd;
            }

            .book-table tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }

            .book-table tbody tr:last-of-type {
                border-bottom: 2px solid #009879;
            }

            .book-table tbody td {
                padding: 12px 15px;
            }

            .book-table tbody tr:hover {
                background-color: #f5f5f5;
                transition: 0.3s ease;
            }

            /* Container styles */
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            /* Welcome section styles */
            .welcome-section {
                background-color: #f8f9fa;
                border-radius: 8px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .welcome-section h1 {
                margin: 0;
                color: #333;
                font-family: 'Arial', sans-serif;
                font-size: 24px;
            }

            .logout-btn {
                background-color: #dc3545;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 8px 15px;
                cursor: pointer;
                font-weight: bold;
                transition: background-color 0.3s;
            }

            .logout-btn:hover {
                background-color: #c82333;
            }

            /* Search section styles */
            .search-section {
                background-color: #fff;
                border-radius: 8px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                display: flex;
                align-items: center;
            }

            .search-section form {
                display: flex;
                align-items: center;
                flex-grow: 1;
            }

            .search-section label {
                margin-right: 10px;
                font-weight: bold;
                color: #333;
            }

            .search-input {
                flex-grow: 1;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
                margin-right: 10px;
                transition: border-color 0.3s;
            }

            .search-input:focus {
                border-color: #009879;
                outline: none;
                box-shadow: 0 0 0 2px rgba(0, 152, 121, 0.2);
            }

            .search-btn {
                background-color: #009879;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 10px 15px;
                cursor: pointer;
                font-weight: bold;
                transition: background-color 0.3s;
            }

            .search-btn:hover {
                background-color: #00806a;
            }

            /* Add button styles */
            .add-btn {
                display: inline-block;
                background-color: #007bff;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                padding: 10px 15px;
                margin-bottom: 20px;
                font-weight: bold;
                transition: background-color 0.3s;
            }

            .add-btn:hover {
                background-color: #0069d9;
                text-decoration: none;
            }

            /* Add a nice icon to the add button */
            .add-btn::before {
                content: "+";
                margin-right: 5px;
                font-weight: bold;
            }

            /* Responsive design */
            @media screen and (max-width: 600px) {
                .book-table {
                    font-size: 12px;
                }

                .book-table thead th,
                .book-table tbody td {
                    padding: 8px 10px;
                }

                .welcome-section {
                    flex-direction: column;
                    text-align: center;
                }

                .welcome-section form {
                    margin-top: 15px;
                }

                .search-section form {
                    flex-direction: column;
                    align-items: stretch;
                }

                .search-section label {
                    margin-bottom: 5px;
                }

                .search-input {
                    margin-right: 0;
                    margin-bottom: 10px;
                }
            }
        </style> 
    </head>
    <body> 
        <%@include file="header.jsp" %>
        <div class="container" style="min-height: 500px;">
            <%
                if (session.getAttribute("user") != null) {
                    UserDTO user = (UserDTO) session.getAttribute("user");
            %>

            <%
                String searchTerm = request.getAttribute("searchTerm") + "";
                searchTerm = searchTerm.equals("null") ? "" : searchTerm;
            %>
            <div class="search-section">
                <form action="MainController">
                    <input type="hidden" name="action" value="search"/>
                    <label for="searchInput">Search Books:</label>
                    <input type="text" id="searchInput" name="searchTerm" value="<%=searchTerm%>" class="search-input" placeholder="Enter book title, author or ID..."/>
                    <input type="submit" value="Search" class="search-btn"/>
                </form>
            </div>
            <% if (user.getRole().equals("AD")) { %>            
            <a href="bookForm.jsp" class="add-btn">
                Add New Book    
            </a>    
            <%}%>
            <%
                if (request.getAttribute("startup") != null) {
                    List<StartupDTO> books = (List<Startup>) request.getAttribute("startup");

            %>
            <table class="book-table">
                <thead>
                    <tr>
                        <th>BookID</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>PublishYear</th>
                        <th>Price</th>
                        <th>Quantity</th>
                            <% if (user.getRole().equals("AD")) { %>      
                        <th>Action</th>
                            <%}%>
                    </tr>
                </thead>
                <tbody>
                    <%                        for (StartupDTO b : books) {
                    %>
                    <tr>
                        <td><%=b.getProject_id()%></td>
                        <td><%=b.getProject_name()%></td>
                        <td><%=b.getDescription()%></td>
                        <td><%=b.getStatus()%></td>
                        <td><%=b.getEstimate_lauch()%></td>

                        <% if (user.getRole().equals("AD")) {%>  
                        <td><a href="MainController?action=delete&id=<%=b.getProject_id()%>&searchTerm=<%=searchTerm%>">
                                <img src="assets/images/delete-icon.png" style="height: 25px"/>
                            </a></td>
                            <%}%>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                }
            } else {
            %>
            <div class="welcome-section">
                <h1>Access Denied</h1>
                <p>You do not have permission to access this content.</p>
            </div>
            <%
                }
            %>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>