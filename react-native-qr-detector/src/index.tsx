import {
  requireNativeComponent,
  UIManager,
  Platform,
  ViewStyle,
} from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-qr-detector' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

type QrDetectorProps = {
  style: ViewStyle;
};

const ComponentName = 'QrDetectorView';

export const QrDetectorView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<QrDetectorProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
// export const QrDetectorViewManager =
