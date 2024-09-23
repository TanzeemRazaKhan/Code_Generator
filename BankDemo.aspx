<%@ Page Title="" Language="C#" MasterPageFile="~/CodeGenerator.master" AutoEventWireup="true" CodeFile="BankDemo.aspx.cs" Inherits="BankDemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <title>Gallery Page</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <style>
        #map {
            height: 400px;
        }
    </style>
    <div class="page-wrapper">
        <div class="content container-fluid">
  <div id="map"></div>

    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script>
        var map = L.map('map').setView([28.367, 79.4304], 13); // Set view to Bareilly

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);

        L.marker([28.367, 79.4304]).addTo(map) // Add marker for Bareilly
            .bindPopup('Bareilly, India'); // Popup content
    </script>   </div>
    </div>
    </div>
   <script src="https://cdn.jsdelivr.net/npm/@zxing/library@0.19.0/umd/index.min.js"></script>

 </asp:Content>

