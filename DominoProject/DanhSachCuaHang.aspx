<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="DanhSachCuaHang.aspx.cs" Inherits="DoAnTest.DanhSachCuaHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/DanhSachCuaHang.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-bGii8WpW1fOKTg4zBAbFi6F5BL1MAJX+1Yd0Zd75G4APfFZxW8M3+gBt5SgT5N4N" crossorigin="anonymous">
    <div class="map">
        <div>
            <div class="map-container" id="map1">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d22166.879404654264!2d106.78490291059458!3d10.842831932948224!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752711fcf07a91%3A0x1a139ce2bb37c951!2zRG9taW5vJ3MgUGl6emEgTMOqIFbEg24gVmnhu4d0!5e0!3m2!1svi!2s!4v1699932207583!5m2!1svi!2s" width="800" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <div class="map-container" id="map2">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d44334.337346317996!2d106.78223248636436!3d10.838927588068232!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527b8f02b4037%3A0x1eb8623512379821!2sDomino&#39;s%20Pizza%20Kha%20V%E1%BA%A1n%20C%C3%A2n!5e0!3m2!1svi!2s!4v1699932474458!5m2!1svi!2s" width="800" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
        <div>
            <div class="location" onclick="toggleMap('map1')">
                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 384 512"><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                <div>
                    <p>Dominos - LE VAN VIET cách</p>
                    <p>10:00 am - 09:30 pm</p>
                    <p>196 Le Van Viet Street, Tang Nhon Phu B Ward, District 9</p>
                </div>
            </div>
            <div class="location" onclick="toggleMap('map2')">
                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 384 512"><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                <div>
                    <p>Dominos - KHA VAN CAN</p>
                    <p>10:00 am - 09:30 pm</p>
                    <p>738 Kha Van Can Street, Linh Dong Ward, Thu Duc District</p>
                </div>
            </div>
        </div>
    </div>
    <script>
        function toggleMap(mapId) {
            // Hide all maps
            var maps = document.getElementsByClassName('map-container');
            for (var i = 0; i < maps.length; i++) {
                maps[i].style.display = 'none';
            }

            // Show the selected map
            var selectedMap = document.getElementById(mapId);
            if (selectedMap) {
                selectedMap.style.display = 'block';
            }
        }
    </script>
</asp:Content>
