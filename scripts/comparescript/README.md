## Compare TimeStamp of Files in Linux

### Usage

**Step 1:** Create files - since we want to compare timestamp, create these files in order and allow a few seconds of time difference.  

```
touch abc1.txt
touch abc2.txt
touch abc3.txt
```

**Step 2:** Run Script - by default the script is setup to print ```abc3.txt modification time is recent compared to abc2.txt``` , as it compares the timestamp between ```abc3.txt``` and ```abc2.txt```. 

```
bash compare_timestamp.sh
```

**Note:** This is a simple script that compares the values (in seconds) of 2 files and prints a message if the value1 is greater than value2. 


### Description
```stat``` is a command-line utility that displays detailed information about given files or file systems.

*Option*
```
-c  --format=FORMAT     use the specified FORMAT instead of the default
```

*Format*
```
%Y   time of last data modification, seconds since Epoch
```

### What is Unix (Epoch) time?
```Unix time (also known as Epoch time, POSIX time,[1] seconds since the Epoch,[2] or UNIX Epoch time[3]) is a system for describing a point in time. It is the number of seconds that have elapsed since the Unix epoch, minus leap seconds; the Unix epoch is 00:00:00 UTC on 1 January 1970 (an arbitrary date); leap seconds are ignored,[4] with a leap second having the same Unix time as the second before it, and every day is treated as if it contains exactly 86400 seconds.``` [Source](https://en.wikipedia.org/wiki/Unix_time)