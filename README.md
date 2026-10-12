# Flutter RefreshIndicator Demo

The app simulates an email inbox that fetches new messages with dynamic timestamps from a mock backend when the user pulls down from the top of the screen using the `RefreshIndicator`

### Key Features

*   **Pull-to-Refresh:** Implements the standard Material Design `RefreshIndicator` to trigger state changes.
*   **Simulated Network Request:** Uses `Future.delayed` to mimic a 2-second backend database query, keeping the loading spinner active and visible for the demo.
*   **Dynamic Timestamps:** Captures the device's exact `DateTime.now()` and formats it into standard hours and minutes for every new message fetched.
*   **Forced Scrolling:** Utilizes `AlwaysScrollableScrollPhysics` to guarantee the pull gesture works even if the inbox only contains one or two messages.

### Key Widget Attributes Showcased

1.  **`onRefresh`:** An asynchronous function (`Future`) that executes when the user pulls down.
2.  **`color`:** Customizes the visual colors of the spinning arrow and its background circle.
3.  **`child`:** Wraps a scrollable widget (`ListView`). If the child cannot scroll, the `RefreshIndicator` cannot detect the physical pull gesture.

## How to Run

1. Ensure you have the Flutter SDK installed and an emulator running (or a device connected).
2. Clone this repository to a **local directory**
3. Open your terminal and run the following commands:

```bash
cd refresh_indicator
flutter clean
flutter pub get
flutter run
