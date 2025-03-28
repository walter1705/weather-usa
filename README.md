# WeatherUsa

**Weather on USA within ICAO codes**

Version: **v0.1.0**

## Description

WeatherUsa is a command-line tool that fetches weather information for locations in the USA using ICAO airport codes. It utilizes XML parsing and HTTP requests to gather real-time weather data.

## Features
- Retrieve weather data using ICAO codes.
- Parse and display weather data in a structured format.
- Command-line interface (CLI) for easy usage.
- Output formatted as a table for readability.

## Installation

### Prerequisites
- Elixir **1.17** or later installed.
- `Mix` build tool.

### Clone the Repository
```sh
git clone https://github.com/yourusername/weather_usa.git
cd weather_usa
```

### Fetch Dependencies
```sh
mix deps.get
```

### Compile the Project
```sh
mix compile
```

### Generate Documentation
```sh
mix docs
```

### Build Executable
```sh
mix escript.build
```
This will generate an executable named `weather_usa`.

## Usage

### Run the CLI
```sh
./weather_usa {ICAO_CODE}
```

### Example
```sh
./weather_usa KLAX
```
Output:
```
+------------------+----------------------------+
| Location        | Los Angeles, CA            |
| Weather        | Partly Cloudy              |
| Temperature    | 64.0 F (17.8 C)            |
| Humidity       | 63%                        |
| Wind          | West at 15.0 MPH, Gust 23.0 |
| Pressure      | 1016.1 mb                   |
| Visibility    | 9.00 miles                  |
+------------------+----------------------------+
```

### Help Menu
```sh
./weather_usa -h
```

## Modules

### `WeatherUsa`
The main module of the application.

### `WeatherUsa.CLI`
Handles command-line interactions.
- `main(argvs)`: Entry point for CLI execution.
- `parse_argvs(argvs)`: Parses user arguments.
- `process(arg)`: Processes ICAO codes.
- `print_table(rows, header)`: Displays formatted output.

### `WeatherUsa.Schema`
Defines data structures for weather data.

### `WeatherUsa.Service.Client`
Handles HTTP requests to fetch weather data.

### `WeatherUsa.Service.Parser`
Parses XML responses from the weather API.

## Dependencies
- [`sweet_xml`](https://hex.pm/packages/sweet_xml) - XML parsing
- [`httpoison`](https://hex.pm/packages/httpoison) - HTTP client
- [`ex_doc`](https://hex.pm/packages/ex_doc) - Documentation generator
- [`earmark`](https://hex.pm/packages/earmark) - Markdown to HTML
- [`table_rex`](https://hex.pm/packages/table_rex) - Table formatting

## License
This project is licensed under the MIT License.

## Author
- **Walter1705** - [GitHub](https://github.com/yourusername)

