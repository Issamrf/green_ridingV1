import 'package:geolocator/geolocator.dart';
import 'package:green_riding/dataHandler/appData.dart';
import 'package:green_riding/models/address.dart';
import 'package:green_riding/services/requests.dart';
import 'package:provider/provider.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(
      Position position, context) async {
    String placeAdress = "";
    String st1, st2, st3, st4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyC6nZUnGGN8HZlZX-jNgivAEsTs6JQJ_xw";

    var response = await Requests.getRequest(url);
    if (response != "failed") {
      //placeAdress = response["results"][0]["formatted_adress"];
      st1 = response["results"][0]["adress_components"][3]["long_name"];
      st2 = response["results"][0]["adress_components"][4]["long_name"];
      st3 = response["results"][0]["adress_components"][5]["long_name"];
      st4 = response["results"][0]["adress_components"][6]["long_name"];
      placeAdress = st1 + ", " + st2 + ", " + st3 + ", " + st4;

      Address userPickUpAdress = new Address();
      userPickUpAdress.longitude = position.longitude;
      userPickUpAdress.latitude = position.latitude;
      userPickUpAdress.placeName = placeAdress;
      Provider.of<AppData>(context, listen: false)
          .updatePickupLocationAddress(userPickUpAdress);
    }
    return placeAdress;
  }
}
