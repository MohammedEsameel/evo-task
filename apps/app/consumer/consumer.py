from datetime import datetime , timezone
from kafka import KafkaConsumer, TopicPartition , KafkaProducer
import json
import time

if __name__ == "__main__":
    consumer = KafkaConsumer(
        'input',
     	bootstrap_servers=['192.168.1.200:9092'],
     	auto_offset_reset='earliest',
     	enable_auto_commit=True)
print("starting consumer")

def json_serializer(data):
    return json.dumps(data).encode("utf-8")

producer = KafkaProducer(bootstrap_servers=['192.168.1.200:9092'],
	                     value_serializer=json_serializer)

def get_input(name, create_at, formated_time):
    return {
        "name": name,
        "created_at": create_at,
        "time": formated_time
    }
for msg in consumer:
    json_raw= json.loads(json.loads(msg.value))
    date_ms= json_raw["time"]
    name = json_raw["name"]
    created_at = json_raw["created_at"]
    dt = datetime.fromtimestamp(date_ms/1000.0)
    out_json = "{}".format(json.dumps(get_input(name, created_at, str(dt))))
    producer.send("output", out_json)
    print(json_raw)
    time.sleep(1)




