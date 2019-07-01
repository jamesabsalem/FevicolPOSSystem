<%@ Page Title="" Language="C#" MasterPageFile="~/fevicol/InvMasterPage.Master" AutoEventWireup="true" CodeBehind="InvReport.aspx.cs" Inherits="Fevicol.Inventory.InvReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <rsweb:ReportViewer ID="InvReportViewer" runat="server"></rsweb:ReportViewer>
    
</asp:Content>
