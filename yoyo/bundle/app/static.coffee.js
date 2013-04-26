
if (Meteor.isServer) {
  Meteor.AppCache.config({
    firefox: true,
    chrome: true,
    ie: true
  });
}
