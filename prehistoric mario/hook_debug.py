import frida, sys

def on_message(msg, data):
    if msg['type'] == 'send':
        print(msg['payload'])
    else:
        print(msg)

jscode = """
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
"""

process = frida.get_usb_device().attach('com.alles.platformer')
script = process.create_script(jscode)
script.on('message', on_message)
script.load()
sys.stdin.read()