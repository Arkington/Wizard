{
  "$GMRoom":"",
  "%Name":"rGreatWizardGate",
  "creationCodeFile":"rooms/rGreatWizardGate/RoomCreationCode.gml",
  "inheritCode":false,
  "inheritCreationOrder":true,
  "inheritLayers":false,
  "instanceCreationOrder":[
    {"name":"inst_5B50DF7F","path":"rooms/rGreatWizardGate/rGreatWizardGate.yy",},
    {"name":"inst_3ED6BF7A","path":"rooms/rGreatWizardGate/rGreatWizardGate.yy",},
    {"name":"inst_1BD414F3","path":"rooms/rGreatWizardGate/rGreatWizardGate.yy",},
    {"name":"inst_50E011E6","path":"rooms/rGreatWizardGate/rGreatWizardGate.yy",},
    {"name":"inst_5519B338","path":"rooms/rGreatWizardGate/rGreatWizardGate.yy",},
    {"name":"inst_4F681209","path":"rooms/rGreatWizardGate/rGreatWizardGate.yy",},
    {"name":"inst_3C60AE6F","path":"rooms/rGreatWizardGate/rGreatWizardGate.yy",},
  ],
  "isDnd":false,
  "layers":[
    {"$GMRInstanceLayer":"","%Name":"Text","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"name":"Text","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRTileLayer":"","%Name":"Walls","depth":100,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Walls","properties":[],"resourceType":"GMRTileLayer","resourceVersion":"2.0","tiles":{"SerialiseHeight":14,"SerialiseWidth":21,"TileCompressedData":[
          -4,-2147483648,1,1,-11,-2147483648,1,1,-8,-2147483648,1,1,-11,-2147483648,1,1,-8,-2147483648,1,1,-11,
          -2147483648,1,1,-8,-2147483648,1,1,-11,-2147483648,1,1,-8,-2147483648,1,1,-11,-2147483648,1,1,-8,-2147483648,
          1,1,-11,-2147483648,1,1,-8,-2147483648,1,1,-11,-2147483648,1,1,-6,-2147483648,-3,1,-11,-2147483648,-3,
          1,-4,-2147483648,1,1,-15,-2147483648,1,1,-4,-2147483648,1,1,-15,-2147483648,1,1,-4,-2147483648,1,1,-15,
          -2147483648,1,1,-4,-2147483648,1,1,-15,-2147483648,1,1,-4,-2147483648,1,1,-15,-2147483648,1,1,-4,-2147483648,
          1,1,-15,-2147483648,3,1,-2147483648,-2147483648,
        ],"TileDataFormat":1,},"tilesetId":{"name":"tsWall","path":"tilesets/tsWall/tsWall.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"$GMRInstanceLayer":"","%Name":"Instances","depth":200,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"","%Name":"inst_5B50DF7F","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_5B50DF7F","objectId":{"name":"oPlayer","path":"objects/oPlayer/oPlayer.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":168.0,"y":184.0,},
        {"$GMRInstance":"","%Name":"inst_1BD414F3","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_1BD414F3","objectId":{"name":"oGreatWizardGate","path":"objects/oGreatWizardGate/oGreatWizardGate.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":2.2300653,"scaleY":1.0833334,"x":16.0,"y":72.0,},
        {"$GMRInstance":"","%Name":"inst_3ED6BF7A","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_3ED6BF7A","objectId":{"name":"oBird","path":"objects/oBird/oBird.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":104.0,"y":66.0,},
        {"$GMRInstance":"","%Name":"inst_50E011E6","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_50E011E6","objectId":{"name":"oInteractTile","path":"objects/oInteractTile/oInteractTile.yy",},"properties":[
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"on_interact","path":"objects/pEntity/pEntity.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"load_textnode",},
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"on_interact_args","path":"objects/pEntity/pEntity.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"[\"textGreatWizardGate\", \"gate_check\"]",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":5.0,"scaleY":1.5,"x":128.0,"y":112.0,},
        {"$GMRInstance":"","%Name":"inst_5519B338","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_5519B338","objectId":{"name":"oInteractTile","path":"objects/oInteractTile/oInteractTile.yy",},"properties":[
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"on_interact","path":"objects/pEntity/pEntity.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"GreatWizardGate_CheckBird",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":104.0,"y":120.0,},
        {"$GMRInstance":"","%Name":"inst_4F681209","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_4F681209","objectId":{"name":"oWarpTile","path":"objects/oWarpTile/oWarpTile.yy",},"properties":[
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"oWarpTile","path":"objects/oWarpTile/oWarpTile.yy",},"propertyId":{"name":"target_room","path":"objects/oWarpTile/oWarpTile.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"rGWGPathBelow",},
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"oWarpTile","path":"objects/oWarpTile/oWarpTile.yy",},"propertyId":{"name":"target_x","path":"objects/oWarpTile/oWarpTile.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"48",},
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"oWarpTile","path":"objects/oWarpTile/oWarpTile.yy",},"propertyId":{"name":"target_y","path":"objects/oWarpTile/oWarpTile.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"24",},
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"oWarpTile","path":"objects/oWarpTile/oWarpTile.yy",},"propertyId":{"name":"relative_x","path":"objects/oWarpTile/oWarpTile.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"True",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":15.0,"scaleY":1.0,"x":48.0,"y":216.0,},
        {"$GMRInstance":"","%Name":"inst_3C60AE6F","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_3C60AE6F","objectId":{"name":"oWarpTile","path":"objects/oWarpTile/oWarpTile.yy",},"properties":[
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"oWarpTile","path":"objects/oWarpTile/oWarpTile.yy",},"propertyId":{"name":"target_room","path":"objects/oWarpTile/oWarpTile.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"rGWGPathAbove",},
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"oWarpTile","path":"objects/oWarpTile/oWarpTile.yy",},"propertyId":{"name":"target_x","path":"objects/oWarpTile/oWarpTile.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"80",},
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"oWarpTile","path":"objects/oWarpTile/oWarpTile.yy",},"propertyId":{"name":"relative_x","path":"objects/oWarpTile/oWarpTile.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"True",},
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"oWarpTile","path":"objects/oWarpTile/oWarpTile.yy",},"propertyId":{"name":"target_y","path":"objects/oWarpTile/oWarpTile.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"208",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":11.0,"scaleY":1.0,"x":80.0,"y":-8.0,},
      ],"layers":[],"name":"Instances","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRTileLayer":"","%Name":"TilesUpper","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":false,"layers":[],"name":"TilesUpper","properties":[],"resourceType":"GMRTileLayer","resourceVersion":"2.0","tiles":{"SerialiseHeight":14,"SerialiseWidth":21,"TileCompressedData":[
          -7,-2147483648,1,500,-5,36,3,498,0,0,-12,-2147483648,1,500,-5,36,3,498,0,0,-8,-2147483648,-4,0,1,500,
          -5,36,1,498,-4,0,-6,-2147483648,-4,0,1,500,-5,36,1,498,-4,0,-5,-2147483648,-5,0,1,500,-5,36,1,498,-3,
          0,-4,-2147483648,-7,0,1,500,-5,36,1,498,-3,0,-7,-2147483648,-4,0,1,500,-5,36,1,498,-3,0,-6,-2147483648,
          -5,0,1,500,-5,36,1,498,-3,0,-6,-2147483648,-5,0,1,500,-5,36,3,498,0,0,-7,-2147483648,-5,0,1,500,-5,36,
          3,498,0,0,-7,-2147483648,-5,0,1,500,-5,36,3,498,0,0,-12,-2147483648,1,500,-5,36,3,498,0,0,-12,-2147483648,
          1,500,-5,36,3,498,0,0,-12,-2147483648,1,500,-5,36,3,498,0,0,-5,-2147483648,
        ],"TileDataFormat":1,},"tilesetId":{"name":"tsPixelPackTopDown8bit","path":"tilesets/tsPixelPackTopDown8bit/tsPixelPackTopDown8bit.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"$GMRTileLayer":"","%Name":"TilesMain","depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":false,"layers":[],"name":"TilesMain","properties":[],"resourceType":"GMRTileLayer","resourceVersion":"2.0","tiles":{"SerialiseHeight":14,"SerialiseWidth":21,"TileCompressedData":[
          5,481,480,481,480,481,-11,499,10,480,481,480,481,480,497,496,497,496,497,-11,499,10,496,497,496,497,
          496,481,480,481,480,481,-11,499,10,480,481,480,481,480,497,496,497,496,497,-11,499,10,496,497,496,497,
          496,481,480,481,480,481,-11,499,10,480,481,480,481,480,497,496,497,496,497,-11,499,10,496,497,496,497,
          496,481,480,481,480,481,-11,499,10,480,481,480,481,480,497,496,497,496,497,-11,499,8,496,497,496,497,
          496,481,480,481,-15,499,6,480,481,480,497,496,497,-15,499,6,496,497,496,481,480,481,-15,499,6,480,481,
          480,497,496,497,-15,499,6,496,497,496,481,480,481,-15,499,6,480,481,480,497,496,497,-15,499,3,496,497,
          496,
        ],"TileDataFormat":1,},"tilesetId":{"name":"tsPixelPackTopDown8bit","path":"tilesets/tsPixelPackTopDown8bit/tsPixelPackTopDown8bit.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"$GMRBackgroundLayer":"","%Name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Background","properties":[],"resourceType":"GMRBackgroundLayer","resourceVersion":"2.0","spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "name":"rGreatWizardGate",
  "parent":{
    "name":"Lower Bizzaire",
    "path":"folders/Rooms Overworld/Lower Bizzaire.yy",
  },
  "parentRoom":{
    "name":"rParent",
    "path":"rooms/rParent/rParent.yy",
  },
  "physicsSettings":{
    "inheritPhysicsSettings":true,
    "PhysicsWorld":false,
    "PhysicsWorldGravityX":0.0,
    "PhysicsWorldGravityY":10.0,
    "PhysicsWorldPixToMetres":0.1,
  },
  "resourceType":"GMRoom",
  "resourceVersion":"2.0",
  "roomSettings":{
    "Height":224,
    "inheritRoomSettings":true,
    "persistent":false,
    "Width":336,
  },
  "sequenceId":null,
  "views":[
    {"hborder":32,"hport":672,"hspeed":-1,"hview":224,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1008,"wview":336,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings":{
    "clearDisplayBuffer":true,
    "clearViewBackground":false,
    "enableViews":true,
    "inheritViewSettings":true,
  },
  "volume":1.0,
}