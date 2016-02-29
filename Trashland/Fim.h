#import <UIKit/UIKit.h>
#import "Player.h"

@interface Fim : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UIImageView *cityNameLabel;
@property (nonatomic) IBOutlet UIImageView* fundo;
@property (nonatomic) Player* player;

@end
