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
