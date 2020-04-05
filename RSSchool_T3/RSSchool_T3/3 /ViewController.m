#import "ViewController.h"

@interface ViewController()

@property(nonatomic, strong) UILabel *labelResultColor;
@property(nonatomic, strong) UILabel *labelRed;
@property(nonatomic, strong) UILabel *labelGreen;
@property(nonatomic, strong) UILabel *labelBlue;

@property(nonatomic, strong) UIView *viewResultColor;

@property(nonatomic, strong) UITextField *textFieldRed;
@property(nonatomic, strong) UITextField *textFieldGreen;
@property(nonatomic, strong) UITextField *textFieldBlue;

@property(nonatomic, strong) UIButton *buttonProcess;

@end

@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIColor *lightRed = [UIColor colorWithRed:140 green:0 blue:0 alpha:1];
    UIColor *lightGreen = [UIColor colorWithRed:0 green:50 blue:0 alpha:1];
    UIColor *lightBlue = [UIColor colorWithRed:0 green:0 blue:140 alpha:1];
    
    self.labelResultColor = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 100, 50)];
    self.labelResultColor.text = @"Color";
    self.labelResultColor.textColor = [UIColor blackColor];
    
    self.labelRed = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 100, 50)];
    self.labelRed.text = @"RED";
    self.labelRed.textColor = lightRed;

    
    self.labelGreen = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, 100, 50)];
    self.labelGreen.text = @"GREEN";
    self.labelGreen.textColor = lightGreen;
    
    self.labelBlue = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 100, 50)];
    self.labelBlue.text = @"BLUE";
    self.labelBlue.textColor = lightBlue;
    
    [self.view addSubview:self.labelResultColor];
    [self.view addSubview:self.labelRed];
    [self.view addSubview:self.labelGreen];
    [self.view addSubview:self.labelBlue];
    
    
    self.viewResultColor = [[UIView alloc] initWithFrame:CGRectMake(140, 55, 160, 40)];
    
    
    self.textFieldRed = [[UITextField alloc] initWithFrame:CGRectMake(120, 110, 180, 30)];
    self.textFieldRed.backgroundColor = [UIColor whiteColor];
    self.textFieldRed.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldRed.textColor = [UIColor blackColor];
    self.textFieldRed.tintColor = [UIColor blackColor];
    self.textFieldRed.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"0..255" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    
    
    
    self.textFieldGreen = [[UITextField alloc] initWithFrame:CGRectMake(120, 160, 180, 30)];
    self.textFieldGreen.backgroundColor = [UIColor whiteColor];
    self.textFieldGreen.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldGreen.textColor = [UIColor blackColor];
    self.textFieldGreen.tintColor = [UIColor blackColor];
    self.textFieldGreen.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"0..255" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    
   
    
    self.textFieldBlue = [[UITextField alloc] initWithFrame:CGRectMake(120, 210, 180, 30)];
    self.textFieldBlue.backgroundColor = [UIColor whiteColor];
    self.textFieldBlue.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldBlue.textColor = [UIColor blackColor];
    self.textFieldBlue.tintColor = [UIColor blackColor];
    self.textFieldBlue.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"0..255" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    
    [self.view addSubview:self.textFieldBlue];
    [self.view addSubview:self.viewResultColor];
    [self.view addSubview:self.textFieldGreen];
    [self.view addSubview:self.textFieldRed];
    
    
    [self.textFieldRed addTarget:self action:@selector(focus) forControlEvents:UIControlEventEditingDidBegin];
    [self.textFieldGreen addTarget:self action:@selector(focus) forControlEvents:UIControlEventEditingDidBegin];
    [self.textFieldBlue addTarget:self action:@selector(focus) forControlEvents:UIControlEventEditingDidBegin];
    
    self.buttonProcess = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2 - 50, 260, 100, 40)];
    [self.buttonProcess setBackgroundColor:[UIColor lightGrayColor]];
    [self.buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [self.buttonProcess setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.buttonProcess.layer.cornerRadius = 20;
    self.buttonProcess.layer.borderWidth = 2;
    [self.buttonProcess addTarget:self action:@selector(buttonHighlited) forControlEvents:UIControlEventTouchDown];
    [self.buttonProcess addTarget:self action:@selector(process) forControlEvents:UIControlEventTouchDown];
    [self.buttonProcess addTarget:self action:@selector(buttonNormalised) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonProcess];
    
    self.view.accessibilityIdentifier = @"mainView";
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    self.buttonProcess.accessibilityIdentifier = @"buttonProcess";
    self.labelRed.accessibilityIdentifier = @"labelRed";
    self.labelGreen.accessibilityIdentifier = @"labelGreen";
    self.labelBlue.accessibilityIdentifier = @"labelBlue";
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    
}

- (void)focus {
    if (![self.labelResultColor.text isEqualToString:@"Color"]) {
        self.labelResultColor.text = @"Color";
        self.textFieldRed.text = @"";
        self.textFieldGreen.text = @"";
        self.textFieldBlue.text = @"";
        self.viewResultColor.backgroundColor = [UIColor clearColor];
    }
}

- (void)buttonHighlited {
    [self.buttonProcess setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.buttonProcess setBackgroundColor:[UIColor blackColor]];
}

- (void)buttonNormalised {
    [self.buttonProcess setBackgroundColor:[UIColor lightGrayColor]];
    [self.buttonProcess setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (void)process {
    NSCharacterSet *exceptDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    double red = [self.textFieldRed.text doubleValue];
    double green = [self.textFieldGreen.text doubleValue];
    double blue = [self.textFieldBlue.text doubleValue];
    
    if (self.textFieldRed.text.length && self.textFieldGreen.text.length && self.labelBlue.text.length &&
        [self.textFieldRed.text rangeOfCharacterFromSet:exceptDigits].length == 0 &&
        [self.textFieldGreen.text rangeOfCharacterFromSet:exceptDigits].length == 0 &&
        [self.textFieldBlue.text rangeOfCharacterFromSet:exceptDigits].length == 0 &&
        (red <= 255 && red >= 0) && (green <= 255 && green >= 0) && (blue <= 255 && blue >= 0)) {
        self.viewResultColor.backgroundColor = [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:1];
        self.labelResultColor.text = [self hexStringForColor:self.viewResultColor.backgroundColor];
        
    }
    else {
        self.labelResultColor.text = @"Error";
        self.viewResultColor.backgroundColor = [UIColor clearColor];
    }
    [self.textFieldRed resignFirstResponder];
    [self.textFieldGreen resignFirstResponder];
    [self.textFieldBlue resignFirstResponder];
}

- (NSString *)hexStringForColor:(UIColor *)color {
      const CGFloat *components = CGColorGetComponents(color.CGColor);
      CGFloat r = components[0];
      CGFloat g = components[1];
      CGFloat b = components[2];
    NSString *hexString=[NSString stringWithFormat:@"0x%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
      return hexString;
}

@end

