import json
from faker import Faker
from datetime import datetime, timedelta
import os
import argparse

fake = Faker()

def seed_holter_events(study_id, profile_id, event_type, start_time_str, count=5):
    strip_ids = []
    data = []
    try:
        start_time = datetime.strptime(start_time_str, "%y-%m-%dT%H:%M:%S")
    except ValueError:
        print("Invalid starttime format. Use --starttime YY-MM-DDTHH:MM:SS (e.g. 24-05-24T19:56:02)")
        return

    for _ in range(count):
        stop_time = start_time + timedelta(seconds=10)

        event = {
            "study": study_id,
            "profile": profile_id,
            "title": None,
            "type": event_type,
            "originalType": event_type,
            "strips": strip_ids,
            "start": start_time.isoformat(timespec='milliseconds') + "+00:00",
            "stop": stop_time.isoformat(timespec='milliseconds') + "+00:00",
            "minHr": 60,
            "maxHr": 60,
            "avgHr": 60,
            "duration": 10,
            "channel": 2,
            "isIncludedToReport": False,
            "isAuto": True,
            "isReviewed": False,
            "technicianComments": None,
            "comment": None,
            "countBeats": None
        }

        data.append(event)
        start_time = stop_time + timedelta(seconds=10)
    output_file = "seeding-events.json"
    base_path = os.path.dirname(os.path.abspath(__file__))
    output_path = os.path.join(base_path, "tmp", output_file)
    output_path = os.path.normpath(output_path).replace("\\", "/")

    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2)

    print(f" Saved {count} HolterEvent(s) to {output_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Seed Holter Events")
    parser.add_argument("--studyid", type=str, required=True, help="Study ID")
    parser.add_argument("--profileid", type=str, required=True, help="Profile ID")
    parser.add_argument("--event_type", type=str, required=True, help="Event type (used for both type and originalType)")
    parser.add_argument("--starttime", type=str, required=True, help="Start time in short format: YY-MM-DDTHH:MM:SS")
    parser.add_argument("--count", type=int, default=5, help="Number of events to generate (default: 5)")

    args = parser.parse_args()

    seed_holter_events(
        args.studyid,
        args.profileid,
        args.event_type,
        args.starttime,
        args.count
    )

"""
# 🔧 Generate Fake Holter Events Data

To generate fake Holter event data for testing purpose (e.g., simulate backend data response), you can use the script `fakedataAIRP.py`.

## 💡 Usage:
```bash
python fakedataAIRP.py --studyid <study_id> --profileid <profile_id> --event_type <type> --starttime <start> --count <number>
```

## Parameters:
| Argument        | Description                                                                 |
|----------------|-----------------------------------------------------------------------------|
| `--studyid`     | MongoDB ObjectId for `study` (string)                                       |
| `--profileid`   | MongoDB ObjectId for `profile` (string)                                     |
| `--event_type`  | Event type (used for both `type` and `originalType`)                        |
| `--starttime`   | Start time in format `YY-MM-DDTHH:MM:SS` (e.g. `24-05-24T19:56:02`)         |
| `--count`       | Number of Holter events to generate (optional, default: `5`)                |

## 🧪 Example:
```bash
python fakedataAIRP.py \
  --studyid 66583752f513aff36f42a865 \
  --profileid 6746c48b21490cfaa0a0d8ab \
  --event_type VT \
  --starttime 24-05-24T19:56:02 \
  --count 5
```

## 📦 Output:
- Generated file: `tmp/seeding-events.json`
- Each event has:
  - 10s duration
  - 10s gap between each event
  - ISO 8601 formatted `start` and `stop` timestamps (with milliseconds and UTC offset)

> This script is useful for generating sample data for backend simulations, dashboard testing, or mocking API responses.
"""