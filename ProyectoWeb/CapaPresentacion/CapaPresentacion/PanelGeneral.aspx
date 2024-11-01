<%@ Page Title="Panel General" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="PanelGeneral.aspx.cs" Inherits="CapaPresentacion.PanelGeneral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .info-box {
            display: flex;
            align-items: center;
            background: #f7f7f7;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 15px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        .info-box-icon {
            font-size: 45px;
            padding: 15px;
            color: #fff;
            background-color: #007bff;
            border-radius: 5px 0 0 5px;
        }
        .info-box-content {
            padding-left: 15px;
        }
        .info-box-content .info-box-text {
            font-size: 20px;
            font-weight: bold;
        }
        .info-box-content .info-box-number {
            font-size: 30px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <!-- estructura de bienvenida con tarjetas informativas -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="info-box">
                    <span class="info-box-icon bg-info"><i class="fa fa-users"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Usuarios Registrados</span>
                        <span class="info-box-number">1,234</span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="info-box">
                    <span class="info-box-icon bg-success"><i class="fa fa-file-medical"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Consultas Hoy</span>
                        <span class="info-box-number">56</span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="info-box">
                    <span class="info-box-icon bg-danger"><i class="fa fa-calendar-check"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Citas Programadas</span>
                        <span class="info-box-number">89</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sección de bienvenida -->
        <div class="jumbotron">
            <h1>¡Bienvenido Administrador!</h1>
            <p class="lead">Aquí puedes gestionar todas las operaciones del sistema de la clínica. Utiliza el menú de la izquierda para acceder a las diferentes secciones.</p>
            <hr class="my-4">
            <p>Recuerda revisar los reportes diarios y administrar los usuarios del sistema.</p>
        </div>
    </div>
</asp:Content>