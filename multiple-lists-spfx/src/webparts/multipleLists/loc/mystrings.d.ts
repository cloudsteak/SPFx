declare interface IMultipleListsWebPartStrings {
  PropertyPaneDescription: string;
  BasicGroupName: string;
  DescriptionFieldLabel: string;
}

declare module 'MultipleListsWebPartStrings' {
  const strings: IMultipleListsWebPartStrings;
  export = strings;
}
