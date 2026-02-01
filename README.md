# Crypto Shop (Test App)

This is a small Flutter app built as part of a test assignment. It demonstrates:

- **Feature-first architecture**
- **Pagination** implemented with [flutter_bloc](https://pub.dev/packages/flutter_bloc) and [bloc_concurrency](https://pub.dev/packages/bloc_concurrency)
- Networking via a **REST API** (requires an API key)

## API Key Setup

This app uses the CoinCap Pro REST API, so you need an **API Key** to run it.

### Option A (recommended): Use `.env` + Envied

The project uses the [Envied](https://pub.dev/packages/envied) package to store sensitive configuration values.

1. Sign up / sign in to CoinCap Pro:  
   https://pro.coincap.io/signin

2. Generate your API Key in the dashboard.

3. Create a `.env` file in the project root and add:
```text
API_KEY=your_key
```
4. Run code generation:
dart run build_runner
```bash
dart run build_runner build --delete-conflicting-outputs
```
### Option B (quick): Hardcode the key in `DioClient.dart`

If you want to save time, you can also paste your API key directly into `DioClient.dart`.
There is a `TODO` comment showing exactly which variable you need to replace.

## Run

After configuring the API key, run:

```bash
flutter pub get
```
```bash
flutter run
```
