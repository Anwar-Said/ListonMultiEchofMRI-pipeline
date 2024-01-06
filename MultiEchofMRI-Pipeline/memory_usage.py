import psutil
import time
import csv
import datetime
import sys

# Name of the CSV file to save the data
# FILENAME = "memory_usage.csv"
FILENAME = sys.argv[1]
def get_memory_usage():
    """Return the used memory in GBs."""
    memory_info = psutil.virtual_memory()
    used_memory_gb = memory_info.used / (1024 ** 3)  # Convert bytes to gigabytes
    return f"{used_memory_gb:.2f}GB"
def get_number_of_threads():
    """Return the number of currently running threads."""
    return psutil.Process().num_threads()

def main():
    # Create or append to the CSV file
    with open(FILENAME, 'a', newline='') as file:
        writer = csv.writer(file)
        
        # If the file is empty, write the headers
        if file.tell() == 0:
            writer.writerow(["Timestamp", "Memory Usage (%)"])
        
        while True:
            # Get the current timestamp and memory usage
            timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            memory_usage = get_memory_usage()
            num_threads = get_number_of_threads()
            # Write to CSV
            writer.writerow([timestamp, memory_usage,num_threads])
            print(f"{timestamp},: Recorded memory usage: {memory_usage}, num_threads:{num_threads}")
            file.flush()
            # Wait for 60 seconds
            time.sleep(60)

if __name__ == "__main__":
    main()
