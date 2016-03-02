#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Player : NSObject

@property (nonatomic, assign) BOOL firstMedal;
@property (nonatomic, assign) BOOL secondMedal;

@property (nonatomic, assign) BOOL thirdMedal;
@property (nonatomic, assign) BOOL fourthMedal;

@property (nonatomic, assign) BOOL fifthMedal;
@property (nonatomic, assign) BOOL sixthMedal;

@property (nonatomic, assign) BOOL seventhMedal;
@property (nonatomic, assign) BOOL eigthMedal;

@property (nonatomic, strong) NSString *nomeEscolhido;

@property (nonatomic, strong) UIImage *gasperEscolhido;

+ (id)sharedManager;

@end
