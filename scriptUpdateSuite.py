#!/usr/bin/env python3
import os
from utils import Inspector
from utils.dashboard.DashboardHandler import DashboardHandler

if __name__ == '__main__':
   db = DashboardHandler('postgresql://qc01:BosqU6gcMQkckZRVbah6Ln6PVwF9LJBAHxLj8EsU9TuwxcmbdT@qc-demo.cp32vwz1k8nq.ap-southeast-1.rds.amazonaws.com:5432/robot_result')
   # update and insert new test case
   db.update_suites_cases()
   # delete test case on database which test case deleted on local
   db.delete_suites_cases()