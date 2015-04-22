Meteor.methods({

  uploadFile: function(fileData) {
    if (! this.userId)
      throw new Meteor.Error("Must be logged in");

	var fs = Meteor.npmRequire('fs');
  function decodeBase64Image(dataString) {
	  var matches = dataString.match(/^data:([A-Za-z-+\/]+);base64,(.+)$/),
	    response = {};

	  if (matches.length !== 3) {
	    return new Error('Invalid input string');
	  }

	  response.type = matches[1];
	  response.data = new Buffer(matches[2], 'base64');

	  return response;
	}

    try { 
      fs.writeFile('/home/keith/github/meteor/hello.jpg', decodeBase64Image(fileData).data);
    } catch(err) {
      throw new Meteor.Error(err.toString());
    }
    
    return ;
  }, 
})
