main.dart:
    main programs

# home_page.dart:
**STRUCTURE**
    appbar: none
    body: 
            logo
            search bar

            row        
                column
                    parking-place-container(object)
                    .
                    .
                    .
                column
                    parking-place-container(object)
                    .
                    .
                    .
#               //research how to sort the parking-place-container
#                 that it will render the green containers first
#                 i.e. highest total available -> to lowest total available

**WIDGET**
    parking-place container(ParkingPlace object):
        container
            column
            switch ParkingPlace.total_available:
                case > 3:
                    bg = green
                case < 3 and > 0:
                    bg = yellow
                case < 1:
                    bg = red
            
                image: ParkingPlace.img
                    column
                        text: ParkingPlace.location
                        text: ParkingPlace.total_available

                button:
                    text: view
#                    // research how to route that also send data of the object
#                    // i.e parking-place(blanco-hall) if clicked view =>
#                       => its gonna get that its blanco object

# detail_page.dart:
**STRUCTURE**
    appbar: 
        icon: back
        title: ParkingPlace.location

    listview:
        img: ParkingPlace.image

        row
            text: ParkingPlace.location
            text: ParkingPlace.total_available

        //if ParkingPlace orientation is vertical or horizontal
        row:
            parking-spot-container(object, number)
            .
            .
            .
        
        //if horizontal
        row:
            columns:
                .
                .
                .
            colunns:
                .
                .
                .
        map img

**WIDGET**
    parking-spot-container(ParkingPlace object, number)
        if ParkingPlace.spots[i] >= 1:
            render spot-occupied
        else:
            render spot-available

    spot-occupied
        if ParkingPlace.orientation == "vertical":
            column
                text: number
                bg = red
                img //car icon
        else
            row
                text: number
                bg = red
                img
        
    spot-availabe
        if ParkingPlace.orientation == "vertical":
            column
                text: number
                bg = green
        else:
            row
                text: number
                bg = green
    
    
**ALGO**
    should be using oop
    to model the date
    class ParkingPlace:
        string location
        string image
        string id //for routing?
        string alignment // wheter orientation is horizontal or vertical view
        num total_available
        list spots [
            0,
            0,
            0,
        ] 
        //1 means occupied, 0 available
#    the property of the object should be initialized by firebase firestore stream builder

#    NEEDED TO BE RESEARCHED
##        does using stream builder make apps laggy, for example it is still listiining to data
##        even tho the user is in the other page.
##        whats the best practices for firebase flutter?
##        whats the best practices when dealing with real time data?

