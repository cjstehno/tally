# Tally

> *Work in Progress.* - this is not a working project yet.

A simple web-based Flutter app for keeping track of players and points for board games.

## Building

To build for release run:

    flutter build web --base-href=/tally/

## Development Running

You can run in development mode with:

    flutter run -d chrome

## Local Running

You can run the local build artifacts using the following, executed in the `build/web` directory:

    python3 -m http.server 8080


## Publish Site

To publish the site, you need to have the `app` branch checked out as a separate clone. Build the web application, as described above and then run the following to copy the artifacts to the site repository:

    rsync -r build/web/* <path_to_app_clone>/

where `<path_to_app_clone>` is the path to your separate clone on the `app` branch.

Then, in the "app clone" commit and push the changes to deploy the site.


## License

??