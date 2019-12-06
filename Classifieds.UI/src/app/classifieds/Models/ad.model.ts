import { Image } from './image.model';
export class Ad {
        id: number;
        type: number;
        status: number;
        categoryIconUri: string;
        categoryName: string;
        userIconUri: string;
        userName: string;
        postedOn: Date;
        price: number;
        title: string;
        imageUrls: Image[];
        offerCount: number;
        commentCount: number;
        description: string;
        location: string;
        expiryDate: Date;
        contactFlag: boolean;
  }