<%@ Page Title="MultiCodeGenerator" Language="C#" MasterPageFile="~/CodeGenerator.master" AutoEventWireup="true" CodeFile="MultiCodeGenerator.aspx.cs" Inherits="MultiCodeGenerator" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ajaxToolkit:ToolkitScriptManager ID="sm1" ScriptMode="Release" runat="server"></ajaxToolkit:ToolkitScriptManager>
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card comman-shadow">
                        <div class="card-body">
                            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-12">
                                            <h5 class="form-title student-info">Multi Generate From</h5>
                                        </div>
                                        <div class="col-12 col-sm-4">
                                            <div class="form-group local-forms">
                                                <label>Select Database:</label>
                                                <asp:DropDownList ID="ddlDatabases" runat="server" CssClass="form-select form-control" OnSelectedIndexChanged="ddlDatabases_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-4">
                                            <div class="form-group local-forms">
                                                <label>Select Table:</label>
                                                <asp:DropDownList ID="ddlTables" CssClass="form-select form-control" OnSelectedIndexChanged="ddlTables_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-4">
                                        </div>
                                        <div class="table-responsive">
                                            <asp:Label ID="GrdLabel" runat="server"></asp:Label>
                                            <asp:GridView ID="GridViewColumns" CssClass="table table-bordered" HeaderStyle-CssClass="bg-primary text-white" AutoGenerateColumns="false" runat="server">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Column Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblColumnName" runat="server" Text='<%# Bind("ColumnName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Panel">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckView" runat="server" Text="View" />
                                                            &nbsp;&nbsp;
                                                            <asp:CheckBox ID="CheckAddFrom" runat="server" Text="Add" />
                                                            &nbsp;&nbsp;
                                                            <asp:CheckBox ID="CheckEditFrom" runat="server" Text="Edit" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Required">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckRequired" runat="server" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Validation">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddlValidation" CssClass="form-select form-control" runat="server"></asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Control Type">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddlControlType" CssClass="form-select form-control" runat="server"></asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Select Table">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddlTablesName" OnSelectedIndexChanged="ddlTablesName_SelectedIndexChanged" AutoPostBack="true" CssClass="form-select form-control" runat="server"></asp:DropDownList>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="From">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckSelect" runat="server" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Colunm Name">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddlColunm" CssClass="form-select form-control" runat="server"></asp:DropDownList>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <div class="col-12 col-sm-4">
                                            <div class="form-group local-forms">
                                                <label>Enter Page Name:</label>
                                                <asp:TextBox ID="txtName" class="form-control" ValidationGroup="Page" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvtxtName" ControlToValidate="txtName" runat="server" Display="Dynamic" ValidationGroup="Page" ErrorMessage="Please Enter Page Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revtxtName" runat="server" Display="Dynamic"
                                                    ErrorMessage="Please Enter only Alphabets" ControlToValidate="txtName" ForeColor="Red"
                                                    ValidationExpression="^[a-zA-Z\s]+$" ValidationGroup="Page">
                                                </asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card comman-shadow">
                        <div class="card-body">
                            <div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group mb-0">
                                            <div class="settings-btns">
                                                <asp:Button ID="btnGenerateAspx" BackColor="Green" BorderColor="Green" ValidationGroup="Page" runat="server" Text="Generate Aspx" OnClick="btnGenerateAspx_Click" class="btn btn-orange" />
                                                <asp:Button ID="btnGenerateCs" BackColor="Red" BorderColor="Red" runat="server" Text="Generate .Cs" class="btn btn-danger btn btn-orange" Visible="false" />
                                                <asp:Button ID="btnSave" runat="server" Text="Save" BackColor="Red" BorderColor="Red" class="btn btn-orange" OnClick="btnSave_Click" Visible="false" />
                                                <asp:Button ID="btnClear" runat="server" Text="Clear" class="btn btn-grey" OnClick="btnClear_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="card comman-shadow">
                        <div class="card-body">
                            <div>
                                <div class="row">

                                    <div class="form-group local-forms">
                                        <label>Aspx Code:</label>
                                        <textarea id="txtGeneratedCode" rows="10" cols="50" class="form-control" runat="server"></textarea>
                                        <br />
                                        <asp:Button ID="btnCopyaspx" runat="server" class="btn btn-danger btn btn-orange" Text="Copy" OnClientClick="copyToClipboardaspx(); return false;" />

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="card comman-shadow">
                            <div class="card-body">

                                <div class="form-group local-forms">
                                    <label>Cs Code:</label>
                                    <textarea id="txtGeneratedCodecs" class="form-control language-csharp" runat="server" rows="20" cols="80" readonly="readonly">         </textarea>
                                    <br />
                                    <asp:Button ID="btnCopycs" runat="server" class="btn btn-danger btn btn-orange" Text="Copy" OnClientClick="copyToClipboardcs(); return false;" />

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function copyToClipboardaspx() {
            var textarea = document.getElementById('<%= txtGeneratedCode.ClientID %>');
            textarea.select();

            try {
                var successful = document.execCommand('copy');
                var message = successful ? 'Code copied to clipboard!' : 'Unable to copy code to clipboard';

            } catch (err) {
                alert('Unable to copy code to clipboard');
            }
        }

        function copyToClipboardcs() {
            var textareacs = document.getElementById('<%= txtGeneratedCodecs.ClientID %>');
            textareacs.select();

            try {
                var successful = document.execCommand('copy');
                var message = successful ? 'Code copied to clipboard!' : 'Unable to copy code to clipboard';

            } catch (err) {
                alert('Unable to copy code to clipboard');
            }
        }
    </script>
    <script src="../assets/js/jquery-3.7.1.min.js"></script>
    <script src="../assets/js/feather.min.js"></script>
    <script src="../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../assets/js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <style>
        .table {
            color: #333;
            max-width: 100%;
            margin-bottom: 32px;
            width: 100%;
            border-collapse: collapse; /* Optional: collapse borders */
        }


            .table td {
                border: 0.9px solid;
            }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script type="text/javascript">
        function successWithRedirect(message, color, status) {
            Swal.fire({
                title: message,
                icon: status, // Use the status parameter for the icon type
                confirmButtonColor: color,
            }).then((result) => {
                if (result.isConfirmed) {
                    setTimeout(function () {
                        // Redirect user to a specific URL after a delay
                        // window.location.replace('ControlType.aspx');
                    }, 1000); // 1000 milliseconds delay
                }
            });
        }
    </script>


</asp:Content>

