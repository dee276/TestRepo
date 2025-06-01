#script that finds all occurrences of dates in the format `dd-mm-yyyy` in a file and prints them.

import re

# Compile the regular expression pattern for dates
date_pattern = re.compile(r"(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-(19|20)\d{2}")

# Open the source file and a result file to write the dates
with open('sample.txt', 'r') as sample, open('resultDate.txt', 'w') as dates:
    for line in sample:
        # Find all matches in the current line
        found_dates = re.findall(date_pattern, line)
        # Check if any dates were found
        if found_dates:
            # Convert list of tuples to list of strings
            found_dates = ['-'.join(date) for date in found_dates] #list generator using join
            # Write the found dates to the result file
            dates.write('\n'.join(found_dates) + '\n')
            # Print the found dates
            print(found_dates)