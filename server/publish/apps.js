Meteor.publish('apps', function(operations, searchString) {
  if (searchString == null)
    searchString = '';

  Counts.publish(this, 'numberOfApps', 
    Apps.find({
      $or: [
        {'name': {'$regex': '.*' + searchString + '.*'}},
        {'url': {'$regex': '.*' + searchString + '.*'}},
        {'appId': {'$regex': '.*' + searchString + '.*'}},
        // {'serverIpList': {'$regex': '.*' + searchString + '.*'}},
      ]
    }), 
    {noReady: true}
  );

  return Apps.find({
    $or: [
      {'name': {'$regex': '.*' + searchString + '.*'}},
      {'url': {'$regex': '.*' + searchString + '.*'}},
      {'appId': {'$regex': '.*' + searchString + '.*'}},
      // {'serverIpList': {'$regex': '.*' + searchString + '.*'}},
    ]
  }, {sort: {createdAt: -1}});
});
