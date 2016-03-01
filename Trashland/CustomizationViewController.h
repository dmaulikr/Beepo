#import <UIKit/UIKit.h>

@protocol CustomizationViewControllerDelegate <NSObject>

- (void) askedToDismissCustomization;

@end

@interface CustomizationViewController : UIViewController

@property (nonatomic, assign) id <CustomizationViewControllerDelegate> delegate;

@property (nonatomic) IBOutlet UIView* chooseBar;

@property (nonatomic) IBOutlet UIImageView* item1;
@property (nonatomic) IBOutlet UIImageView* item2;
@property (nonatomic) IBOutlet UIImageView* item3;

@property (nonatomic) IBOutlet UIButton* changeLeft;
@property (nonatomic) IBOutlet UIButton* changeRight;

@property (nonatomic) IBOutlet UIButton* firstChoice;
@property (nonatomic) IBOutlet UIButton* secondChoice;
@property (nonatomic) IBOutlet UIButton* thirdChoice;

@property (nonatomic) IBOutlet UIView* viewGasper;
@property (nonatomic) IBOutlet UIImageView* sombra;
@property (nonatomic) IBOutlet UIImageView* gasper;

@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoSom;

@end
