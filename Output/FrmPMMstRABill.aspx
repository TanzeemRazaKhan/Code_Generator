<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Panel ID="PanelGrdView" runat="server" Width="100 %" Visible="false">
<ajaxToolkit:ToolkitScriptManager ID="sm1" ScriptMode="Release" runat="server"></ajaxToolkit:ToolkitScriptManager>
<div class="page-wrapper" style="min-height: 568px;">
<div class="content container-fluid">
<div class="page-header">
<div class="row align-items-center">
<div class="col">
<h3 class="page-title">myView Master</h3>
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
<asp:BoundField DataField="RABillNo" HeaderText="RABillNo" SortExpression="RABillNo" />
<asp:BoundField DataField="OrgCode" HeaderText="OrgCode" SortExpression="OrgCode" />
<asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
<asp:BoundField DataField="CustCode" HeaderText="CustCode" SortExpression="CustCode" />
<asp:BoundField DataField="ProjectCode" HeaderText="ProjectCode" SortExpression="ProjectCode" />
<asp:BoundField DataField="BOQCode" HeaderText="BOQCode" SortExpression="BOQCode" />
<asp:BoundField DataField="RABillDate" HeaderText="RABillDate" SortExpression="RABillDate" />
<asp:BoundField DataField="ContraCode" HeaderText="ContraCode" SortExpression="ContraCode" />
<asp:BoundField DataField="HeadNum" HeaderText="HeadNum" SortExpression="HeadNum" />
<asp:BoundField DataField="SubHeadNum" HeaderText="SubHeadNum" SortExpression="SubHeadNum" />
<asp:BoundField DataField="Unit" HeaderText="Unit" SortExpression="Unit" />
<asp:BoundField DataField="WorkDoneAmount" HeaderText="WorkDoneAmount" SortExpression="WorkDoneAmount" />
<asp:BoundField DataField="PreviousWorkAmount" HeaderText="PreviousWorkAmount" SortExpression="PreviousWorkAmount" />
<asp:BoundField DataField="TotalWorkAmount" HeaderText="TotalWorkAmount" SortExpression="TotalWorkAmount" />
<asp:BoundField DataField="Deductions" HeaderText="Deductions" SortExpression="Deductions" />
<asp:BoundField DataField="NetPayableAmount" HeaderText="NetPayableAmount" SortExpression="NetPayableAmount" />
<asp:BoundField DataField="CreatedByEmpCode" HeaderText="CreatedByEmpCode" SortExpression="CreatedByEmpCode" />
<asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />
<asp:BoundField DataField="PaymentStatus" HeaderText="PaymentStatus" SortExpression="PaymentStatus" />
<asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
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
url: "FrmPMMstRABill.aspx/GetData",
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
data: 'RABillNo',
name: 'RABillNo',
},
{
data: 'OrgCode',
name: 'OrgCode',
},
{
data: 'UserId',
name: 'UserId',
},
{
data: 'CustCode',
name: 'CustCode',
},
{
data: 'ProjectCode',
name: 'ProjectCode',
},
{
data: 'BOQCode',
name: 'BOQCode',
},
{
data: 'RABillDate',
name: 'RABillDate',
},
{
data: 'ContraCode',
name: 'ContraCode',
},
{
data: 'HeadNum',
name: 'HeadNum',
},
{
data: 'SubHeadNum',
name: 'SubHeadNum',
},
{
data: 'Unit',
name: 'Unit',
},
{
data: 'WorkDoneAmount',
name: 'WorkDoneAmount',
},
{
data: 'PreviousWorkAmount',
name: 'PreviousWorkAmount',
},
{
data: 'TotalWorkAmount',
name: 'TotalWorkAmount',
},
{
data: 'Deductions',
name: 'Deductions',
},
{
data: 'NetPayableAmount',
name: 'NetPayableAmount',
},
{
data: 'CreatedByEmpCode',
name: 'CreatedByEmpCode',
},
{
data: 'Remark',
name: 'Remark',
},
{
data: 'PaymentStatus',
name: 'PaymentStatus',
},
{
data: 'Status',
name: 'Status',
},
{
data: 'RABillId',
name: 'RABillId',
render: function (data, type, row, meta) {
return '<a class="d-inline-block fw-normal w-100 h-100 pe-auto text-primary" style="text-align:justify;" href="FrmPMMstRABill.aspx?RABillId=' + row.RABillId + '"><i class="fas fa-edit"></i></a>';
},
},
{
data: 'RABillId',
name: 'RABillId',
render: function (data, type, row, meta) {
return '<a class="d-inline-block fw-normal w-100 h-100 pe-auto text-danger" style="text-align:justify;" href="FrmPMMstRABill.aspx?action=delete&RABillId=' + row.RABillId + '"><i class="fas fa-trash-alt"></i></a>';
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
<asp:Panel ID="PanelAdd" runat="server" Width="100%" Visible="false"><div class="page-wrapper"><div class="content container-fluid"><div class="row"><div class="col-sm-12"><div class="card comman-shadow"><div class="card-body"><div class="row"><div class="col-12"><h5 class="form-title student-info">Add Your hand</h5></div><div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>RABillNo:</label>
<asp:TextBox ID="txtRABillNo" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtRABillNo" ControlToValidate="txtRABillNo" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Enter RABillNo" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>CustCode:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlCustCode" ValidationGroup="AddSave" runat="server" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlCustCode" ControlToValidate="ddlCustCode" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Select CustCode" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>ProjectCode:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlProjectCode" ValidationGroup="AddSave" runat="server" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlProjectCode" ControlToValidate="ddlProjectCode" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Select ProjectCode" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>BOQCode:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlBOQCode" ValidationGroup="AddSave" runat="server" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlBOQCode" ControlToValidate="ddlBOQCode" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Select BOQCode" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>RABillDate:</label>
<asp:TextBox ID="txtRABillDate" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtRABillDate" ControlToValidate="txtRABillDate" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Enter RABillDate" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>ContraCode:</label>
<asp:TextBox ID="txtContraCode" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtContraCode" ControlToValidate="txtContraCode" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Enter ContraCode" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>HeadNum:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlHeadNum" ValidationGroup="AddSave" runat="server" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlHeadNum" ControlToValidate="ddlHeadNum" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Select HeadNum" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>SubHeadNum:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlSubHeadNum" ValidationGroup="AddSave" runat="server" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlSubHeadNum" ControlToValidate="ddlSubHeadNum" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Select SubHeadNum" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Unit:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlUnit" ValidationGroup="AddSave" runat="server" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlUnit" ControlToValidate="ddlUnit" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Select Unit" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>WorkDoneAmount:</label>
<asp:TextBox ID="txtWorkDoneAmount" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtWorkDoneAmount" ControlToValidate="txtWorkDoneAmount" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Enter WorkDoneAmount" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>PreviousWorkAmount:</label>
<asp:TextBox ID="txtPreviousWorkAmount" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtPreviousWorkAmount" ControlToValidate="txtPreviousWorkAmount" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Enter PreviousWorkAmount" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>TotalWorkAmount:</label>
<asp:TextBox ID="txtTotalWorkAmount" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtTotalWorkAmount" ControlToValidate="txtTotalWorkAmount" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Enter TotalWorkAmount" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Deductions:</label>
<asp:TextBox ID="txtDeductions" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtDeductions" ControlToValidate="txtDeductions" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Enter Deductions" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>NetPayableAmount:</label>
<asp:TextBox ID="txtNetPayableAmount" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtNetPayableAmount" ControlToValidate="txtNetPayableAmount" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Enter NetPayableAmount" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>CreatedByEmpCode:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlCreatedByEmpCode" ValidationGroup="AddSave" runat="server" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlCreatedByEmpCode" ControlToValidate="ddlCreatedByEmpCode" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Select CreatedByEmpCode" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Remark:</label>
<asp:TextBox ID="txtRemark" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtRemark" ControlToValidate="txtRemark" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Enter Remark" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>PaymentStatus:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlPaymentStatus" ValidationGroup="AddSave" runat="server" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlPaymentStatus" ControlToValidate="ddlPaymentStatus" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Select PaymentStatus" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Status:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlStatus" ValidationGroup="AddSave" runat="server" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlStatus" ControlToValidate="ddlStatus" runat="server" Display="Dynamic" ValidationGroup="AddSave" ErrorMessage="Select Status" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12">
<div class="form-group mb-0">
<div class="settings-btns">
<asp:Button ID="btnSave" runat="server" ValidationGroup="AddSave" OnClick="btnSave_Click" Text="Save" CssClass="btn btn-orange" />
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
window.location.replace('FrmPMMstRABill.aspx');
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
<div class="page-wrapper"><div class="content container-fluid"><div class="row"><div class="col-sm-12"><div class="card comman-shadow"><div class="card-body"><div class="row"><div class="col-12"><h5 class="form-title student-info">Add Your hand</h5></div><div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>RABillNo:</label>
<asp:TextBox ID="txtEditRABillNo" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtRABillNo" ControlToValidate="txtEditRABillNo" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Enter RABillNo" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>CustCode:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlEditCustCode" runat="server" ValidationGroup="EditSave" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlCustCode" ControlToValidate="ddlEditCustCode" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Select CustCode" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>ProjectCode:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlEditProjectCode" runat="server" ValidationGroup="EditSave" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlProjectCode" ControlToValidate="ddlEditProjectCode" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Select ProjectCode" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>BOQCode:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlEditBOQCode" runat="server" ValidationGroup="EditSave" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlBOQCode" ControlToValidate="ddlEditBOQCode" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Select BOQCode" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>RABillDate:</label>
<asp:TextBox ID="txtEditRABillDate" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtRABillDate" ControlToValidate="txtEditRABillDate" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Enter RABillDate" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>ContraCode:</label>
<asp:TextBox ID="txtEditContraCode" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtContraCode" ControlToValidate="txtEditContraCode" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Enter ContraCode" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>HeadNum:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlEditHeadNum" runat="server" ValidationGroup="EditSave" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlHeadNum" ControlToValidate="ddlEditHeadNum" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Select HeadNum" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>SubHeadNum:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlEditSubHeadNum" runat="server" ValidationGroup="EditSave" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlSubHeadNum" ControlToValidate="ddlEditSubHeadNum" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Select SubHeadNum" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Unit:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlEditUnit" runat="server" ValidationGroup="EditSave" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlUnit" ControlToValidate="ddlEditUnit" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Select Unit" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>WorkDoneAmount:</label>
<asp:TextBox ID="txtEditWorkDoneAmount" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtWorkDoneAmount" ControlToValidate="txtEditWorkDoneAmount" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Enter WorkDoneAmount" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>PreviousWorkAmount:</label>
<asp:TextBox ID="txtEditPreviousWorkAmount" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtPreviousWorkAmount" ControlToValidate="txtEditPreviousWorkAmount" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Enter PreviousWorkAmount" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>TotalWorkAmount:</label>
<asp:TextBox ID="txtEditTotalWorkAmount" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtTotalWorkAmount" ControlToValidate="txtEditTotalWorkAmount" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Enter TotalWorkAmount" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Deductions:</label>
<asp:TextBox ID="txtEditDeductions" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtDeductions" ControlToValidate="txtEditDeductions" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Enter Deductions" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>NetPayableAmount:</label>
<asp:TextBox ID="txtEditNetPayableAmount" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtNetPayableAmount" ControlToValidate="txtEditNetPayableAmount" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Enter NetPayableAmount" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>CreatedByEmpCode:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlEditCreatedByEmpCode" runat="server" ValidationGroup="EditSave" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlCreatedByEmpCode" ControlToValidate="ddlEditCreatedByEmpCode" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Select CreatedByEmpCode" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Remark:</label>
<asp:TextBox ID="txtEditRemark" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rqtxtRemark" ControlToValidate="txtEditRemark" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Enter Remark" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>PaymentStatus:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlEditPaymentStatus" runat="server" ValidationGroup="EditSave" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlPaymentStatus" ControlToValidate="ddlEditPaymentStatus" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Select PaymentStatus" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12 col-sm-4">
<div class="form-group local-forms">
<label>Status:</label>
<asp:UpdatePanel ID='UpdatePanel2' runat='server'>
<ContentTemplate>
<asp:DropDownList ID="ddlEditStatus" runat="server" ValidationGroup="EditSave" CssClass="form-control form-select">
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
</ContentTemplate>
</asp:UpdatePanel>
<asp:RequiredFieldValidator ID="rqddlStatus" ControlToValidate="ddlEditStatus" runat="server" Display="Dynamic" ValidationGroup="EditSave" ErrorMessage="Select Status" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="col-12">
<div class="form-group mb-0">
<div class="settings-btns">
<asp:Button ID="btnEditUpdate" runat="server" ValidationGroup="EditSave" OnClick="btnEditUpdate_Click" Text="Update" CssClass="btn btn-orange" />
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
window.location.replace('FrmPMMstRABill.aspx');
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
