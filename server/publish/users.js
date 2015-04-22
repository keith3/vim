Meteor.publish('users', function(operations, searchString) {
  if (searchString == null)
    searchString = '';

  Counts.publish(this, 'numberOfUsers', 
    Meteor.users.find({
      $or: [
        {'username': {'$regex': '.*' + searchString + '.*'}},
        {'emails[0].address': {'$regex': '.*' + searchString + '.*'}},
      ]
    }), 
    {noReady: true}
  );

  return Meteor.users.find({
    $or: [
      {'username': {'$regex': '.*' + searchString + '.*'}},
      {'emails[0].address': {'$regex': '.*' + searchString + '.*'}},
    ]
  }, {sort: {createdAt: -1}});
});
