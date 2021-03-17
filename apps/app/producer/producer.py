from kafka import KafkaProducer
from faker import Faker
import json
import time




def json_serializer(data):
    return json.dumps(data).encode("utf-8")


fake = Faker()

def get_input():
	return {
	"name": fake.name(),
    "created_at": fake.year(),
     "time": time.time() * 1000
     }

producer = KafkaProducer(bootstrap_servers=['192.168.1.200:9092'],
	                     value_serializer=json_serializer)

if __name__ == "__main__":
    while 1 == 1:
        input = get_input()
        result = "{}".format(json.dumps(input))
        print(result)
        producer.send("input", result)
        time.sleep(1)
