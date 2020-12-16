setImmediate(function(){
  Java.perform(function(){
      Java.choose('com.alles.platformer.MyPlatformer', {
      onMatch: function(instance) {
          var myPlatformer = instance;
          send(myPlatformer.debug.value);
          myPlatformer.debug.value = true;
          send(myPlatformer.debug.value);
      },
      onComplete: function() {}
      });  
  });
});