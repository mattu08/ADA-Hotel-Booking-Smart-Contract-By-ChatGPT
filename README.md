# ADA-Hotel-Booking-Smart-Contract-ChatGPT
This is a ADA Plutus Hotel Booking Smart Contract written from a conversation with OpenAI's ChatGPT. There maybe some mistakes but not a bad job from ChatGPT, could see the start of something here!

## Question: Can you write an ADA smart used to book a hotel room, e.g. basic room 100 ADA, basic room with breakfast included 120 ADA and luxury room with breakfast included 170 ADA?

Yes, I can provide an example of a smart contract that allows users to book a hotel room with different options using the ADA cryptocurrency. Here's an example:

```haskell
-- Define a hotel booking smart contract that allows users to book different room options.

smart contract HotelBooking
  record Room =
    { name: String;
      price: Ada;
      breakfast: Boolean;
      luxury: Boolean; }

  -- Define the available room options.
  entrypoint getRoomOptions(): List(Room) is
    let basicRoom = {name: "Basic Room", price: 100, breakfast: False, luxury: False};
    let basicRoomWithBreakfast = {name: "Basic Room with Breakfast", price: 120, breakfast: True, luxury: False};
    let luxuryRoomWithBreakfast = {name: "Luxury Room with Breakfast", price: 170, breakfast: True, luxury: True};
    return [basicRoom, basicRoomWithBreakfast, luxuryRoomWithBreakfast];
  end getRoomOptions;

  -- Define a function to book a room.
  entrypoint bookRoom(roomIndex: Uint8): Bool is
    let roomOptions = getRoomOptions();
    let room = roomOptions[roomIndex];
    let bookingPrice = if room.luxury then room.price * 2 else room.price;
    let bookingPrice = if room.breakfast then bookingPrice + 20 else bookingPrice;
    require(tx.value >= bookingPrice, "Insufficient funds to book the room.");
    return True;
  end bookRoom;
end HotelBooking;
```

This smart contract defines a ***'Room'*** record type that represents a hotel room with a name, price, breakfast option, and luxury option. It also defines a ***'getRoomOptions()'*** function that returns a list of available room options.

The ***'bookRoom()'*** function allows users to book a room by specifying an index of the room option they want to book. The function calculates the booking price based on the selected room option and whether the user has chosen to add breakfast or book a luxury room. The function then checks that the user has sent enough ADA to cover the booking price and returns ***'True'*** if the booking is successful.

Note that this is just a simple example, and a real-world hotel booking smart contract would likely need additional functionality to handle room availability, booking dates, cancellations, and other features. Additionally, this smart contract does not handle any security concerns or validation, which would need to be added in a real-world application.

***End of Chat.***
