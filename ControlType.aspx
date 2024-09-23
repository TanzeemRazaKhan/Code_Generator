<%@ Page Title="" Language="C#" MasterPageFile="~/CodeGenerator.master" AutoEventWireup="true" CodeFile="ControlType.aspx.cs" Inherits="ControlType" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ajaxToolkit:ToolkitScriptManager ID="sm1" ScriptMode="Release" runat="server"></ajaxToolkit:ToolkitScriptManager>
    <asp:Panel ID="PanelGrdView" runat="server" Width="100 %" Visible="false">
        <div class="page-wrapper" style="min-height: 568px;">
            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col">
                            <h3 class="page-title">Control Type</h3>
                        </div>
                        <div class="col-auto float-end ms-auto">
                            <div class="form-group mb-0">
                                <div class="settings-btns">
                                    <asp:Button ID="btnAdd" Text="Add New" class="btn btn-orange" runat="server" OnClick="btnAdd_Click" />
                                    <asp:HyperLink class="btn btn-grey" Text="Return" runat="server" NavigateUrl="#"></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="table-datatables" class="table-responsive">
                    <asp:GridView ID="gvv" runat="server" class="table table-nowrap mb-0" EmptyDataText="No records found" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="ValidationType" HeaderText="ValidationType" SortExpression="ValidationType" />
                            <asp:BoundField DataField="ControlType" HeaderText="ControlType" SortExpression="ControlType" />
                            <asp:BoundField DataField="Edit" HeaderText="Edit" SortExpression="Edit" />
                            <asp:BoundField DataField="Delete" HeaderText="Delete" SortExpression="Delete" />
                        </Columns>
                        <RowStyle HorizontalAlign="Center"></RowStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                        <PagerStyle HorizontalAlign="Center" CssClass="gridpaging" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <link href="../assets/css/Gridview.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
        <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
        <script src="https://cdn.datatables.net/buttons/1.4.1/js/dataTables.buttons.min.js"></script>
        <script src="//cdn.datatables.net/buttons/1.4.1/js/buttons.flash.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.4.1/js/buttons.html5.min.js"></script>
        <script src="../assets/js/feather.min.js"></script>
        <script src="../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="../assets/js/script.js"></script>
        <script type="text/javascript">
            $(function () {
                $.ajax({
                    type: "POST",
                    url: "ControlType.aspx/GetData",
                    beforeSend: function () {
                    },
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,
                    complete: function (data) {
                    },
                    failure: function (response) {
                    },
                    error: function (response) {
                    }
                });
            });
            function OnSuccess(response) {
                $("[id*=gvv]").DataTable({
                    dom: 'Blfrtip',
                    pageLength: 8,
                    buttons: [
                        {
                            extend: 'excelHtml5',
                            text: 'Download Excel'
                        }
                    ],
                    lengthChange: true,
                    lengthMenu: [8, 15, 25],
                    searching: true,
                    sorting: true,
                    order: [],
                    paging: true,
                    data: response.d,
                    columns: [
                        {
                            data: 'ValidationType',
                            name: 'ValidationType',
                        },
                        {
                            data: 'ControlType',
                            name: 'ControlType',
                        },
                        {
                            data: 'Id',
                            name: 'Id',
                            render: function (data, type, row, meta) {
                                return '<a class="d-inline-block fw-normal w-100 h-100 pe-auto text-primary" style="text-align:justify;" href="ControlType.aspx?Id=' + row.Id + '"><i class="fas fa-edit"></i></a>';
                            },
                        },
                        {
                            data: 'Id',
                            name: 'Id',
                            render: function (data, type, row, meta) {
                                return '<a class="d-inline-block fw-normal w-100 h-100 pe-auto text-danger" style="text-align:justify;" href="ControlType.aspx?action=delete&Id=' + row.Id + '"><i class="fas fa-trash-alt"></i></a>';
                            },
                        }
                    ]
                });
            };
        </script>
        <script>
            function OpenConfirmDialog(a) {
                $("#myModal2").modal('show');
            }
        </script>
        <div id="myModal2" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <p>
                            <asp:Literal ID="litmsg" runat="server"></asp:Literal>
                        </p>
                    </div>
                    <p style="margin-top: 15px; margin-left: 15px;">
                        <asp:Literal ID="litid2" runat="server"></asp:Literal>
                    </p>
                    <div class="modal-body">
                        <div class="row" style="margin-top: -25px;">
                            <div class="input-field col s2 l2 m2">
                                <asp:Button ID="BtnDelete" OnClick="BtnDelete_Click" BackColor="Red" ForeColor="White" class="mt-4 right btn waves-effect waves-light Click-here" runat="server" Text="Delete" />
                                &nbsp;&nbsp;
                        <asp:Button ID="btnCancel" BackColor="#3D5EE1" ForeColor="White" OnClick="btnCancel_Click" class="mt-4 right btn waves-effect waves-light Click-here" runat="server" Text="Cancel" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelAdd" runat="server" Width="100%" Visible="false">
        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card comman-shadow">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="form-title student-info">Add Control</h5>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>ValidationType Name:</label>
                                            <asp:TextBox ID="txtValidationType" ValidationGroup="AddControl" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>ControlType Name:</label>
                                            <asp:TextBox ID="txtControlType" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group mb-0">
                                            <div class="settings-btns">
                                                <asp:Button ID="btnSave" runat="server" ValidationGroup="AddControl" OnClick="btnSave_Click" Text="Save" CssClass="btn btn-orange" />
                                                <asp:Button ID="Button1" runat="server" OnClick="btnCancel_Click" Text="Cancel" class="btn btn-grey" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script type="text/javascript">
            function successWithRedirect(message, color, status) {
                Swal.fire({
                    title: message,
                    icon: status,
                    confirmButtonColor: color,
                }).then((result) => {
                    if (result.isConfirmed) {
                        setTimeout(function () {
                            window.location.replace('ControlType.aspx');
                        }, 1000);
                    }
                });
            }
        </script>
        <script src="../assets/js/jquery-3.7.1.min.js"></script>
        <script src="../assets/js/feather.min.js"></script>
        <script src="../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="../assets/js/script.js"></script>
    </asp:Panel>
    <asp:Panel ID="PanelEdit" runat="server" Width="100 %" Visible="false">
        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card comman-shadow">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="form-title student-info">Edit Control</h5>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>ValidationType Name:</label>
                                            <asp:TextBox ID="txtEditValidationType" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvtxtEditValidationType" ControlToValidate="txtEditValidationType" runat="server" Display="Dynamic" ValidationGroup="EditControl" ErrorMessage="Please Enter ValidationType Name" ForeColor="Red"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>ControlType Name:</label>
                                            <asp:TextBox ID="txtEditControlType" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvtxtEditControlType" ControlToValidate="txtEditControlType" runat="server" Display="Dynamic" ValidationGroup="EditControl" ErrorMessage="Please Enter ControlType Name" ForeColor="Red"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group mb-0">
                                            <div class="settings-btns">
                                                <asp:Button ID="btnEditUpdate" runat="server" ValidationGroup="EditControl" OnClick="btnEditUpdate_Click" Text="Update" CssClass="btn btn-orange" />
                                                <asp:Button ID="btnEditCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" class="btn btn-grey" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script type="text/javascript">
            function successWithRedirect(message, color, status) {
                Swal.fire({
                    title: message,
                    icon: status,
                    confirmButtonColor: color,
                }).then((result) => {
                    if (result.isConfirmed) {
                        setTimeout(function () {
                            window.location.replace('ControlType.aspx');
                        }, 1000);
                    }
                });
            }
        </script>
        <script src="../assets/js/jquery-3.7.1.min.js"></script>
        <script src="../assets/js/feather.min.js"></script>
        <script src="../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="../assets/js/script.js"></script>
    </asp:Panel>
</asp:Content>

