<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Sistema Fotovoltaico</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous" />
</head>
<body>
<div class="container-fluid text-center">
    <div>
        <img class="img-fluid" th:src="/@{/images/ShopmeAdminBig.png}" />
    </div>
  <form action="<%=request.getContextPath()%>/login" style="width: 25%;" method="post">


        <div class="border border-secondary p-3 rounded">
            <p>Sistema Fotovoltaico</p>
            <p>
                <input type="text" name="username" class="form-control" placeholder="Usuario" required autofocus/>
            </p>
            <p>
                <input type="password" name="password" class="form-control" placeholder="Contraseña" required />
            </p>
            <p>
                <input type="Submit" class="btn btn-primary" value="Iniciar Sesion" />
            </p>
        </div>
    </form>
</div>
</body>
</html>