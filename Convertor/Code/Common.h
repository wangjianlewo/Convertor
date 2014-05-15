
#pragma mark - postion

#define kInputTextViewX 23.0f
#define kInputTextViewY (iPhone5 ? (65.0f) : (55.0f))
#define kInputTextViewW 275.0f
#define kInputTextViewH (iPhone5 ? (180.0f) : (150.0f))

#define kConvertTextViewH (iPhone5 ? (170.0f) : (135.0f))
#define kConvertTextViewY (iPhone5 ? (315.0f) : (268.0f))

#define kActionButtonX 42.0f
#define kActionButtonY (iPhone5 ? (260.0f) : (220.0f))
#define kActionButtonW 32.0f
#define kActionButtonH 39.0f

#define kActionButtonSpace 70.0f

#pragma mark - common

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kSystemFont(fontSize) [UIFont systemFontOfSize:fontSize]

