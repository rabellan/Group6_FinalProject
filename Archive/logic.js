document.addEventListener('DOMContentLoaded', function() {
  var map = L.map('map').setView([34.0522, -118.2437], 10); // Default to Los Angeles

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© OpenStreetMap contributors'
  }).addTo(map);

  // Function to change the map view
  function changeMapView(lat, lng, zoom) {
      map.setView(new L.LatLng(lat, lng), zoom);
  }

  // Event listener for city selection
  document.getElementById('cityForm').addEventListener('change', function(e) {
      switch(e.target.value) {
          case 'Los Angeles':
              changeMapView(34.0522, -118.2437, 10);
              break;
          case 'Austin':
              changeMapView(30.2672, -97.7431, 10);
              break;
          case 'Miami':
              changeMapView(25.7617, -80.1918, 10);
              break;
          case 'New York City':
              changeMapView(40.7128, -74.0060, 10);
              break;
          case 'Chicago':
              changeMapView(41.8781, -87.6298, 10);
              break;
        }
      });
});