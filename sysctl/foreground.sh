#!/bin/bash
while ! id student &>/dev/null; do sleep 1; done
su - student
