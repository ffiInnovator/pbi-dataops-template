@Visual
Feature: SampleModel Visuals

Background: SampleModel Configuration Setup
    Given that we have access to the Power BI Report named "SampleModel"
    And that we have the Report configuration files

Scenario: Validate Report Settings
    Given that we have the report settings
    Then the default section is the 1st section
    #Then all report-level measures have a prefix: "{MEASURE_PREFIX}"
    #And the report uses a custom theme named "{THEME_FILE}"
    And the Persistent Filters setting is disabled
    And the Visual Option "Hide the visual header in reading view" is disabled 
    And the Visual Option "Use the modern visual header with updated styling options" is enabled
    And the Visual Option "Change default visual interaction from cross highlighting to cross filtering" is disabled
    And the Export data setting is "export summarized data only"
    And the Filtering experience "Allow users to change filter types" is enabled 
    And the Filtering experience "Enable search for the filter pane" is enabled
    And the Cross-report drillthrough setting "Allow visuals in this report to use drillthrough targets from other reports" is disabled
    And the Personalize visuals setting "Allow report readers to personalize visuals to suit their needs" is disabled
    And the Developer Mode setting "Turn on developer mode for custom visuals for this session" is disabled
    And the Default summarizations setting "For aggregated fields, always show the default summarization type" is disabled

Scenario Outline: Validate Section Settings
    Given that we have the section: <Section>
    #Then the section has their canvas set with the background image named "{IMAGE_FILE}"
    And the section has a width of 1280px and a height of 720px

    Scenarios: Sections
    | Section |
	|Page 1|

Scenario Outline: Validate Non Decorative Visuals
    Given that we have the <VisualType> with the ID <VisualID> located in section: <Section>. Config Path: <ConfigPath>
    Then the visual should have a title. Config Path: <ConfigPath>
    And ensure alt text is added to the visual if it is a non-decorative visual. Config Path: <ConfigPath>
    And all visual level filters for the visual are hidden or locked in the filter pane. Config Path: <ConfigPath>
    
    Scenarios: Visuals
    | Section | VisualType  | VisualID | ConfigPath |
	|Page 1|shape|fb0533340c00746789ac|\pbi\SampleModel\PbixProj\Report\sections\000_Page 1\visualContainers\-9999000_Divider Line\config.json|
	|Page 1|clusteredBarChart|790ad0f608ee45b48d59|\pbi\SampleModel\PbixProj\Report\sections\000_Page 1\visualContainers\00000_Characters by Eye Color\config.json|
	|Page 1|card|ae9c7ada95c7c5d294d3|\pbi\SampleModel\PbixProj\Report\sections\000_Page 1\visualContainers\01000_card (ae9c7)\config.json|
	|Page 1|slicer|8823c9fce3db19aec38e|\pbi\SampleModel\PbixProj\Report\sections\000_Page 1\visualContainers\02000_Date Slicer\config.json|
	|Page 1|slicer|c3c147760d0d3ad62a09|\pbi\SampleModel\PbixProj\Report\sections\000_Page 1\visualContainers\04000_Alignment Slicer\config.json|
	|Page 1|clusteredBarChart|cb9b48525e8e70780eb8|\pbi\SampleModel\PbixProj\Report\sections\000_Page 1\visualContainers\05000_Top Ten Appearances\config.json|
	|Page 1|lineChart|7ff5063be9393370363c|\pbi\SampleModel\PbixProj\Report\sections\000_Page 1\visualContainers\06000_lineChart (7ff50)\config.json|
