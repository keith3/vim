Meteor.methods({
  usersCreateUser: function(newUser) {
    if (! this.userId)
      throw new Meteor.Error("Must be logged in");

    try { 
      // server side data validate 
      check(newUser, Object);
      // ....
      check(newUser.isSuperuser, Number);

      Accounts.createUser({
        username: newUser.username,
        email: newUser.email,
        password: newUser.password,
        profile: {
          isStuff: newUser.isStuff,
          isActive: newUser.isActive,
          isSuperuser: newUser.isSuperuser,
          // userPermissions: newUser.userPermissions,
          lastLoginAt: ''
        }
      });
    } catch(err) {
      throw new Meteor.Error(err.toString());
    }
    
    return ;
  }, 

  usersRemoveUser: function(userId) {
    check(userId, String);

    if (! this.userId || this.userId == userId) {
      throw new Meteor.Error("没有权限!");
    }

    try {
      Meteor.users.remove(userId);
    } catch(err) {
      throw new Meteor.Error(err.toString());
    }
    
    return ;
  },

  // usersSaveLoginTime: function() {
  //   try {
  //     Meteor.users.update({_id: this.userId}, 
  //         {$set: {'profile.lastLoginAt': new Date()}}
  //       );
  //   } catch(err) {
  //     // do nothing
  //     throw new Meteor.Error('Update user error, ' + err);
  //   }

  //   return ;
  // },

  usersChangePassword: function(userId, password) {
    if (! this.userId) {
      throw new Meteor.Error("没有权限!");
    }

    try {
      Accounts.setPassword(userId, password);
      // 删除newpassword字段
      Meteor.users.update({_id: userId}, {$unset: {newPassword: ''}})
    } catch(err) {
      throw new Meteor.Error(err.toString());
    }
  }

})












