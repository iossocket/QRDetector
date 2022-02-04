import * as React from 'react';
import { useEffect } from 'react';
import { StyleSheet, View, NativeModules } from 'react-native';
import { QrDetectorView } from 'react-native-qr-detector';

// https://blog.logrocket.com/build-native-ui-components-react-native/
// https://medium.com/@rizwanm/swift-camera-part-3-ebe5b7d32835

export default function App() {
  useEffect(() => {
    const init = async () => {
      const CameraModule = NativeModules.QrDetectorView;
      const result = await CameraModule.requestCameraPermission();
      console.log(result);
    };
    init();
  }, []);

  return (
    <View style={styles.container}>
      <QrDetectorView style={styles.box} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  box: {
    flex: 1,
  },
});
