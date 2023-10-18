#!/usr/bin/env python3
""" Defines schools_by_topic """


def schools_by_topic(mongo_collection, topic):
    """ A function that returns the list of school having a specific topic """
    return list(mongo_collection.find({"topics": topic}))
