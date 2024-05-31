import psutil
import logging
from datetime import datetime

# Configure logging
logging.basicConfig(filename='system_health.log', level=logging.INFO, format='%(asctime)s - %(message)s')

# Define thresholds
CPU_USAGE_THRESHOLD = 80.0
MEMORY_USAGE_THRESHOLD = 80.0
DISK_USAGE_THRESHOLD = 80.0
PROCESS_COUNT_THRESHOLD = 200

def check_cpu_usage():
    cpu_usage = psutil.cpu_percent(interval=1)
    if cpu_usage > CPU_USAGE_THRESHOLD:
        logging.info(f'High CPU usage detected: {cpu_usage}%')
    return cpu_usage

def check_memory_usage():
    memory_info = psutil.virtual_memory()
    memory_usage = memory_info.percent
    if memory_usage > MEMORY_USAGE_THRESHOLD:
        logging.info(f'High Memory usage detected: {memory_usage}%')
    return memory_usage

def check_disk_usage():
    disk_info = psutil.disk_usage('/')
    disk_usage = disk_info.percent
    if disk_usage > DISK_USAGE_THRESHOLD:
        logging.info(f'High Disk usage detected: {disk_usage}%')
    return disk_usage

def check_process_count():
    process_count = len(psutil.pids())
    if process_count > PROCESS_COUNT_THRESHOLD:
        logging.info(f'High number of processes detected: {process_count}')
    return process_count

def log_system_health():
    cpu_usage = check_cpu_usage()
    memory_usage = check_memory_usage()
    disk_usage = check_disk_usage()
    process_count = check_process_count()
    
    logging.info(f'CPU Usage: {cpu_usage}%')
    logging.info(f'Memory Usage: {memory_usage}%')
    logging.info(f'Disk Usage: {disk_usage}%')
    logging.info(f'Running Processes: {process_count}')

if _name_ == '_main_':
    log_system_health()
