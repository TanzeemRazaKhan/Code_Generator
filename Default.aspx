<%@ Page Title="" Language="C#" MasterPageFile="~/CodeGenerator.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ajaxToolkit:ToolkitScriptManager ID="sm1" ScriptMode="Release" runat="server"></ajaxToolkit:ToolkitScriptManager>
    <div class="page-wrapper" style="min-height: 500px!important;">
        <div class="content container-fluid">
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-sub-header">
                            <h3 class="page-title">Welcome To System Admin!</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-sm-6 col-12 d-flex">
                    <div class="card bg-comman w-100">
                        <div class="card-body">
                            <div class="db-widgets d-flex justify-content-between align-items-center">
                                <div class="db-info">
                                    <h6>News</h6>
                                    <h3>
                                        <asp:Literal ID="litNews" Text="0" runat="server"></asp:Literal></h3>
                                </div>
                                <div class="db-icon">
                                    <%--<i class="fas fa-newspaper fa-2x"></i>--%>
                                    <img src="../assets/img/icons/newspaper.png" alt="Dashboard Icon" style="max-width: 85%;" />
                                    <%--<img src="../assets/img/icons/dash-icon-01.svg" alt="Dashboard Icon">--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-sm-6 col-12 d-flex">
                    <div class="card bg-comman w-100">
                        <div class="card-body">
                            <div class="db-widgets d-flex justify-content-between align-items-center">
                                <div class="db-info">
                                    <h6>Organization</h6>
                                    <h3>
                                        <asp:Literal ID="litOrg" Text="0" runat="server"></asp:Literal></h3>
                                </div>
                                <div class="db-icon">
                                    <img src="../assets/img/icons/partners.png" alt="Dashboard Icon" style="max-width: 85%;" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-sm-6 col-12 d-flex">
                    <div class="card bg-comman w-100">
                        <div class="card-body">
                            <div class="db-widgets d-flex justify-content-between align-items-center">
                                <div class="db-info">
                                    <h6>Database</h6>
                                    <h3>
                                        <asp:Literal ID="litDatabase" runat="server"></asp:Literal></h3>
                                </div>
                                <div class="db-icon">
                                    <img src="../assets/img/icons/relational.png" alt="Dashboard Icon" style="max-width: 85%;" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../assets/js/jquery-3.7.1.min.js"></script>
    <script src="../assets/js/feather.min.js"></script>
    <script src="../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../assets/js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</asp:Content>

