<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<main>
    <form method="post" action="index.php" enctype="multipart/form-data" name="formConnexion" class="formConnexion">
    	<table><tbody>
    		<tr><td>
    			<table><tbody>
    				<tr><td>
    					<input type="text" name="Email" id="Email" placeholder="saisir votre mail" pattern="[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([_\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})" required="" autocomplete="off"></td></tr></tbody></table></td></tr><tr><td><table><tbody><tr><td>
    					<input type="password" name="mdp" id="mdp" placeholder="saisir votre mot de passe" pattern="[a-zA-Z0-9]{4,20}" required="" autocomplete="off">
    				</td></tr>
    			</tbody></table>
    			</td></tr><tr><td>
    			<table><tbody>
    				<tr><td>
    					<input type="submit" name="Valconnexion" id="Valconnexion" value="Connexion"> 
    				</td></tr>
    			</tbody></table>
    			</td></tr><tr><td>
    			<table></table>
    	</tbody></table>
  </form>  </main>
</body>
</html>