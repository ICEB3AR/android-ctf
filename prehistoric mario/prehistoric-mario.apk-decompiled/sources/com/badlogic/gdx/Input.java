package com.badlogic.gdx;

import com.badlogic.gdx.utils.ObjectIntMap;

public interface Input {

    public static class Buttons {
        public static final int BACK = 3;
        public static final int FORWARD = 4;
        public static final int LEFT = 0;
        public static final int MIDDLE = 2;
        public static final int RIGHT = 1;
    }

    public enum Orientation {
        Landscape,
        Portrait
    }

    public enum Peripheral {
        HardwareKeyboard,
        OnscreenKeyboard,
        MultitouchScreen,
        Accelerometer,
        Compass,
        Vibrator,
        Gyroscope,
        RotationVector,
        Pressure
    }

    public interface TextInputListener {
        void canceled();

        void input(String str);
    }

    void cancelVibrate();

    float getAccelerometerX();

    float getAccelerometerY();

    float getAccelerometerZ();

    float getAzimuth();

    long getCurrentEventTime();

    int getDeltaX();

    int getDeltaX(int i);

    int getDeltaY();

    int getDeltaY(int i);

    float getGyroscopeX();

    float getGyroscopeY();

    float getGyroscopeZ();

    InputProcessor getInputProcessor();

    int getMaxPointers();

    Orientation getNativeOrientation();

    float getPitch();

    float getPressure();

    float getPressure(int i);

    float getRoll();

    int getRotation();

    void getRotationMatrix(float[] fArr);

    void getTextInput(TextInputListener textInputListener, String str, String str2, String str3);

    int getX();

    int getX(int i);

    int getY();

    int getY(int i);

    boolean isButtonJustPressed(int i);

    boolean isButtonPressed(int i);

    @Deprecated
    boolean isCatchBackKey();

    boolean isCatchKey(int i);

    @Deprecated
    boolean isCatchMenuKey();

    boolean isCursorCatched();

    boolean isKeyJustPressed(int i);

    boolean isKeyPressed(int i);

    boolean isPeripheralAvailable(Peripheral peripheral);

    boolean isTouched();

    boolean isTouched(int i);

    boolean justTouched();

    @Deprecated
    void setCatchBackKey(boolean z);

    void setCatchKey(int i, boolean z);

    @Deprecated
    void setCatchMenuKey(boolean z);

    void setCursorCatched(boolean z);

    void setCursorPosition(int i, int i2);

    void setInputProcessor(InputProcessor inputProcessor);

    void setOnscreenKeyboardVisible(boolean z);

    void vibrate(int i);

    void vibrate(long[] jArr, int i);

    public static class Keys {
        public static final int A = 29;
        public static final int ALT_LEFT = 57;
        public static final int ALT_RIGHT = 58;
        public static final int ANY_KEY = -1;
        public static final int APOSTROPHE = 75;
        public static final int AT = 77;
        public static final int B = 30;
        public static final int BACK = 4;
        public static final int BACKSLASH = 73;
        public static final int BACKSPACE = 67;
        public static final int BUTTON_A = 96;
        public static final int BUTTON_B = 97;
        public static final int BUTTON_C = 98;
        public static final int BUTTON_CIRCLE = 255;
        public static final int BUTTON_L1 = 102;
        public static final int BUTTON_L2 = 104;
        public static final int BUTTON_MODE = 110;
        public static final int BUTTON_R1 = 103;
        public static final int BUTTON_R2 = 105;
        public static final int BUTTON_SELECT = 109;
        public static final int BUTTON_START = 108;
        public static final int BUTTON_THUMBL = 106;
        public static final int BUTTON_THUMBR = 107;
        public static final int BUTTON_X = 99;
        public static final int BUTTON_Y = 100;
        public static final int BUTTON_Z = 101;
        public static final int C = 31;
        public static final int CALL = 5;
        public static final int CAMERA = 27;
        public static final int CENTER = 23;
        public static final int CLEAR = 28;
        public static final int COLON = 243;
        public static final int COMMA = 55;
        public static final int CONTROL_LEFT = 129;
        public static final int CONTROL_RIGHT = 130;
        public static final int D = 32;
        public static final int DEL = 67;
        public static final int DOWN = 20;
        public static final int DPAD_CENTER = 23;
        public static final int DPAD_DOWN = 20;
        public static final int DPAD_LEFT = 21;
        public static final int DPAD_RIGHT = 22;
        public static final int DPAD_UP = 19;
        public static final int E = 33;
        public static final int END = 132;
        public static final int ENDCALL = 6;
        public static final int ENTER = 66;
        public static final int ENVELOPE = 65;
        public static final int EQUALS = 70;
        public static final int ESCAPE = 131;
        public static final int EXPLORER = 64;
        public static final int F = 34;
        public static final int F1 = 244;
        public static final int F10 = 253;
        public static final int F11 = 254;
        public static final int F12 = 255;
        public static final int F2 = 245;
        public static final int F3 = 246;
        public static final int F4 = 247;
        public static final int F5 = 248;
        public static final int F6 = 249;
        public static final int F7 = 250;
        public static final int F8 = 251;
        public static final int F9 = 252;
        public static final int FOCUS = 80;
        public static final int FORWARD_DEL = 112;
        public static final int G = 35;
        public static final int GRAVE = 68;
        public static final int H = 36;
        public static final int HEADSETHOOK = 79;
        public static final int HOME = 3;
        public static final int I = 37;
        public static final int INSERT = 133;
        public static final int J = 38;
        public static final int K = 39;
        public static final int L = 40;
        public static final int LEFT = 21;
        public static final int LEFT_BRACKET = 71;
        public static final int M = 41;
        public static final int MEDIA_FAST_FORWARD = 90;
        public static final int MEDIA_NEXT = 87;
        public static final int MEDIA_PLAY_PAUSE = 85;
        public static final int MEDIA_PREVIOUS = 88;
        public static final int MEDIA_REWIND = 89;
        public static final int MEDIA_STOP = 86;
        public static final int MENU = 82;
        public static final int META_ALT_LEFT_ON = 16;
        public static final int META_ALT_ON = 2;
        public static final int META_ALT_RIGHT_ON = 32;
        public static final int META_SHIFT_LEFT_ON = 64;
        public static final int META_SHIFT_ON = 1;
        public static final int META_SHIFT_RIGHT_ON = 128;
        public static final int META_SYM_ON = 4;
        public static final int MINUS = 69;
        public static final int MUTE = 91;
        public static final int N = 42;
        public static final int NOTIFICATION = 83;
        public static final int NUM = 78;
        public static final int NUMPAD_0 = 144;
        public static final int NUMPAD_1 = 145;
        public static final int NUMPAD_2 = 146;
        public static final int NUMPAD_3 = 147;
        public static final int NUMPAD_4 = 148;
        public static final int NUMPAD_5 = 149;
        public static final int NUMPAD_6 = 150;
        public static final int NUMPAD_7 = 151;
        public static final int NUMPAD_8 = 152;
        public static final int NUMPAD_9 = 153;
        public static final int NUM_0 = 7;
        public static final int NUM_1 = 8;
        public static final int NUM_2 = 9;
        public static final int NUM_3 = 10;
        public static final int NUM_4 = 11;
        public static final int NUM_5 = 12;
        public static final int NUM_6 = 13;
        public static final int NUM_7 = 14;
        public static final int NUM_8 = 15;
        public static final int NUM_9 = 16;
        public static final int O = 43;
        public static final int P = 44;
        public static final int PAGE_DOWN = 93;
        public static final int PAGE_UP = 92;
        public static final int PERIOD = 56;
        public static final int PICTSYMBOLS = 94;
        public static final int PLUS = 81;
        public static final int POUND = 18;
        public static final int POWER = 26;
        public static final int Q = 45;
        public static final int R = 46;
        public static final int RIGHT = 22;
        public static final int RIGHT_BRACKET = 72;
        public static final int S = 47;
        public static final int SEARCH = 84;
        public static final int SEMICOLON = 74;
        public static final int SHIFT_LEFT = 59;
        public static final int SHIFT_RIGHT = 60;
        public static final int SLASH = 76;
        public static final int SOFT_LEFT = 1;
        public static final int SOFT_RIGHT = 2;
        public static final int SPACE = 62;
        public static final int STAR = 17;
        public static final int SWITCH_CHARSET = 95;
        public static final int SYM = 63;
        public static final int T = 48;
        public static final int TAB = 61;
        public static final int U = 49;
        public static final int UNKNOWN = 0;
        public static final int UP = 19;
        public static final int V = 50;
        public static final int VOLUME_DOWN = 25;
        public static final int VOLUME_UP = 24;
        public static final int W = 51;
        public static final int X = 52;
        public static final int Y = 53;
        public static final int Z = 54;
        private static ObjectIntMap<String> keyNames;

        public static String toString(int i) {
            if (i < 0) {
                throw new IllegalArgumentException("keycode cannot be negative, keycode: " + i);
            } else if (i > 255) {
                throw new IllegalArgumentException("keycode cannot be greater than 255, keycode: " + i);
            } else if (i == 112) {
                return "Forward Delete";
            } else {
                switch (i) {
                    case 0:
                        return "Unknown";
                    case 1:
                        return "Soft Left";
                    case 2:
                        return "Soft Right";
                    case 3:
                        return "Home";
                    case 4:
                        return "Back";
                    case 5:
                        return "Call";
                    case 6:
                        return "End Call";
                    case 7:
                        return "0";
                    case 8:
                        return "1";
                    case 9:
                        return "2";
                    case 10:
                        return "3";
                    case 11:
                        return "4";
                    case 12:
                        return "5";
                    case 13:
                        return "6";
                    case 14:
                        return "7";
                    case 15:
                        return "8";
                    case 16:
                        return "9";
                    case 17:
                        return "*";
                    case 18:
                        return "#";
                    case 19:
                        return "Up";
                    case 20:
                        return "Down";
                    case 21:
                        return "Left";
                    case 22:
                        return "Right";
                    case 23:
                        return "Center";
                    case 24:
                        return "Volume Up";
                    case VOLUME_DOWN /*{ENCODED_INT: 25}*/:
                        return "Volume Down";
                    case POWER /*{ENCODED_INT: 26}*/:
                        return "Power";
                    case CAMERA /*{ENCODED_INT: 27}*/:
                        return "Camera";
                    case CLEAR /*{ENCODED_INT: 28}*/:
                        return "Clear";
                    case A /*{ENCODED_INT: 29}*/:
                        return "A";
                    case B /*{ENCODED_INT: 30}*/:
                        return "B";
                    case C /*{ENCODED_INT: 31}*/:
                        return "C";
                    case 32:
                        return "D";
                    case E /*{ENCODED_INT: 33}*/:
                        return "E";
                    case F /*{ENCODED_INT: 34}*/:
                        return "F";
                    case G /*{ENCODED_INT: 35}*/:
                        return "G";
                    case H /*{ENCODED_INT: 36}*/:
                        return "H";
                    case I /*{ENCODED_INT: 37}*/:
                        return "I";
                    case J /*{ENCODED_INT: 38}*/:
                        return "J";
                    case K /*{ENCODED_INT: 39}*/:
                        return "K";
                    case L /*{ENCODED_INT: 40}*/:
                        return "L";
                    case M /*{ENCODED_INT: 41}*/:
                        return "M";
                    case N /*{ENCODED_INT: 42}*/:
                        return "N";
                    case O /*{ENCODED_INT: 43}*/:
                        return "O";
                    case P /*{ENCODED_INT: 44}*/:
                        return "P";
                    case Q /*{ENCODED_INT: 45}*/:
                        return "Q";
                    case R /*{ENCODED_INT: 46}*/:
                        return "R";
                    case S /*{ENCODED_INT: 47}*/:
                        return "S";
                    case T /*{ENCODED_INT: 48}*/:
                        return "T";
                    case U /*{ENCODED_INT: 49}*/:
                        return "U";
                    case V /*{ENCODED_INT: 50}*/:
                        return "V";
                    case W /*{ENCODED_INT: 51}*/:
                        return "W";
                    case X /*{ENCODED_INT: 52}*/:
                        return "X";
                    case Y /*{ENCODED_INT: 53}*/:
                        return "Y";
                    case Z /*{ENCODED_INT: 54}*/:
                        return "Z";
                    case COMMA /*{ENCODED_INT: 55}*/:
                        return ",";
                    case PERIOD /*{ENCODED_INT: 56}*/:
                        return ".";
                    case ALT_LEFT /*{ENCODED_INT: 57}*/:
                        return "L-Alt";
                    case ALT_RIGHT /*{ENCODED_INT: 58}*/:
                        return "R-Alt";
                    case SHIFT_LEFT /*{ENCODED_INT: 59}*/:
                        return "L-Shift";
                    case SHIFT_RIGHT /*{ENCODED_INT: 60}*/:
                        return "R-Shift";
                    case TAB /*{ENCODED_INT: 61}*/:
                        return "Tab";
                    case SPACE /*{ENCODED_INT: 62}*/:
                        return "Space";
                    case SYM /*{ENCODED_INT: 63}*/:
                        return "SYM";
                    case 64:
                        return "Explorer";
                    case ENVELOPE /*{ENCODED_INT: 65}*/:
                        return "Envelope";
                    case ENTER /*{ENCODED_INT: 66}*/:
                        return "Enter";
                    case 67:
                        return "Delete";
                    case GRAVE /*{ENCODED_INT: 68}*/:
                        return "`";
                    case MINUS /*{ENCODED_INT: 69}*/:
                        return "-";
                    case EQUALS /*{ENCODED_INT: 70}*/:
                        return "=";
                    case LEFT_BRACKET /*{ENCODED_INT: 71}*/:
                        return "[";
                    case RIGHT_BRACKET /*{ENCODED_INT: 72}*/:
                        return "]";
                    case BACKSLASH /*{ENCODED_INT: 73}*/:
                        return "\\";
                    case SEMICOLON /*{ENCODED_INT: 74}*/:
                        return ";";
                    case APOSTROPHE /*{ENCODED_INT: 75}*/:
                        return "'";
                    case SLASH /*{ENCODED_INT: 76}*/:
                        return "/";
                    case AT /*{ENCODED_INT: 77}*/:
                        return "@";
                    case NUM /*{ENCODED_INT: 78}*/:
                        return "Num";
                    case HEADSETHOOK /*{ENCODED_INT: 79}*/:
                        return "Headset Hook";
                    case FOCUS /*{ENCODED_INT: 80}*/:
                        return "Focus";
                    case PLUS /*{ENCODED_INT: 81}*/:
                        return "Plus";
                    case MENU /*{ENCODED_INT: 82}*/:
                        return "Menu";
                    case NOTIFICATION /*{ENCODED_INT: 83}*/:
                        return "Notification";
                    case SEARCH /*{ENCODED_INT: 84}*/:
                        return "Search";
                    case MEDIA_PLAY_PAUSE /*{ENCODED_INT: 85}*/:
                        return "Play/Pause";
                    case MEDIA_STOP /*{ENCODED_INT: 86}*/:
                        return "Stop Media";
                    case MEDIA_NEXT /*{ENCODED_INT: 87}*/:
                        return "Next Media";
                    case MEDIA_PREVIOUS /*{ENCODED_INT: 88}*/:
                        return "Prev Media";
                    case MEDIA_REWIND /*{ENCODED_INT: 89}*/:
                        return "Rewind";
                    case MEDIA_FAST_FORWARD /*{ENCODED_INT: 90}*/:
                        return "Fast Forward";
                    case MUTE /*{ENCODED_INT: 91}*/:
                        return "Mute";
                    case PAGE_UP /*{ENCODED_INT: 92}*/:
                        return "Page Up";
                    case PAGE_DOWN /*{ENCODED_INT: 93}*/:
                        return "Page Down";
                    case PICTSYMBOLS /*{ENCODED_INT: 94}*/:
                        return "PICTSYMBOLS";
                    case SWITCH_CHARSET /*{ENCODED_INT: 95}*/:
                        return "SWITCH_CHARSET";
                    case BUTTON_A /*{ENCODED_INT: 96}*/:
                        return "A Button";
                    case BUTTON_B /*{ENCODED_INT: 97}*/:
                        return "B Button";
                    case BUTTON_C /*{ENCODED_INT: 98}*/:
                        return "C Button";
                    case BUTTON_X /*{ENCODED_INT: 99}*/:
                        return "X Button";
                    case 100:
                        return "Y Button";
                    case 101:
                        return "Z Button";
                    case 102:
                        return "L1 Button";
                    case BUTTON_R1 /*{ENCODED_INT: 103}*/:
                        return "R1 Button";
                    case BUTTON_L2 /*{ENCODED_INT: 104}*/:
                        return "L2 Button";
                    case BUTTON_R2 /*{ENCODED_INT: 105}*/:
                        return "R2 Button";
                    case BUTTON_THUMBL /*{ENCODED_INT: 106}*/:
                        return "Left Thumb";
                    case BUTTON_THUMBR /*{ENCODED_INT: 107}*/:
                        return "Right Thumb";
                    case BUTTON_START /*{ENCODED_INT: 108}*/:
                        return "Start";
                    case BUTTON_SELECT /*{ENCODED_INT: 109}*/:
                        return "Select";
                    case BUTTON_MODE /*{ENCODED_INT: 110}*/:
                        return "Button Mode";
                    default:
                        switch (i) {
                            case CONTROL_LEFT /*{ENCODED_INT: 129}*/:
                                return "L-Ctrl";
                            case CONTROL_RIGHT /*{ENCODED_INT: 130}*/:
                                return "R-Ctrl";
                            case ESCAPE /*{ENCODED_INT: 131}*/:
                                return "Escape";
                            case END /*{ENCODED_INT: 132}*/:
                                return "End";
                            case INSERT /*{ENCODED_INT: 133}*/:
                                return "Insert";
                            default:
                                switch (i) {
                                    case NUMPAD_0 /*{ENCODED_INT: 144}*/:
                                        return "Numpad 0";
                                    case NUMPAD_1 /*{ENCODED_INT: 145}*/:
                                        return "Numpad 1";
                                    case NUMPAD_2 /*{ENCODED_INT: 146}*/:
                                        return "Numpad 2";
                                    case NUMPAD_3 /*{ENCODED_INT: 147}*/:
                                        return "Numpad 3";
                                    case NUMPAD_4 /*{ENCODED_INT: 148}*/:
                                        return "Numpad 4";
                                    case NUMPAD_5 /*{ENCODED_INT: 149}*/:
                                        return "Numpad 5";
                                    case NUMPAD_6 /*{ENCODED_INT: 150}*/:
                                        return "Numpad 6";
                                    case NUMPAD_7 /*{ENCODED_INT: 151}*/:
                                        return "Numpad 7";
                                    case NUMPAD_8 /*{ENCODED_INT: 152}*/:
                                        return "Numpad 8";
                                    case NUMPAD_9 /*{ENCODED_INT: 153}*/:
                                        return "Numpad 9";
                                    default:
                                        switch (i) {
                                            case COLON /*{ENCODED_INT: 243}*/:
                                                return ":";
                                            case F1 /*{ENCODED_INT: 244}*/:
                                                return "F1";
                                            case F2 /*{ENCODED_INT: 245}*/:
                                                return "F2";
                                            case F3 /*{ENCODED_INT: 246}*/:
                                                return "F3";
                                            case F4 /*{ENCODED_INT: 247}*/:
                                                return "F4";
                                            case F5 /*{ENCODED_INT: 248}*/:
                                                return "F5";
                                            case F6 /*{ENCODED_INT: 249}*/:
                                                return "F6";
                                            case F7 /*{ENCODED_INT: 250}*/:
                                                return "F7";
                                            case F8 /*{ENCODED_INT: 251}*/:
                                                return "F8";
                                            case F9 /*{ENCODED_INT: 252}*/:
                                                return "F9";
                                            case F10 /*{ENCODED_INT: 253}*/:
                                                return "F10";
                                            case F11 /*{ENCODED_INT: 254}*/:
                                                return "F11";
                                            case 255:
                                                return "F12";
                                            default:
                                                return null;
                                        }
                                }
                        }
                }
            }
        }

        public static int valueOf(String str) {
            if (keyNames == null) {
                initializeKeyNames();
            }
            return keyNames.get(str, -1);
        }

        private static void initializeKeyNames() {
            keyNames = new ObjectIntMap<>();
            for (int i = 0; i < 256; i++) {
                String keys = toString(i);
                if (keys != null) {
                    keyNames.put(keys, i);
                }
            }
        }
    }
}
