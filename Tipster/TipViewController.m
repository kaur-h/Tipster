//
//  TipViewController.m
//  Tipster
//
//  Created by Harleen Kaur on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;
@property (weak, nonatomic) IBOutlet UIView *billContainerView;
@property (weak, nonatomic) IBOutlet UILabel *billCurrency;
@property (weak, nonatomic) IBOutlet UILabel *TipCurrency;
@property (weak, nonatomic) IBOutlet UILabel *TotalCurrency;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.billField becomeFirstResponder];
    [self hideLabels];
    self.billCurrency.text = NSLocale.currentLocale.currencySymbol;
    self.TipCurrency.text = NSLocale.currentLocale.currencySymbol;
    self.TotalCurrency.text = NSLocale.currentLocale.currencySymbol;
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onTap:(id)sender {

    [self.view endEditing:true];
}
- (IBAction)updateLabels:(id)sender {
    
    if (self.billField.text.length == 0){
        [self hideLabels];
    }

    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f", total];
    
    if (self.billField.text.length != 0){
        [self showLabels];
    }
    
}

- (void) hideLabels{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billContainerView.frame;
        billFrame.origin.y = 384;
        billFrame.origin.x = 63;
        self.billContainerView.frame = billFrame;
        
        self.labelsContainerView.alpha = 0;
        self.tipPercentageControl.alpha = 0;
        
    }];
    
}

- (void) showLabels{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billContainerView.frame;
        billFrame.origin.y = 200;
        self.billContainerView.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y = 400;
        self.labelsContainerView.frame = labelsFrame;
        
        CGRect controlFrame = self.tipPercentageControl.frame;
        controlFrame.origin.y = 360;
        self.tipPercentageControl.frame = controlFrame;
        
        self.labelsContainerView.alpha = 1;
        self.tipPercentageControl.alpha = 1;
        
        
    }];
}

@end
