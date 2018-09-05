<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.ufc.russas.n2s.chronos.beans.UsuarioBeans"%>
<%@page import="br.ufc.russas.n2s.chronos.util.Constantes"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="<%=Constantes.getAppUrl()%>"> <img
		src="${pageContext.request.contextPath}/resources/img/ARQUIVODEIMAGEM.png"
		width="100" height="30" class="d-inline-block align-top"
		alt="Logo do m�dulo ">
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		<div class="navbar-nav">
			<c:set var="permissoes"
				value="${sessionScope.usuarioChronos.permissoes}"></c:set>
			<a class="nav-item nav-link"
				href="<%=Constantes.getAppGuardiaoUrl()%>">Guardi�o</a> <a
				class="nav-item nav-link"
				href="<%=Constantes.getAppUrl()%>/minhasAtividades">Minhas
				Atividades</a>
			<c:if
				test="${fn:contains(permissoes, 'APOIO') or fn:contains(permissoes, 'ADMINISTRADOR')}">
				<div class="btn-group">
					<a href="" class="nav-item nav-link " data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Administra��o </a>
					<div class="dropdown-menu">
						<a class="dropdown-item"
							href="<%=Constantes.getAppUrl()%>/cadastrarAtividade">Cadastrar
							Atividade</a>

						<c:if test="${fn:contains(permissoes, 'ADMINISTRADOR')}">
							<div class="dropdown-divider"></div>
							<a class="dropdown-item"
								href="<%=Constantes.getAppUrl()%>/permissoes">Gerenciar
								permiss�es</a>
						</c:if>
					</div>
				</div>
			</c:if>

		</div>
	</div>
	<c:if test="${session.usuario!=null}">
		<td class="text-center">
			<form method="POST" action="a paradinha pra onde tem q ir"
				accept-charset="UTF-8" enctype="multipart/form-data"
				id="needs-validation" novalidate>
				<input type="button" class="btn btn-primary" value="login"
					data-toggle="modal" data-target="#login"
					style="max-width: 51px; max-height: 32px; padding-top: 4px; padding-bottom: 4px; padding-left: 8px; padding-right: 8px; float: right; margin-right: 10px") >
				<div class="modal fade" id="login" tabindex="-1" role="dialog"
					aria-labelledby="modalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="modalLabel">Login</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">

								<div class="container">
									<label for="uname"><h6>Username</h6></label> <input type="text"
										placeholder="Enter Username" name="uname" required> <label
										for="psw"><h6>Password</h6></label> <input type="password"
										placeholder="Enter Password" name="psw" required>
								</div>
								<div class="container">
									<button type="button" class="btn btn-danger"
										style="float: right; margin: 5px;">Cancelar</button>
									<button type="submit" class="btn btn-primary"
										style="float: right; margin: 5px;">Login</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
	</c:if>
	<a class="btn-sm btn-light text-right"
		href="<%=Constantes.getAppUrl()%>/sair">Sair</a>
</nav>