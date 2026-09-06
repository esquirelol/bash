#!/bin/bash
set -euo pipefail


limit="$1"

usage=$(df -h  | awk 'NR==3 {print $5}' | cut -d "%" -f1)

if [[ "$usage" -ge "$limit" ]]; then
	echo "$(date +%F\ %H:%M:%S) WARN: Диск занят на "$usage"% (порог "$limit"%)" >> disk.log
else
	echo "Диск занят на "$usage"%. Всё в норме"
fi

