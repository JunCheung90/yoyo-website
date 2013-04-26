
(function() {
  var RESPONDER_ROUTE, imagesDir, respond, runAjaxResponder;
  RESPONDER_ROUTE = "/ajax";
  imagesDir = "../images";
  respond = function(req, res) {
    var chunks;
    chunks = [];
    req.setEncoding("utf8");
    req.on("data", function(chunk) {
      return chunks.push(chunk);
    });
    return req.on("end", function() {
      /*
      body = chunks.join ''
      if body.charAt 0 is '{'
        body = JSON.parse body
      */

      var body, response_data, response_string;
      body = imagesDir + req.url;
      response_data = {
        imageSrc: body
      };
      response_string = "";
      if (req.method !== "HEAD") {
        response_string = JSON.stringify(response_data);
      }
      res.statusCode = 200;
      res.setHeader("Content-Type", "application/json; charset=utf-8");
      return res.end(response_string);
    });
  };
  runAjaxResponder = function() {
    var app;
    app = __meteor_bootstrap__.app;
    return app.stack.unshift({
      route: RESPONDER_ROUTE,
      handle: respond
    });
  };
  runAjaxResponder();
  return false;
})();
