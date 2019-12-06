import { Image } from './image.model';
import { FieldValue } from './fieldvalue.model';

export class AdInfo {
    id: number;
    userId: number;
    categoryId: number;
    type: number;
    status: number;
    categoryIconUri: string;
    categoryName: string;
    postedOn: Date;
    price: number;
    title: string;
    imageUrls: Image[];
    fieldValues: FieldValue[];
    offerCount: number;
    commentCount: number;
    description: string;
    expiryDate: Date;
    contactFlag: boolean;
    removedReason: string;
    removedBy: number;
    removedOn: Date;

}