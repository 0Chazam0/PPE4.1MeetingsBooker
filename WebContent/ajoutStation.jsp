<%@ page pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

    <head>

        <meta charset="utf-8" />

        <title>Ajout Station</title>

        <link type="text/css" rel="stylesheet" href="form.css" />

    </head>

    <body>

        <form method="post" action="ajoutStation">

            <fieldset>

                <legend>Ajout Station</legend>

                <p>Vous pouvez ajouter une station via ce formulaire.</p>


                <label for="nomSta">Nom de la Station<span class="requis">*</span></label>

                <input type="text" id="nomSta" name="nomSta" size="20" maxlength="60" />

                <span class="erreur">${form.erreurs['nomSta']}</span>

                <br />


                <label for="adresseSta">Adresse de la Station <span class="requis">*</span></label>

                <input type="text" id="adresseSta" name="adresseSta" size="20" maxlength="20" />

                <span class="erreur">${form.erreurs['adresseSta']}</span>

                <br />


                <label for="villeSta">Ville de la station<span class="requis">*</span></label>

                <input type="text" id="villeSta" name="villeSta" size="20" maxlength="20" />

                <span class="erreur">${form.erreurs['"villeSta"']}</span>

                <br />


                <label for="codePsta">Code postal de la station</label>

                <input type="text" id="codePsta" name="codePsta" size="20" maxlength="20" />

                <span class="erreur">${form.erreurs['codePsta']}</span>

                <br />
                

			    <label for="nbPlaceSta">Nom de places de la station</label>

                <input type="text" id="nbPlaceSta" name="nbPlaceSta" size="20" maxlength="20" />

                <span class="erreur">${form.erreurs['nbPlaceSta']}</span>

                <br />


				<input type="submit" value="Ajouter" class="sansLabel" />

                <br />
                

                <p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>

            </fieldset>

        </form>

    </body>

</html>