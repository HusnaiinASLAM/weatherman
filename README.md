# Weatherman

Weatherman is a command-line tool that provides weather data analysis for a given city and time period. It retrieves weather data from a dataset and offers various functionalities to analyze and visualize the data.

## Installation

1. Clone the repository:

   ```
   git clone https://github.com/HusnaiinASLAM/weatherman.git
   ```

2. Navigate to the project directory:

   ```
   cd weatherman
   ```

3. Install the required dependencies:

   ```
   bundle install
   ```

## Usage

The Weatherman tool supports the following commands:

1. **Display highest temperature, lowest temperature, and most humid day for a given year and city:**

   ```
   ruby weatherman.rb -e YEAR CITY_NAME
   ```

   Example:
   ```
   ruby weatherman.rb -e 2006 dubai
   ```

2. **Display average highest temperature, average lowest temperature, and average humidity for a given month and city:**

   ```
   ruby weatherman.rb -a YEAR/MONTH CITY_NAME
   ```

   Example:
   ```
   ruby weatherman.rb -a 2005/6 dubai
   ```

3. **Draw horizontal bar charts for the highest and lowest temperature on each day for a given month and city:**

   ```
   ruby weatherman.rb -c YEAR/MONTH CITY_NAME
   ```

   Example:
   ```
   ruby weatherman.rb -c 2005/6 dubai
   ```

4. **BONUS TASK: Draw a combined horizontal bar chart for the highest and lowest temperature on each day for a given month and city:**

   ```
   ruby weatherman.rb -cc YEAR/MONTH CITY_NAME
   ```

   Example:
   ```
   ruby weatherman.rb -cc 2005/6 dubai
   ```

## Error Handling

The Weatherman tool includes error handling for the following scenarios:

- Misspelled CITY_NAME or YEAR or file does not exist: Displays the error message "Data not found."
- Invalid entry for month (e.g., less than 1 or greater than 12): Displays an appropriate error message.
