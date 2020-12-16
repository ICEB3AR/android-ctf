package com.brashmonkey.spriter;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Input;
import com.badlogic.gdx.graphics.GL20;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class XmlReader {
    private static final byte[] _xml_actions = init__xml_actions_0();
    private static final short[] _xml_index_offsets = init__xml_index_offsets_0();
    private static final byte[] _xml_indicies = init__xml_indicies_0();
    private static final byte[] _xml_key_offsets = init__xml_key_offsets_0();
    private static final byte[] _xml_range_lengths = init__xml_range_lengths_0();
    private static final byte[] _xml_single_lengths = init__xml_single_lengths_0();
    private static final byte[] _xml_trans_actions = init__xml_trans_actions_0();
    private static final char[] _xml_trans_keys = init__xml_trans_keys_0();
    private static final byte[] _xml_trans_targs = init__xml_trans_targs_0();
    static final int xml_en_elementBody = 15;
    static final int xml_en_main = 1;
    static final int xml_error = 0;
    static final int xml_first_final = 34;
    static final int xml_start = 1;
    private Element current;
    private final ArrayList<Element> elements = new ArrayList<>(8);
    private Element root;
    private final StringBuilder textBuffer = new StringBuilder(64);

    public Element parse(String str) {
        char[] charArray = str.toCharArray();
        return parse(charArray, 0, charArray.length);
    }

    public Element parse(Reader reader) throws IOException {
        char[] cArr = new char[GL20.GL_STENCIL_BUFFER_BIT];
        int i = 0;
        while (true) {
            int read = reader.read(cArr, i, cArr.length - i);
            if (read == -1) {
                return parse(cArr, 0, i);
            }
            if (read == 0) {
                char[] cArr2 = new char[(cArr.length * 2)];
                System.arraycopy(cArr, 0, cArr2, 0, cArr.length);
                cArr = cArr2;
            } else {
                i += read;
            }
        }
    }

    public Element parse(InputStream inputStream) throws IOException {
        return parse(new InputStreamReader(inputStream, "ISO-8859-1"));
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:149:0x003b */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:155:0x0070 */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:153:0x003b */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v4, types: [int] */
    /* JADX WARN: Type inference failed for: r3v44, types: [byte[]] */
    /* JADX WARN: Type inference failed for: r3v45, types: [byte, int] */
    /* JADX WARN: Type inference failed for: r3v47 */
    /* JADX WARN: Type inference failed for: r3v49, types: [int] */
    /* JADX WARN: Type inference failed for: r16v5, types: [int] */
    /* JADX WARN: Type inference failed for: r3v50 */
    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0022, code lost:
        if (r11 == 0) goto L_0x01ff;
     */
    /* JADX WARNING: Removed duplicated region for block: B:121:0x01fd  */
    /* JADX WARNING: Removed duplicated region for block: B:123:0x0202  */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x00a3  */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x00d8  */
    /* JADX WARNING: Removed duplicated region for block: B:72:0x0116  */
    /* JADX WARNING: Removed duplicated region for block: B:75:0x012e  */
    /* JADX WARNING: Unknown variable types count: 2 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.brashmonkey.spriter.XmlReader.Element parse(char[] r23, int r24, int r25) {
        /*
        // Method dump skipped, instructions count: 664
        */
        throw new UnsupportedOperationException("Method not decompiled: com.brashmonkey.spriter.XmlReader.parse(char[], int, int):com.brashmonkey.spriter.XmlReader$Element");
    }

    private static byte[] init__xml_actions_0() {
        return new byte[]{0, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 2, 0, 6, 2, 1, 4, 2, 2, 4};
    }

    private static byte[] init__xml_key_offsets_0() {
        return new byte[]{0, 0, 4, 9, 14, 20, 26, 30, 35, 36, 37, 42, 46, 50, 51, 52, 56, 57, 62, 67, 73, 79, 83, 88, 89, 90, 95, 99, 103, 104, 108, 109, 110, 111, 112, 115};
    }

    private static char[] init__xml_trans_keys_0() {
        return new char[]{' ', '<', '\t', '\r', ' ', '/', '>', '\t', '\r', ' ', '/', '>', '\t', '\r', ' ', '/', '=', '>', '\t', '\r', ' ', '/', '=', '>', '\t', '\r', ' ', '=', '\t', '\r', ' ', '\"', '\'', '\t', '\r', '\"', '\"', ' ', '/', '>', '\t', '\r', ' ', '>', '\t', '\r', ' ', '>', '\t', '\r', '\'', '\'', ' ', '<', '\t', '\r', '<', ' ', '/', '>', '\t', '\r', ' ', '/', '>', '\t', '\r', ' ', '/', '=', '>', '\t', '\r', ' ', '/', '=', '>', '\t', '\r', ' ', '=', '\t', '\r', ' ', '\"', '\'', '\t', '\r', '\"', '\"', ' ', '/', '>', '\t', '\r', ' ', '>', '\t', '\r', ' ', '>', '\t', '\r', '<', ' ', '/', '\t', '\r', '>', '>', '\'', '\'', ' ', '\t', '\r', 0};
    }

    private static byte[] init__xml_single_lengths_0() {
        return new byte[]{0, 2, 3, 3, 4, 4, 2, 3, 1, 1, 3, 2, 2, 1, 1, 2, 1, 3, 3, 4, 4, 2, 3, 1, 1, 3, 2, 2, 1, 2, 1, 1, 1, 1, 1, 0};
    }

    private static byte[] init__xml_range_lengths_0() {
        return new byte[]{0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0};
    }

    private static short[] init__xml_index_offsets_0() {
        return new short[]{0, 0, 4, 9, 14, 20, 26, 30, 35, 37, 39, 44, 48, 52, 54, 56, 60, 62, 67, 72, 78, 84, 88, 93, 95, 97, 102, 106, 110, 112, 116, 118, 120, 122, 124, 127};
    }

    private static byte[] init__xml_indicies_0() {
        byte[] bArr = new byte[Input.Keys.CONTROL_LEFT];
        // fill-array-data instruction
        bArr[0] = 0;
        bArr[1] = 2;
        bArr[2] = 0;
        bArr[3] = 1;
        bArr[4] = 2;
        bArr[5] = 1;
        bArr[6] = 1;
        bArr[7] = 2;
        bArr[8] = 3;
        bArr[9] = 5;
        bArr[10] = 6;
        bArr[11] = 7;
        bArr[12] = 5;
        bArr[13] = 4;
        bArr[14] = 9;
        bArr[15] = 10;
        bArr[16] = 1;
        bArr[17] = 11;
        bArr[18] = 9;
        bArr[19] = 8;
        bArr[20] = 13;
        bArr[21] = 1;
        bArr[22] = 14;
        bArr[23] = 1;
        bArr[24] = 13;
        bArr[25] = 12;
        bArr[26] = 15;
        bArr[27] = 16;
        bArr[28] = 15;
        bArr[29] = 1;
        bArr[30] = 16;
        bArr[31] = 17;
        bArr[32] = 18;
        bArr[33] = 16;
        bArr[34] = 1;
        bArr[35] = 20;
        bArr[36] = 19;
        bArr[37] = 22;
        bArr[38] = 21;
        bArr[39] = 9;
        bArr[40] = 10;
        bArr[41] = 11;
        bArr[42] = 9;
        bArr[43] = 1;
        bArr[44] = 23;
        bArr[45] = 24;
        bArr[46] = 23;
        bArr[47] = 1;
        bArr[48] = 25;
        bArr[49] = 11;
        bArr[50] = 25;
        bArr[51] = 1;
        bArr[52] = 20;
        bArr[53] = 26;
        bArr[54] = 22;
        bArr[55] = 27;
        bArr[56] = 29;
        bArr[57] = 30;
        bArr[58] = 29;
        bArr[59] = 28;
        bArr[60] = 32;
        bArr[61] = 31;
        bArr[62] = 30;
        bArr[63] = 34;
        bArr[64] = 1;
        bArr[65] = 30;
        bArr[66] = 33;
        bArr[67] = 36;
        bArr[68] = 37;
        bArr[69] = 38;
        bArr[70] = 36;
        bArr[71] = 35;
        bArr[72] = 40;
        bArr[73] = 41;
        bArr[74] = 1;
        bArr[75] = 42;
        bArr[76] = 40;
        bArr[77] = 39;
        bArr[78] = 44;
        bArr[79] = 1;
        bArr[80] = 45;
        bArr[81] = 1;
        bArr[82] = 44;
        bArr[83] = 43;
        bArr[84] = 46;
        bArr[85] = 47;
        bArr[86] = 46;
        bArr[87] = 1;
        bArr[88] = 47;
        bArr[89] = 48;
        bArr[90] = 49;
        bArr[91] = 47;
        bArr[92] = 1;
        bArr[93] = 51;
        bArr[94] = 50;
        bArr[95] = 53;
        bArr[96] = 52;
        bArr[97] = 40;
        bArr[98] = 41;
        bArr[99] = 42;
        bArr[100] = 40;
        bArr[101] = 1;
        bArr[102] = 54;
        bArr[103] = 55;
        bArr[104] = 54;
        bArr[105] = 1;
        bArr[106] = 56;
        bArr[107] = 42;
        bArr[108] = 56;
        bArr[109] = 1;
        bArr[110] = 57;
        bArr[111] = 1;
        bArr[112] = 57;
        bArr[113] = 34;
        bArr[114] = 57;
        bArr[115] = 1;
        bArr[116] = 1;
        bArr[117] = 58;
        bArr[118] = 59;
        bArr[119] = 58;
        bArr[120] = 51;
        bArr[121] = 60;
        bArr[122] = 53;
        bArr[123] = 61;
        bArr[124] = 62;
        bArr[125] = 62;
        bArr[126] = 1;
        bArr[127] = 1;
        bArr[128] = 0;
        return bArr;
    }

    private static byte[] init__xml_trans_targs_0() {
        return new byte[]{1, 0, 2, 3, 3, 4, 11, 34, 5, 4, 11, 34, 5, 6, 7, 6, 7, 8, 13, 9, 10, 9, 10, 12, 34, 12, 14, 14, 16, 15, 17, 16, 17, 18, 30, 18, 19, 26, 28, 20, 19, 26, 28, 20, 21, 22, 21, 22, 23, 32, 24, 25, 24, 25, 27, 28, 27, 29, 31, 35, 33, 33, 34};
    }

    private static byte[] init__xml_trans_actions_0() {
        return new byte[]{0, 0, 0, 1, 0, 3, 3, 20, 1, 0, 0, 9, 0, 11, 11, 0, 0, 0, 0, 1, 17, 0, 13, 5, 23, 0, 1, 0, 1, 0, 0, 0, 15, 1, 0, 0, 3, 3, 20, 1, 0, 0, 9, 0, 11, 11, 0, 0, 0, 0, 1, 17, 0, 13, 5, 23, 0, 0, 0, 7, 1, 0, 0};
    }

    /* access modifiers changed from: protected */
    public void open(String str) {
        Element element = new Element(str, this.current);
        Element element2 = this.current;
        if (element2 != null) {
            element2.addChild(element);
        }
        this.elements.add(element);
        this.current = element;
    }

    /* access modifiers changed from: protected */
    public void attribute(String str, String str2) {
        this.current.setAttribute(str, str2);
    }

    /* access modifiers changed from: protected */
    public String entity(String str) {
        if (str.equals("lt")) {
            return "<";
        }
        if (str.equals("gt")) {
            return ">";
        }
        if (str.equals("amp")) {
            return "&";
        }
        if (str.equals("apos")) {
            return "'";
        }
        if (str.equals("quot")) {
            return "\"";
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public void text(String str) {
        String text = this.current.getText();
        Element element = this.current;
        if (text != null) {
            str = text + str;
        }
        element.setText(str);
    }

    /* access modifiers changed from: protected */
    public void close() {
        Element element;
        ArrayList<Element> arrayList = this.elements;
        this.root = arrayList.get(arrayList.size() - 1);
        ArrayList<Element> arrayList2 = this.elements;
        arrayList2.remove(arrayList2.size() - 1);
        if (this.elements.size() > 0) {
            ArrayList<Element> arrayList3 = this.elements;
            element = arrayList3.get(arrayList3.size() - 1);
        } else {
            element = null;
        }
        this.current = element;
    }

    public static class Element {
        private HashMap<String, String> attributes;
        private ArrayList<Element> children;
        private final String name;
        private Element parent;
        private String text;

        public Element(String str, Element element) {
            this.name = str;
            this.parent = element;
        }

        public String getName() {
            return this.name;
        }

        public HashMap<String, String> getAttributes() {
            return this.attributes;
        }

        public String getAttribute(String str) {
            HashMap<String, String> hashMap = this.attributes;
            if (hashMap != null) {
                String str2 = hashMap.get(str);
                if (str2 != null) {
                    return str2;
                }
                throw new RuntimeException("Element " + str + " doesn't have attribute: " + str);
            }
            throw new RuntimeException("Element " + str + " doesn't have attribute: " + str);
        }

        public String getAttribute(String str, String str2) {
            String str3;
            HashMap<String, String> hashMap = this.attributes;
            return (hashMap == null || (str3 = hashMap.get(str)) == null) ? str2 : str3;
        }

        public void setAttribute(String str, String str2) {
            if (this.attributes == null) {
                this.attributes = new HashMap<>(8);
            }
            this.attributes.put(str, str2);
        }

        public int getChildCount() {
            ArrayList<Element> arrayList = this.children;
            if (arrayList == null) {
                return 0;
            }
            return arrayList.size();
        }

        public Element getChild(int i) {
            ArrayList<Element> arrayList = this.children;
            if (arrayList != null) {
                return arrayList.get(i);
            }
            throw new RuntimeException("Element has no children: " + this.name);
        }

        public void addChild(Element element) {
            if (this.children == null) {
                this.children = new ArrayList<>(8);
            }
            this.children.add(element);
        }

        public String getText() {
            return this.text;
        }

        public void setText(String str) {
            this.text = str;
        }

        public void removeChild(int i) {
            ArrayList<Element> arrayList = this.children;
            if (arrayList != null) {
                arrayList.remove(i);
            }
        }

        public void removeChild(Element element) {
            ArrayList<Element> arrayList = this.children;
            if (arrayList != null) {
                arrayList.remove(element);
            }
        }

        public void remove() {
            this.parent.removeChild(this);
        }

        public Element getParent() {
            return this.parent;
        }

        public String toString() {
            return toString(BuildConfig.FLAVOR);
        }

        public String toString(String str) {
            String str2;
            StringBuilder sb = new StringBuilder(128);
            sb.append(str);
            sb.append('<');
            sb.append(this.name);
            HashMap<String, String> hashMap = this.attributes;
            if (hashMap != null) {
                for (Map.Entry<String, String> entry : hashMap.entrySet()) {
                    sb.append(' ');
                    sb.append(entry.getKey());
                    sb.append("=\"");
                    sb.append(entry.getKey());
                    sb.append('\"');
                }
            }
            if (this.children == null && ((str2 = this.text) == null || str2.length() == 0)) {
                sb.append("/>");
            } else {
                sb.append(">\n");
                String str3 = str + '\t';
                String str4 = this.text;
                if (str4 != null && str4.length() > 0) {
                    sb.append(str3);
                    sb.append(this.text);
                    sb.append('\n');
                }
                ArrayList<Element> arrayList = this.children;
                if (arrayList != null) {
                    Iterator<Element> it = arrayList.iterator();
                    while (it.hasNext()) {
                        sb.append(it.next().toString(str3));
                        sb.append('\n');
                    }
                }
                sb.append(str);
                sb.append("</");
                sb.append(this.name);
                sb.append('>');
            }
            return sb.toString();
        }

        public Element getChildByName(String str) {
            if (this.children == null) {
                return null;
            }
            for (int i = 0; i < this.children.size(); i++) {
                Element element = this.children.get(i);
                if (element.name.equals(str)) {
                    return element;
                }
            }
            return null;
        }

        public Element getChildByNameRecursive(String str) {
            if (this.children == null) {
                return null;
            }
            for (int i = 0; i < this.children.size(); i++) {
                Element element = this.children.get(i);
                if (element.name.equals(str)) {
                    return element;
                }
                Element childByNameRecursive = element.getChildByNameRecursive(str);
                if (childByNameRecursive != null) {
                    return childByNameRecursive;
                }
            }
            return null;
        }

        public ArrayList<Element> getChildrenByName(String str) {
            ArrayList<Element> arrayList = new ArrayList<>();
            if (this.children == null) {
                return arrayList;
            }
            for (int i = 0; i < this.children.size(); i++) {
                Element element = this.children.get(i);
                if (element.name.equals(str)) {
                    arrayList.add(element);
                }
            }
            return arrayList;
        }

        public ArrayList<Element> getChildrenByNameRecursively(String str) {
            ArrayList<Element> arrayList = new ArrayList<>();
            getChildrenByNameRecursively(str, arrayList);
            return arrayList;
        }

        private void getChildrenByNameRecursively(String str, ArrayList<Element> arrayList) {
            if (this.children != null) {
                for (int i = 0; i < this.children.size(); i++) {
                    Element element = this.children.get(i);
                    if (element.name.equals(str)) {
                        arrayList.add(element);
                    }
                    element.getChildrenByNameRecursively(str, arrayList);
                }
            }
        }

        public float getFloatAttribute(String str) {
            return Float.parseFloat(getAttribute(str));
        }

        public float getFloatAttribute(String str, float f) {
            String attribute = getAttribute(str, null);
            if (attribute == null) {
                return f;
            }
            return Float.parseFloat(attribute);
        }

        public int getIntAttribute(String str) {
            return Integer.parseInt(getAttribute(str));
        }

        public int getIntAttribute(String str, int i) {
            String attribute = getAttribute(str, null);
            if (attribute == null) {
                return i;
            }
            return Integer.parseInt(attribute);
        }

        public boolean getBooleanAttribute(String str) {
            return Boolean.parseBoolean(getAttribute(str));
        }

        public boolean getBooleanAttribute(String str, boolean z) {
            String attribute = getAttribute(str, null);
            if (attribute == null) {
                return z;
            }
            return Boolean.parseBoolean(attribute);
        }

        public String get(String str) {
            String str2 = get(str, null);
            if (str2 != null) {
                return str2;
            }
            throw new RuntimeException("Element " + this.name + " doesn't have attribute or child: " + str);
        }

        public String get(String str, String str2) {
            String text2;
            String str3;
            HashMap<String, String> hashMap = this.attributes;
            if (hashMap != null && (str3 = hashMap.get(str)) != null) {
                return str3;
            }
            Element childByName = getChildByName(str);
            return (childByName == null || (text2 = childByName.getText()) == null) ? str2 : text2;
        }

        public int getInt(String str) {
            String str2 = get(str, null);
            if (str2 != null) {
                return Integer.parseInt(str2);
            }
            throw new RuntimeException("Element " + this.name + " doesn't have attribute or child: " + str);
        }

        public int getInt(String str, int i) {
            String str2 = get(str, null);
            if (str2 == null) {
                return i;
            }
            return Integer.parseInt(str2);
        }

        public float getFloat(String str) {
            String str2 = get(str, null);
            if (str2 != null) {
                return Float.parseFloat(str2);
            }
            throw new RuntimeException("Element " + this.name + " doesn't have attribute or child: " + str);
        }

        public float getFloat(String str, float f) {
            String str2 = get(str, null);
            if (str2 == null) {
                return f;
            }
            return Float.parseFloat(str2);
        }

        public boolean getBoolean(String str) {
            String str2 = get(str, null);
            if (str2 != null) {
                return Boolean.parseBoolean(str2);
            }
            throw new RuntimeException("Element " + this.name + " doesn't have attribute or child: " + str);
        }

        public boolean getBoolean(String str, boolean z) {
            String str2 = get(str, null);
            if (str2 == null) {
                return z;
            }
            return Boolean.parseBoolean(str2);
        }
    }
}
