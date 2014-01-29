[PhaserIO][5] + [Dart][3]
===========================

This is an example of [a phaser sample][1] written in [Dart][3] with the [DartEditor][2].

Getting started
---------------
We're using the [js-interop][4] package to talk to javascript.

1.  [Update to the latest (stable) editor][2].

2.  From the "File" menu, open a "New Application".

3.  Add the following to your pubspec.yaml:

        dependencies:
          js: any

4.  Under the "Tools" menu, run "Pub Get".
5.  Try the following test Dart file:

        import 'package:js/js.dart' as js;
        
        void main() {
          js.context.alert('Hello from Dart via JS');
        }
        
6.  Add the script to your HTML page:

        <script src="packages/browser/dart.js"></script>
        <script src="packages/browser/interop.js"></script> 

DART <=> JS
-----------

* Accessing the global js context is possible via `js.context.*`
* Proxy a dart function with `new js.FunctionProxy(function)` or `new js.Function.withThis(function)` where the latter must have the first variable to accept the function's context
* Creating a JS-Object in dart can be done via `new js.Proxy(js.context.ObjectName [,arguments])`
*  Whenever an Array or Object is created that has to be passed to JS they need to be wrapped via `js.array([...])` or `js.map({...})`


  [1]: http://gametest.mobi/phaser/examples/_site/view_full.html?d=filters&f=checker+wave.js&t=checker%20wave
  [2]: https://www.dartlang.org/tools/editor
  [3]: https://www.dartlang.org
  [4]: https://github.com/dart-lang/js-interop
  [5]: http://phaser.io/
