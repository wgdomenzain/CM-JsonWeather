//
//  ViewController.h
//  CM-Json
//
//  Created by Walter Gonzalez Domenzain on 11/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Declarations.h"
#import "Parser.h"

@interface Start : UIViewController
@property (nonatomic,strong)    Declarations            *Declarations;
@property (nonatomic,strong)    Parser                  *Parser;
@property (strong, nonatomic) IBOutlet UILabel *lblTemp;
@property (strong, nonatomic) IBOutlet UILabel *lblMax;
@property (strong, nonatomic) IBOutlet UILabel *lblMin;
@property (strong, nonatomic) IBOutlet UILabel *lblPressure;
@property (strong, nonatomic) IBOutlet UILabel *lblHumidity;

@end

