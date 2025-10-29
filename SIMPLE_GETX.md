# Simple WebSocket Chat with GetX

## What Changed?

### Before (without GetX):

-   Used `StatefulWidget`
-   Had to call `setState()` to update UI
-   Complex timer-based UI updates

### After (with GetX):

-   Uses `StatelessWidget`
-   UI updates automatically when data changes
-   Much cleaner code

## Key Files:

### 1. `chat_controller.dart`

```dart
final messages = <ChatMessage>[].obs;  // Observable list
```

-   `.obs` makes the list reactive
-   When you add messages, UI updates automatically

### 2. `chat_screen.dart`

```dart
Obx(() => ListView.builder(...))  // Reactive widget
```

-   `Obx()` watches for changes
-   Rebuilds only when `messages` changes

## How it Works:

1. Type message → Click send
2. `controller.sendMessage()` adds to `messages.obs`
3. `Obx()` detects change → UI updates automatically
4. Server sends back → Added to list → UI updates again

That's it! GetX makes your app reactive with minimal code changes.
