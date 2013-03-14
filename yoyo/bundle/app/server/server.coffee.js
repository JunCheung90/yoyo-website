
Meteor.startup(function() {
  if (!Meteor.users.findOne({
    username: 'yoyo-admin'
  })) {
    Accounts.createUser({
      username: 'yoyo-admin',
      email: 'yoyo@gmail.com',
      password: 'iamyoyoadmin'
    });
  }
  return true;
});
