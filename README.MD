# Nginx Log Analyser

This script makes an analysis from log files with the [Combined Log Format](https://www.ibm.com/docs/en/webmethods-integration/wm-integration-server/11.1.0?topic=log-combined-format) structure

## Requirements

- Linux
- Bash
- `awk`
- `head`
- `sort`
- `uniq`
- `printf`

## Usage
```bash
./nginx-log-analyser.sh DIRECTORY
```

## Examples

Show the analysis of the example log file `nginx-access.log` included on the repo:

```bash
./nginx-log-analyser ./nginx-access.log
```


The output should look like:

```bash
The top 5 IP addresses with the most requests:
IP                   REQUESTS
178.128.94.113       1087
142.93.136.176       1087
138.68.248.85        1087
159.89.185.30        1086
86.134.118.70        277

The top 5 most requested paths:
PATH                           TIMES REQUESTED
/v1-health                     4560
/                              270
/v1-me                         232
/v1-list-workspaces            127
/v1-list-timezone-teams        75

The top 5 most received response status codes:
STATUS CODE     TIMES RECEIVED
200             5740
404             937
304             621
400             260
403             23

The top 5 most received user agents:
USER AGENT                                                                                                               TIMES RECEIVED
DigitalOcean Uptime Probe 0.22.0 (https://digitalocean.com)                                                              4347
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36          513
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36    332
Custom-AsyncHttpClient                                                                                                   294
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36    282
```

## Autor
Developed by Brian Gelhorn. Project made for Roadmap.sh https://roadmap.sh/projects/nginx-log-analyser

## License
This project is intended for educational and practice purposes.


