import 'package:local_auth/local_auth.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate ()async {
    try {
      if(!await _canAuthenticate()) return false;

      return await _auth.authenticate(
          localizedReason:'Use face id to authenticate',
        options: AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true
        ),
      );
    } catch (e){
      return false;
    }
  }

}
